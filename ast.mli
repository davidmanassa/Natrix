
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
  | Einterval of expression * expression
  | Earray of ident
  | Eget of ident * expression

and statement =
  | Sassign of ident * value_type * expression
  | Sassignarray of ident * ident * expression
  | Sreassign of ident * expression
  | Sreassignarray of ident * expression * expression
  | Sprint of expression
  | Sif of expression * statement
  | Sifelse of expression * statement * statement
  | Sforeach of ident * expression * statement
  | Sblock of statement list
  | Stype of ident * expression
  | Stypearray of ident * expression * value_type

and program = statement