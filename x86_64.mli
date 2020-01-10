
(* Bibliothèque pour produire du code assembleur X86-64
   Biblioteca para produzir código Assembly X86-64

   2015 Jean-Christophe Filliâtre (CNRS)
        Kim Nguyen (Université Paris Sud)

    [Comments translation to PT - Simão Melo de Sousa]
*)

(** {0 Biblioteca para a escrita de programas X86-64 }

    trata-se de um fragmento relativamente pequeno do 
    assembly X86-64. *)

(** O módulo {!X86_64} permite a escrita de código X86-64 dentro de código 
    OCaml, sem utilizar pre-processadores.  Um exemplo completo é dado 
    {{:#1_Exempl}abaixo, na secção Exemplo}. *)

type 'a asm
  (** tipo abstracto para representar código assembly. O parâmetro 
      ['a] é acrescentado como um tipo fantasma. *)

type text = [ `text ] asm
  (** tipo representando código assembly que se encontra na zona de texto *)

type data = [ `data ] asm
  (** tipo do código assembly que se encontra na zona dos dados *)

val nop : [> ] asm
  (** a instrução vazia. Pode encontrar-se no texto ou nos dados *)

val ( ++ ) : ([< `text|`data ] asm as 'a)-> 'a -> 'a
  (** junta dois pedaços de código (text com text,  data com data) *)

type program = {
  text : text;
  data : data;
}
  (** um programa é constituído de uma zona de texto e de uam zona de dados *)

val print_program : Format.formatter -> program -> unit
  (** [print_program fmt p] imprime o código do programa [p] no formatter [fmt] *)

val print_in_file: file:string -> program -> unit

type register
  (** Tipo abstracto para os registos *)

val rax: register
val rbx: register
val rcx: register
val rdx: register
val rsi: register
val rdi: register
val rbp: register
val rsp: register
val r8 : register
val r9 : register
val r10: register
val r11: register
val r12: register
val r13: register
val r14: register
val r15: register
  (** Constantes representando os registos manipuláveis. *)


type label = string
  (** Os rótulos (labels) dos endereços são strings *)

type operand
  (** O tipo abstracto das operandas *)

val imm: int -> operand
  (** $i *)
val reg: register -> operand
val ind: ?ofs:int -> ?index:register -> ?scale:int -> register -> operand
  (** ofs(register, index, scale) *)
val lab: label -> operand
  (** L  *)
val ilab: label -> operand
  (** $L *)

(** {1 Move} *)

val movq: operand -> operand -> text
  (** cuidado : nem todas as combinações de operandas são permitidas *)

(** {1 Operações aritméticas } *)

val leaq: operand -> register -> text

val addq: operand -> operand -> text
val subq: operand -> operand -> text
val imulq: operand -> operand -> text
val idivq: operand -> text

val negq: operand -> text

(** {1 Operações lógicas } *)

val andq: operand -> operand -> text
val orq : operand -> operand -> text
val xorq: operand -> operand -> text
val notq: operand -> text
  (** Operações de manipulação de bits. "e" bitwise, "ou" bitwise, "not" bitwise *)

(** {1 Saltos } *)

val jmp : label -> text
  (** salto incondicional *)

val call: label -> text
val ret: text
  (** chamada de função e retorno *)

(** {1 Diversos } *)

val label : label -> [> ] asm
  (** um label. Pode estar na zona text ou data *)
val glabel : label -> [> ] asm
  (** igual, com uma declaração .globl (para main, tipicamente) *)

val comment : string -> [> ] asm
  (** coloca um commentário no código gerado. Pode ficar na zona text ou data *)

val string : string -> data
  (** coloca uma constante string (terminada por 0) na zona data *)
val dbyte : int list -> data
val dword : int list -> data
val dint : int list -> data
val dquad : int list -> data
  (** coloca uma lista de valores de 1/2/4/8 bytes na zona data *)

val space: int -> data
  (** [space n] aloca [n] byte (valendo 0) no segmento dos dados *)

val inline: string -> [> ] asm
  (** [inline s] copia a string [s] tal e qual no ficheiro assembly *)

(** {1 Manipulação da pilha} *)

val pushq : register -> text
  (** [pushq r] coloca o conteúdo de [r] no topo da pilha.
      Nota : %rsp aponta para o endereço da última célula ocupada *)

val popq : register -> text
  (** [popq r] coloca a palavra encontrada no topo da pilha dentro de [r] e desempilha *)

