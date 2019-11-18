(*

	Lexer para Natrix

	Keywords:

		type
		var
		array
		of
		filled
		.. by
		int
		if
		then
		else
		foreach
		.. in
		.. do 			{		}

	_________________TO DO ? _____________________

	Symbols:

		=
		!=
		<
		<=
		>
		>=
		&
		|
		{
		}
		[
		]
		(
		)
		:
		;
		+
		-
		*
		/

	functions:

		size
		print

	Constants:

		maxint
		minint = 0

*)

{
	open Lexing
	open Parser

	exception Lexing_error of char

	let kwd_tbl =
		[
			"type", TYPE;
			"var", VAR;
			"array", ARRAY;
			"of", OF;
			"filled", FILLED;
			"by", INTEGER;
			"if", IF;
			"then", THEN;
			"else", ELSE;
			"foreach", FOREACH;
			"in", IN;
			"do", DO;
			"print", PRINT;
			"size", SIZE
		]

	let id_or_kwd s = try List.assoc s kwd_tbl with _ -> IDENT s

	let newline lexbuf =
		let pos = lexbuf.lex_curr_p in
			lexbuf.lex_curr_p <- {
				pos with pos_lnum = pos.pos_lnum + 1;
				pos_bol = pos.pos_cnum  
			}
}

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit)*
let integer = ['0'-'9']+
let space = [' ' '\t']

let equal = ['=']
let negation = ['!']
let bigger = ['>']
let smaller = ['<']
let biggerequal = bigger equal
let smallerequal = smaller equal
let notequal = negation equal

(*	| "#" [^'\n']* '\n' { newline lexbuf; token lexbuf } *)

rule token = parse
	| "\n"			{ newline lexbuf; token lexbuf }
	| "/" 			{comment lexbuf} 
	| space+		{ token lexbuf }
	| ident as id 	{ id_or_kwd id }
	| "+"			{ PLUS }
	| "-"			{ MINUS }
	| "*"			{ MUL }
	| "/"			{ DIV }
	| "="			{ EQUAL }
	| ":"			{ COLON }
	| ";"			{ SEMICOLON }
	| "("			{ LPARENT }
	| ")"			{ RPARENT }
	| "["			{ LBRACKET }
	| "]"			{ RBRACKET }
	| "{"			{ LKEY }
	| "}"			{ RKEY }
	| "<"			{ SMALLER }	 
	| ">"			{ BIGGER }
	| smallerequal  { SMALLEREQUAL }
	| biggerequal 	{ BIGGEREQUAL }
	| notequal		{ NOTEQUAL }
	| integer as s 	{ CST (int_of_string s) }
	| eof			{ EOF }
	| _ as c		{ raise (Lexing_error c) }

and comment = parse
	| "/" { comment lexbuf }
	| _ {comment lexbuf }
	| '\n' { token lexbuf }
	| eof { raise (Lexing_error "eof") }


