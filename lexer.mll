
(* Analizador léxico *)

{
  open Lexing
  open Ast
  open Parser

  exception Lexing_error of string

  let id_or_kwd =
    let h = Hashtbl.create 32 in
    List.iter (fun (s, tok) -> Hashtbl.add h s tok)
      [
        "type", TYPE;
        "var", VAR;
        "array", ARRAY;
        "of", OF;
        "filled", FILLED;
        "by", BY;
        "if", IF;
        "then", THEN;
        "else", ELSE;
        "foreach", FOREACH;
        "in", IN;
        "do", DO;
        "print", PRINT;
        "size", SIZE;
        "int", TINT
      ];
    
    fun s -> try Hashtbl.find h s with Not_found -> IDENT s

  let string_buffer = Buffer.create 1024

}

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit | '_')*
let integer = ['0'-'9']+
let space = ' ' | '\t'
let comment = "//" [^'\n']*

rule next_tokens = parse
  | (space | comment)+            { next_tokens lexbuf }
  | '\n'                          { new_line lexbuf; next_tokens lexbuf }
  | ident as id                   { [id_or_kwd id] }
  | '.'                           { [DOT] }
  | '+'                           { [PLUS] }
  | '-'                           { [MINUS] }
  | '*'                           { [TIMES] }
  | '/'                           { [DIV] }
  | "=="                          { [BINOP Bequal] }
  | "!="                          { [BINOP Bnotequal] }
  | '='                           { [EQUAL] }
  | ':'                           { [COLON] }
  | '('                           { [LPARENT] }
  | ')'                           { [RPARENT] }
  | '['			                      { [LBRACKET] }
	| ']'			                      { [RBRACKET] }
	| '{'			                      { [LKEY] }
	| '}'			                      { [RKEY] }
  | "<="                          { [BINOP Bsmallerequal] }
	| '<'			                      { [BINOP Bsmaller] }
  | ">="                          { [BINOP Bbiggerequal] }
	| '>'			                      { [BINOP Bbigger] }
  | ';'                           { [SEMICOLON] }
  | integer as s                  { try [CONSTANT (Cint (Int64.of_string s))] with _ -> raise (Lexing_error ("constant too large: " ^ s)) }
  | '"'                           { [CONSTANT (Cstring (string lexbuf))] }
  | eof                           { [EOF] }
  | _ as c                        { raise (Lexing_error ("illegal character: " ^ String.make 1 c)) }


and string = parse
  | '"'
      { let s = Buffer.contents string_buffer in
	Buffer.reset string_buffer;
	s }
  | "\\n"
      { Buffer.add_char string_buffer '\n';
	string lexbuf }
  | "\\\""
      { Buffer.add_char string_buffer '"';
	string lexbuf }
  | _ as c
      { Buffer.add_char string_buffer c;
	string lexbuf }
  | eof
      { raise (Lexing_error "unterminated string") }

{

  let next_token =
    let tokens = Queue.create () in (* próximos tokens por retornar *)
    fun lb ->
      if Queue.is_empty tokens then begin
	let l = next_tokens lb in
	List.iter (fun t -> Queue.add t tokens) l
      end;
      Queue.pop tokens
      
}
