
(* Arvore de sintaxe abstracta *)

type ident = string

type binary_operation =
  | Badd | Bsub | Bmul | Bdiv
  | Bequal | Bnotequal | Bbigger | Bbiggerequal | Bsmaller | Bsmallerequal
  | Band | Bor

type value_type = 
  | Tint

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
  | Sassign of ident * value_type * expression
  | Sreassign of ident * expression 
  | Sprint of expression
  | Sif of expression * statement
  | Sifelse of expression * statement * statement 
  | Sblock of statement list

and program = statement