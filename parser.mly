
/* Analizador sintáctico para Natrix */

%{
  open Ast
%}

%token <Ast.constant> CONSTANT
%token <Ast.binary_operation> BINOP
%token <Ast.value_type> VALUETYPE
%token <string> IDENT
%token TYPE VAR ARRAY OF FILLED BY INTEGER IF THEN ELSE FOREACH IN DO PRINT SIZE EQUAL
%token EOF
%token LPARENT RPARENT LBRACKET RBRACKET LKEY RKEY
%token AND OR
%token SEMICOLON COLON NEWLINE
%token PLUS MINUS TIMES DIV

/* Definição das prioridades e associatividades dos tokens */
%left OR
%left AND

%nonassoc BINOP
%left PLUS MINUS
%left TIMES DIV


/* Ponto de entrada da gramática */
%start program


%type <Ast.program> program
%%

program:
    | sl = statement+ EOF                                           { Sblock sl }
;

expression:
    | c = CONSTANT                                                  { Ecst c }
    | id = ident                                                    { Eident id }
    | e1 = expression o = binary_operator e2 = expression           { Ebinop (o, e1, e2) }
    | LPARENT e = expression RPARENT                                { e }
;


statement:
    | VAR id = ident COLON t = value_type EQUAL e = expression SEMICOLON                                { Sassign (id, t, e) }  
    | id = ident COLON EQUAL e = expression SEMICOLON                                                   { Sreassign (id, e) }
    | PRINT LPARENT e = expression RPARENT SEMICOLON                                                    { Sprint e }
    | IF LPARENT c = expression RPARENT THEN LKEY st = statement+ RKEY                                  { Sif (c, Sblock st) }
    | IF LPARENT c = expression RPARENT THEN LKEY st = statement+ RKEY ELSE LKEY st2 = statement+ RKEY	{ Sifelse (c, Sblock st, Sblock st2) }
;


%inline value_type:
    | t=VALUETYPE                                                { t }                                                       
;

%inline binary_operator:
    | PLUS                                                      { Badd }
    | MINUS                                                     { Bsub }
    | TIMES                                                     { Bmul }
    | DIV                                                       { Bdiv }
    | c=BINOP                                                   { c }          
    | AND                                                       { Band }
    | OR                                                        { Bor }
;   


ident:
    id = IDENT                                                  { id }
;
