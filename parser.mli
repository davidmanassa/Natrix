
(* The type of tokens. *)

type token = 
  | VAR
  | VALUETYPE of (Ast.value_type)
  | TYPE
  | TINT
  | TIMES
  | THEN
  | SIZE
  | SEMICOLON
  | RPARENT
  | RKEY
  | RBRACKET
  | PRINT
  | PLUS
  | OR
  | OF
  | MINUS
  | LPARENT
  | LKEY
  | LBRACKET
  | IN
  | IF
  | IDENT of (string)
  | FOREACH
  | FILLED
  | EQUAL
  | EOF
  | ELSE
  | DOT
  | DO
  | DIV
  | CONSTANT of (Ast.constant)
  | COLON
  | BY
  | BINOP of (Ast.binary_operation)
  | ARRAY
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
