(* Parser para Natrix *)

%{
  open Ast
%}

%token <int> INT
%token <string> IDENT
%token TYPE, VAR, PRINT, IF, THEN, ELSE, FILLED, BY, FOREACH, DO, IN, TRUE, FALSE, MAXINT, MININT, SIZE
%token EOF


%token LP RP
%token PLUS MINUS TIMES DIV
%token EQ
%token COMP BIG BIGEQUAL SMALL SMALLEQUAL NEG

/* definição das prioridades e associatividades dos tokens */
%left PLUS MINUS
%left TIMES DIV

/* ponto de entrada da gramática */
%start prog

/* tipo dos valores devolvidos pelo parser */
%type <Ast.program> prog
%%

prog:
| p = inst* EOF { p }
;

inst:                                                          
| SET id = IDENT EQ e = expr SEQ 	 				                           { Dec (id, e) }
| id = IDENT EQ e = expr SEQ 				                                 { Set (id, e) }
| PRINT e = expr SEQ                  	 				                     { Print e }
| IF t = test THEN LP i1 = inst* RP ELSE LP i2 = inst* RP            { Cond (t, i1, i2) }
| WHILE t = test DO LP i = inst* RP					                         { Loop (t, i) }
| PASS SEQ    																											 { Nop } /* não fazer nada */ 	 
;

expr:
| ci = INT                        					                         { I ci }
| id = IDENT                     					                           { Var id }
| e1 = expr o = op e2 = expr     					                           { Op (o, e1, e2) }
| LP e = expr RP                					                           { e }
;

test:
| TRUE                                                               { B true }  
| FALSE                                                              { B false }     
| e1 = expr COMP e2 = expr		 					                             { Comp (e1, e2) }
| e1 = expr BIG e2 = expr		 					                               { Big (e1, e2) }
| e1 = expr BIGEQUAL e2 = expr		 					                         { BigEqual (e1, e2) }
| e1 = expr SMALL e2 = expr		 					                             { Small (e1, e2) }
| e1 = expr SMALLEQUAL e2 = expr		 					                       { SmallEqual (e1, e2) }
| NEG t = test		 			 					                { Neg t }
;

%inline op:
| PLUS  				              								{ Add }
| MINUS 																															 { Sub }
| TIMES 																											       { Mul }
| DIV 																															 { Div }
;