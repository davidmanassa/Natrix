
/* Analizador sintáctico para Natrix */

%{
  open Ast
%}

%token <Ast.constant> CONSTANT
%token <Ast.binary_operation> BINOP
%token <Ast.value_type> VALUETYPE
%token <string> IDENT
%token TYPE VAR ARRAY OF FILLED BY IF THEN ELSE FOREACH IN DO PRINT SIZE EQUAL
%token EOF
%token TINT
%token LPARENT RPARENT LBRACKET RBRACKET LKEY RKEY
%token AND OR
%token SEMICOLON COLON DOT
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
    | e1 = expression DOT DOT e2 = expression                       { Einterval (e1, e2)}
    | LBRACKET e1 = expression DOT DOT e2 = expression RBRACKET     { Einterval (e1, e2)}
    | id = ident LBRACKET e = expression RBRACKET                   { Eget (id, e) }
    | SIZE LPARENT e = expression RPARENT                           { Esize e }
    | LPARENT e = expression RPARENT                                { e }
;

statement:
    | VAR id = ident COLON t = value_type EQUAL e = expression SEMICOLON                                { Sassign (id, t, e) }
    | VAR id = ident COLON t = ident FILLED BY e = expression SEMICOLON                                 { Sassignarray (id, t, e) }
    | id = ident COLON EQUAL e = expression SEMICOLON                                                   { Sreassign (id, e) }
    | id = ident LBRACKET e = expression RBRACKET COLON EQUAL v = expression SEMICOLON              { Sreassignarray (id, e, v) }
    | PRINT LPARENT e = expression RPARENT SEMICOLON                                                    { Sprint e }
    | IF LPARENT c = expression RPARENT THEN LKEY st = statement+ RKEY                                  { Sif (c, Sblock st) }
    | IF LPARENT c = expression RPARENT THEN LKEY st = statement+ RKEY ELSE LKEY st2 = statement+ RKEY  { Sifelse (c, Sblock st, Sblock st2) }
    | FOREACH id = ident IN range = expression DO LKEY st = statement+ RKEY                             { Sforeach (id, range, Sblock st) }
    | TYPE id = ident EQUAL e = expression SEMICOLON                                                    { Stype (id, e) }
    | TYPE id = ident EQUAL ARRAY indices = expression OF vt = value_type SEMICOLON              { Stypearray (id, indices, vt) }
;

%inline value_type:
    | TINT                                                      { Tint }
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
