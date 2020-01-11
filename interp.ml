open Ast
open Format

(* Excepção levantada para assinalar um erro durante a interpretação *)
exception Error of string
let error s = raise (Error s)

(*  Valores:

    Int de 64 bits

    Listas são na verdade vetores redimensionáveis, porem neste contexto não há forma de modificar o comprimento.

*)
type value =
  | Vnone
  | Vbool of bool
  | Vint of int64
  | Vstring of string
  | Varray of (value array * int64 * int64)
  | Vinterval of (int64 * int64)

(* Vizualização *)
let rec print_value = function
  | Vint n -> printf "%s" (Int64.to_string n)
  | Vstring s -> printf "%s" s
  | Vbool true -> printf "True"
  | Vbool false -> printf "False"
  | Vinterval (a, b) -> printf "interval[%s to %s]" (Int64.to_string a) (Int64.to_string b)
  | Varray (arr, a, b) -> begin
      let sz = Array.length arr in
        printf "[";
        for i = 0 to sz-1 do print_value arr.(i); if i < sz-1 then printf ", " done;
        printf "]"
    end
  | _ -> error "unsupported print vaule"
  
(* Interpretação booleana

  Qualquer valor pode ser utilizado como um valor boleano:
  None, a lista vazia, a string vazia o inteiro 0 são considerados como False
  e qualquer outro valor como True

*)
let is_false = function
  | Vnone -> false
  | Vbool false -> false
  | Vstring "" -> false
  | Vint x -> (x = Int64.zero)
  | Varray (arr, linf, lsup) -> (Array.length arr) = 0
  | _ -> false

let is_true v = not (is_false v)

(* Comparações

  Comparações entre diferentes tipos
  
*)
let rec compare_list a1 n1 a2 n2 i =
  if i = n1 && i = n2 then 0
  else if i = n1 then -1
  else if i = n2 then 1
  else let c = compare_value a1.(i) a2.(i) in
       if c <> 0 then c else compare_list a1 n1 a2 n2 (i + 1)

and compare_value v1 v2 = match v1, v2 with
  (*| Vlist a1, Vlist a2 ->
    compare_list a1 (Array.length a1) a2 (Array.length a2) 0 *)
  | Vbool b1, Vint _ -> compare_value (Vint (if b1 then Int64.one else Int64.zero)) v2
  | Vint _, Vbool b2 -> compare_value v1 (Vint (if b2 then Int64.one else Int64.zero))
  | _ -> compare v1 v2


(* Interpretação dos operadores binários

   - o operador + é sobrecarregado : designa também a concatenação
     das listas e das strings
   - os operadores / e % devem levantar uma excepção se se tenta dividir
     por zero

*)
let binary_operation op v1 v2 =
  match op, v1, v2 with
    | Badd, Vint n1, Vint n2 -> Vint (Int64.add n1 n2)
    | Bsub, Vint n1, Vint n2 -> Vint (Int64.sub n1 n2)
    | Bmul, Vint n1, Vint n2 -> Vint (Int64.mul n1 n2)
    | Bdiv, Vint n1, Vint n2 -> Vint (Int64.div n1 n2)
    | Bequal, _, _ -> Vbool (compare_value v1 v2 = 0)
    | Bnotequal, _, _ -> Vbool (compare_value v1 v2 <> 0)
    | Bsmaller, _, _ -> Vbool (compare_value v1 v2 < 0)
    | Bsmallerequal, _, _ -> Vbool (compare_value v1 v2 <= 0)
    | Bbigger, _, _ -> Vbool (compare_value v1 v2 > 0)
    | Bbiggerequal, _, _ -> Vbool (compare_value v1 v2 >= 0)
    | _ -> error "unsupported operand types"


(*

  Variáveis introduzidas por atribuições são arquivadas numa tabela de hash passada como argumento às funções seguintes com o nome 'ctx'

*)
type ctx = (string, value) Hashtbl.t


