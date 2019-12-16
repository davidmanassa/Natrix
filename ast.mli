
(* Arvore de sintaxe abstracta *)

type ident = string

type binary_operation =
  | Badd | Bsub | Bmul | Bdiv

type constant =
  | Cnone
  | Cbool of bool
  | Cstring of string
  | Cint of int

type expression =
  | Ecst of constant
  | Eident of ident
  | Ebinop of binary_operation * expression * expression

and statement =
  | Sassign of ident * expression
  | Sprint of expression
  | Sblock of statement list

and program = statement