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

  | _ -> assert false

let alloc_stmt = function

  | Sprint e ->
    Sprint e

  | _ -> assert false

let alloc = List.map alloc_stmt

(* produção de código *)

let popn n = addq (imm n) (reg rsp)
let pushn n = subq (imm n) (reg rsp)

module StrMap = Map.Make(String)

let rec compile_expr =

    let rec comprec env next = function

      | Ecst (Cint i) ->
        movq (imm  (Int64.to_int i)) (reg rax) ++
        pushq rax

      | Ebinop (Bdiv, e1, e2)->
        comprec env next e1 ++
        comprec env next e2 ++
        movq (imm 0) (reg rdx) ++
        popq rbx ++
        popq rax ++
        idivq (reg rbx) ++
        pushq rax

      | Ebinop (o, e1, e2)->
          let op = match o with
            | Badd -> addq
            | Bsub -> subq
            | Bmul -> imulq
            | _ -> assert false
          in
          comprec env next e1 ++
          comprec env next e2 ++
          popq rbx ++
          popq rax ++
          op (reg rbx) (reg rax) ++
          pushq rax

      | _ -> assert false
    
      in comprec StrMap.empty 0

let rec compile_stmt = function

  | Sprint e -> 
    compile_expr e ++
    popq rdi ++
    call "print_int"

  | Sblock bl ->
    block bl

  | _ -> assert false
  
and block = function
  | [a] -> compile_stmt a
  | s :: sl ->  nop; compile_stmt s; 
    block sl
  | _ -> assert false

let start p = 
  match p with
    | Sblock sb -> sb

let compile_program p ofile =
  let code = List.map compile_stmt (start p) in let code = List.fold_right (++) code nop in
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

