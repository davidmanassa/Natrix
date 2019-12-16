open Ast
open Format

(* Excepção levantada para assinalar um erro durante a interpretação *)
exception Error of string
let error s = raise (Error s)

(* Os valores de Mini-Python

   - uma diferença notável com Python : utilizamos aqui o tipo int "máquina"
     enquanto os inteiros de Python têm precisão arbitrária ; poderiamos
     utilizar o tipo Big_int de OCaml mas preferimos aqui a opção cómoda
     e fácil ;

   - o que Python designa de lista é na verdade um vector redimensionável ;
     no fragmento aqui considerado, não há forma de modificar o comprimento,
     logo um simples vector OCaml chegará *)

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

   Em Python, qualquer valor pode ser utilizado como um valor boleano :
   None, a lista vazia, a string vazia o inteiro 0 são considerados como
   False e qualquer outro valor como True *)

let is_false = function
  | Vnone
  | Vbool false
  | Vstring ""
  | Vlist [||] -> true
  | Vint n -> n = 0
  | _ -> false

let is_true v = not (is_false v)

(* Comparações (questão opcional)

   Vamos aqui nos esforçar parea aceitar comparações enter booleanos e
   inteiros, mas apesar de tal esforço, permaneçam diferenças com o
   Python.

   De fqcto em Python (3) recusa comparações tais como  True < None
   ou ainda "" < []  que aqui são ainda aceites. *)

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
  | Ebinop (Badd | Bsub | Bmul | Bdiv as op, e1, e2) ->
      binary_operation op (expression ctx e1) (expression ctx e2)
  | _ -> error "unsupported expression"


(* interpretação de um valor e verificação de que se trata de um inteiro *)
and expr_int ctx e = match expression ctx e with
  | Vint n -> n
  | _ -> error "integer expected"


(* interpretação de uma instrução - não devolve nada *)
and statement ctx = function
  | Sassign (id, e1) ->
      Hashtbl.replace ctx id (expression ctx e1)
  | Sprint e ->
      print_value (expression ctx e); printf "@."
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


(* interpretação de um ficheiro *)
(* let file (fl, s) =
  List.iter
    (fun (f,args,body) -> Hashtbl.add functions f (args, body)) fl;
  stmt (Hashtbl.create 17) s
*)