let rec expression ctx = function
  | Ecst Cnone ->
      Vnone
  | Ecst (Cbool b) ->
      Vbool b
  | Ecst (Cint n) ->
      Vint n
  | Ecst (Cstring s) ->
      Vstring s
  | Eident id -> begin
    match id with
      | "maxint" -> (Vint Int64.max_int)
      | "minint" -> (Vint Int64.min_int)
      | _ -> if not (Hashtbl.mem ctx id) then error ("unbound variable " ^ id);
      Hashtbl.find ctx id
    end
  | Ebinop (Badd | Bsub | Bmul | Bdiv 
      | Bequal | Bnotequal | Bbigger | Bbiggerequal | Bsmaller | Bsmallerequal as op, e1, e2) ->
        binary_operation op (expression ctx e1) (expression ctx e2)
  | Einterval (e1, e2) ->
      let linf, lsup = (expr_int ctx e1), (expr_int ctx e2) in
        if linf > lsup then error "first limit need to be superior to the second limit";
        Vinterval ((expr_int ctx e1), (expr_int ctx e2))
  | Earray (id) ->
      if not (Hashtbl.mem ctx id) then error "unbound variable";
      Hashtbl.find ctx id
  | Eget (id, index) -> begin
      if not (Hashtbl.mem ctx id) then error ("unbound variable " ^ id);
      match Hashtbl.find ctx id with
        | Varray (arr, linf, lsup) ->
          if (expr_int ctx index) < linf or (expr_int ctx index) > lsup
          then error "index out of bounds"
          else arr.( Int64.to_int (Int64.sub (expr_int ctx index) linf) )    (*  !!!  64 BIT INTEGER CONVERSION !!!  *)
        | _ -> error "array expected"
    end
  | Esize e -> begin 
      match expression ctx e with 
        | Vnone -> Vint Int64.zero
        | Vint n -> Vint n
        | Vbool b -> if b then Vint Int64.one else Vint Int64.zero
        | Varray (arr, a, b) -> Vint (Int64.add (Int64.sub b a) Int64.one)
        | Vinterval (a, b) -> Vint (Int64.add (Int64.sub b a) Int64.one)
        | _ -> Vint Int64.zero
    end
  | _ -> error "unsupported expression"


(* interpretação de um valor e verificação de que se trata de um inteiro *)
and expr_int ctx e = match expression ctx e with
  | Vint n -> n
  | _ -> error "integer expected"

(* interpretação de uma instrução - não devolve nada *)
and statement ctx = function
  | Sassign (id, t, e) -> (*    Adicionar verificação para ver se corresponde com o tipo  /// Se já existir VAR ou TIPO com o nome vai redefinir  *)
    Hashtbl.replace ctx id (expression ctx e)
  | Sassignarray (id, t, e) -> (* Dá valores ao array // T é expressão Varray*)
    begin
      if not (Hashtbl.mem ctx t) then error ("unbound type " ^ t);
      match (Hashtbl.find ctx t) with
        | Varray (arr, linf, lsup) ->
          let narr = (Array.make (Int64.to_int (Int64.sub lsup linf) + 1) (expression ctx e)) in    (* !!!  Int64 CONVERSION  !!! *)
            Hashtbl.replace ctx id (Varray (narr, linf, lsup))
        | _ -> error "type array expected"
    end
  | Sreassign (id, e) ->
    if not (Hashtbl.mem ctx id) then error ("unbound variable " ^ id);
    Hashtbl.replace ctx id (expression ctx e)
  | Sreassignarray (id, e, v) -> begin
    if not (Hashtbl.mem ctx id) then error ("unbound variable " ^ id);
    match Hashtbl.find ctx id with 
      | Varray (arr, linf, lsup) ->
          if (expr_int ctx e) < linf or (expr_int ctx e) > lsup
          then error "index out of bounds"
          else begin
              arr.( Int64.to_int (Int64.sub (expr_int ctx e) linf) ) <- (expression ctx v);
              Hashtbl.replace ctx id (Varray (arr, linf, lsup))
            end
        | _ -> error "array expected"
      end
  | Sprint e ->
    print_value (expression ctx e); printf "@."
  | Sif (c, st) ->
    if is_true (expression ctx c) then (statement ctx st)
  | Sifelse (c, st, st2) ->
    if is_true (expression ctx c) then (statement ctx st) else (statement ctx st2)
  | Sforeach (id, range, st) -> begin
      match expression ctx range with
        | Vinterval (a, b) ->
          for i = Int64.to_int a to Int64.to_int b do begin
            Hashtbl.replace ctx id (Vint (Int64.of_int i)); statement ctx st
          end done
        | _ -> error "interval expected"
    end
  | Stype (id, e) -> (* Tipos simples são intervalos ou inteiros, então guardamos os como varáveis normais *)
    Hashtbl.replace ctx id (expression ctx e)
  | Stypearray (id, indices, vt) -> (* Tipo array / Indices pode ser um intervalo ou um inteiro  / Tipo array apenas define tamanho/indexing do array *)
    begin
      match expression ctx indices with
        | Vint n -> (* array 0 até n *)
          Hashtbl.replace ctx id (Varray ([||], Int64.zero, n))
        | Vinterval (a, b) -> (* array a até b *)
          Hashtbl.replace ctx id (Varray ([||], a, b))
        | _ -> error "integer or interval expected"
    end
  | Sblock sl ->
      block ctx sl

and block ctx = function
  | [] -> ()
  | s :: sl -> statement ctx s; block ctx sl


(* 

  Interpretação do programa 
  s é a lista de Instruções em forma de Sblock

*)
let program s =
  statement (Hashtbl.create 17) s

