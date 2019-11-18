(*

Parser para Natrix 

*)

%{
  open Ast
%}

%token <int> INT
%token <string> IDENT
%token TYPE, VAR, ARRAY, OF, FILLED, BY, INTEGER, IF, THEN, ELSE, FOREACH, IN, DO, PRINT, SIZE
%token EOF

%token LPARENT RPARENT
%token LBRACKET RBRACKET
%token LKEY RKEY
%token PLUS MINUS TIMES DIV
%token EQUAL NOTEQUAL
%token BIGGER BIGGEREQUAL SMALLER SMALLEQUAL

/* definição das prioridades e associatividades dos tokens */
%left PLUS MINUS
%left MUL DIV

/* ponto de entrada da gramática */
%start prog

/* tipo dos valores devolvidos pelo parser */
%type <Ast.program> prog
%%

prog:
| p = inst* EOF { p }
;

/*

var	_name_ : type = 0	;	
							vtype   ---> 	tipos
							vvalue	---> 	valores

		Ver suporte para mais tipos de dados: (Apesar de não dito)
				float
				string

_name_ := 0 ; 
			ver quando _name_ é array

_name_ + _name_ ;

print(_name_);

*/

inst:                                  
| VAR id = IDENT COLON vt = vtype EQUAL val = vvalue SEMICOLON						{ Set (id, vt, val) }
| id = IDENT COLON EQUAL val = vvalue SEMICOLON										{ ReSet (id, val) }
| PRINT LPARENT id = IDENT RPARENT	SEMICOLON										{ Print (id) }
| IF LPARENT t = test RPARENT THEN LKEY ins = inst RKEY 							{ If (t, ins) }
| IF LPARENT t = test RPARENT THEN LKEY ins = inst RKEY ELSE LKEY ins2 = inst RKEY	{ IfE (t, ins) }  																											 { Nop } /* não fazer nada */ 	 
;

vtype:
| ti = INTEGER																		{ I ti }

vvalue:
| vi = INT 		  																	{ Int vi }

expr:
| ci = INT                        					                         		{ I ci }
| id = IDENT                     					                           		{ Var id }
| e1 = expr o = op e2 = expr     					                           		{ Op (o, e1, e2) }
| LPARENT e = expr RPARENT                					                   		{ e }
;

test:
| e1 = expr EQUAL e2 = expr		 					                             	{ Equal (e1, e2) }
| e1 = expr NOTEQUAL e2 = expr 														{ NotEqual (e1, e2) }
| e1 = expr BIGGER e2 = expr		 					                            { Bigger (e1, e2) }
| e1 = expr BIGGEREQUAL e2 = expr 													{ BiggerEqual (e1, e2) }
| e1 = expr SMALLER e2 = expr		 					                            { Smaller (e1, e2) }
| e1 = expr SMALLEREQUAL e2 = expr													{ Bigger (e1, e2) }
;

%inline op:
| PLUS  				              												{ Add }
| MINUS 																	 		{ Sub }
| MUL 																		       	{ Mul }
| DIV 																			 	{ Div }
;