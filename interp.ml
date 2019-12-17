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
  | Vint of int
  | Vstring of string
  | Vlist of value array


(* Vizualização *)
let rec print_value = function
  | Vint n -> printf "%d" n
  | Vstring s -> printf "%s" s
  | _ -> error "unsupported print vaule"
  
(* Interpretação booleana

  Qualquer valor pode ser utilizado como um valor boleano:
  None, a lista vazia, a string vazia o inteiro 0 são considerados como False
  e qualquer outro valor como True

*)
let is_false = function
  | Vnone
  | Vbool false
  | Vstring ""
  | Vlist [||] -> true
  | Vint n -> n = 0
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
  | Vlist a1, Vlist a2 ->
    compare_list a1 (Array.length a1) a2 (Array.length a2) 0
  | Vbool b1, Vint _ -> compare_value (Vint (if b1 then 1 else 0)) v2
  | Vint _, Vbool b2 -> compare_value v1 (Vint (if b2 then 1 else 0))
  | _ -> compare v1 v2


(* Interpretação dos operadores binários

   - o operador + é sobrecarregado : designa também a concatenação
     das listas e das strings
   - os operadores / e % devem levantar uma excepção se se tenta dividir
     por zero

*)

let binary_operation op v1 v2 =
  match op, v1, v2 with
    | Badd, Vint n1, Vint n2 -> Vint (n1+n2)
    | Bsub, Vint n1, Vint n2 -> Vint (n1-n2)
    | Bmul, Vint n1, Vint n2 -> Vint (n1*n2)
    | Bdiv, Vint n1, Vint n2 -> Vint (n1/n2)
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
  | Eident id -> 
      if not (Hashtbl.mem ctx id) then error "unbound variable";
      Hashtbl.find ctx id
  | Ebinop (Badd | Bsub | Bmul | Bdiv 
      | Bequal | Bnotequal | Bbigger | Bbiggerequal | Bsmaller | Bsmallerequal as op, e1, e2) ->
        binary_operation op (expression ctx e1) (expression ctx e2)
  | _ -> error "unsupported expression"


(* interpretação de um valor e verificação de que se trata de um inteiro *)
and expr_int ctx e = match expression ctx e with
  | Vint n -> n
  | _ -> error "integer expected"

(* interpretação de uma instrução - não devolve nada *)
and statement ctx = function
  | Sassign (id, t, e) -> (*    Adicionar verificação para ver se corresponde com o tipo    *)
    Hashtbl.replace ctx id (expression ctx e)
  | Sreassign (id, e) ->
    if not (Hashtbl.mem ctx id) then error ("unbound variable " ^ id);
    Hashtbl.replace ctx id (expression ctx e)
  | Sprint e ->
    print_value (expression ctx e); printf "@."
  | Sif (c, st) ->
    if is_true (expression ctx c) then (statement ctx st)
  | Sifelse (c, st, st2) ->
    if is_true (expression ctx c) then (statement ctx st) else (statement ctx st2)
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

