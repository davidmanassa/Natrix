open Ast 

exception error of string

(* Compilador de expressões *)
let compile_expr = 
  let rec comp env next = function
    | Ecst c -> ()
    | Eident id -> ()
    | Ebinop (Bdiv, e1, e2) ->
      comprec env next e1 ++
      comprec env next e2 ++
      movq (imm 0) (reg rdx) ++
      popq rbx ++
      popq rax ++
      idivq (reg rbx) ++
      pushq rax
    | Ebinop (o, e1, e2) ->
      let operator = match o with 
        | Badd -> addq
        | Bsub -> subq
        | Bmul -> imulq
        | Bdiv -> assert false
      in
        comprec env next e1 ++
        comprec env next e2 ++
        popq rbx ++
        popq rax ++
        operator (reg rbx) (reg rax) ++
        pushq rax
  in
    comp StrMap.empty 0








