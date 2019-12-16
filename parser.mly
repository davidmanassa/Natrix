
/* Analizador sintáctico para Natrix */

%{
  open Ast
%}

%token <Ast.constant> CONSTANT
%token <Ast.binary_operation> BINARYOPERATOR
%token <string> IDENT
%token PRINT
%token EOF
%token LP RP LSQ RSQ EQUAL SEMICOLON COLON NEWLINE VAR
%token PLUS MINUS TIMES DIV


/* Definição das prioridades e associatividades dos tokens */
%left PLUS MINUS
%left TIMES DIV MOD
%nonassoc unary_minus
%nonassoc LSQ


/* Ponto de entrada da gramática */
%start program


%type <Ast.program> program
%%

program:
    | sl = nonempty_list(statement) EOF                         { Sblock sl }
;

expression:
    | c = CONSTANT                                              { Ecst c }
    | id = ident                                                { Eident id }
    | e1 = expression o = binary_operator e2 = expression       { Ebinop (o, e1, e2) }
    | LP e = expression RP                                      { e }
;


statement:
    | id = ident EQUAL e = expression SEMICOLON                 { Sassign (id, e) }
    | PRINT LP e = expression RP SEMICOLON                      { Sprint e }
;


%inline binary_operator:
    | PLUS                                                      { Badd }
    | MINUS                                                     { Bsub }
    | TIMES                                                     { Bmul }
    | DIV                                                       { Bdiv }
;   


ident:
    id = IDENT                                                  { id }
;
