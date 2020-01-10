open Format
open X86_64
open Ast

(* alocação das variáveis *)

exception VarUndef of string

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

module Smap = Map.Make(String)

type local_env = ident Smap.t

let rec alloc_expr env next = function
  | Ecst i ->
    Ecst i, next

let alloc_stmt = function

  | Sprint e ->
    Sprint e

let alloc = List.map alloc_stmt

(******************************************************************************)
(* produção de código *)

let popn n = addq (imm n) (reg rsp)
let pushn n = subq (imm n) (reg rsp)

module StrMap = Map.Make(String)

let rec compile_expr =

    let rec comprec env next = function

      | Ebinop (o, e1, e2)->
          let op = match o with
            | Badd -> addq
            | Bsub -> subq
            | Bmul -> imulq
          in
          comprec env next e1 ++
          comprec env next e2 ++
          popq rbx ++
          popq rax ++
          op (reg rbx) (reg rax) ++
          pushq rax
    in
    comprec StrMap.empty 0

let compile_stmt = function

  | Sprint e -> 
    compile_expr e ++
    popq rdi ++
    call "print_int"

let compile_program p ofile =
  let code = compile_stmt p in
  let code = (++) code nop in
  let p =
    { text =
        glabel "main" ++
        movq (reg rsp) (reg rbp) ++
        code ++
        movq (imm 0) (reg rax) ++ (* exit *)
        ret ++
        label "print_int" ++
        movq (reg rdi) (reg rsi) ++
        movq (ilab ".Sprint_int") (reg rdi) ++
        movq (imm 0) (reg rax) ++
        call "printf" ++
        ret;
      data =
        Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l) genv
          (label ".Sprint_int" ++ string "%d\n")
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f

