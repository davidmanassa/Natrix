# Natrix

## Resume

Tipos são:
- Tipo int
- Tipo intervalo
- Tipo array (Apenas inicializa com certo tamanho / indexing)

Variáveis
- Int
- String
- ... 
- Array __tipo__ filled by __value__ ( Dá valores ao tipo de array pre definido )


## TO DO

Interpreter:

    váriáveis locais:
        let x = 2 in x + 2 ;


Compiler: 

    bug fix (allow more prints)

    can do more little things

Report

## Simple Interpreter and Compiler for Natrix Language

Exercício 1: ( Programar Natrix )

- Escrever vários programas “clássicos” em Natrix (factorial, procura do maior
elemento, etc.). O objectivo é obter um conjunto pequeno mas representativos de
programas para testar o projecto a medida que este for completado.
- Numa pasta diferente, escrever programas (ou alterar do ponto anterior) de tal forma
que sejam propositadamente introduzidos erros (de sintaxe, de léxico, de tipagem,
problemas de intervalo etc.). Estes programas servirão para testar os casos negativos
que se espera que o resultado do projeto detecte.

_(Entrega 1)_

### 1 Análise léxica, sintáctica e árvore de sintaxe abstracta

Exercício 2: ( Gramática )
Defina uma gramática formal para a linguagem Natrix . Poderá usar a sintaxe EBNF caso
seja conveniente.

Exercício 3: ( Parsing and Lexing )
Defina um analisador léxico e um analisador sintáctico para a linguagem Natrix . Os
analisadores construídos deverão ter em conta uma gestão apropriada dos erros que possam
surgir (por enquanto léxicos e sintácticos).

Exercício 4: ( Árvore de sintaxe abstracta )
Defina o tipo das árvore de sintaxe para a linguagem Natrix.

Exercício 5: ( Lexing e Parsing (bis) )
Modifique os analisadores léxicos e sintácticos por forma a que seja construída uma árvore
de sintaxe abstracta no caso de uma análise bem sucedida. O parser e o lexer construídos
deverão, mais uma vez, assinalar de forma clara e precisa os erros.

_(Entrega 2)_

### 2 Análise Semântica

Exercício 6: ( Semântica Operacional )
Defina uma semântica operacional para o subconjunto básico da linguagem Natrix (sem os
tipos intervalo, por exemplo). É deixado ao vosso critério a definição deste subconjunto. É
no entanto necessário comunicar ao doente a escolha.

Exercício 7: ( Semântica Operacional (opcional) )
Integre na semântica definida no exercício anterior o resto da linguagem Natrix.

Exercício 8: ( Interpretador )
Implemente um interpretador com base na semântica definida nos pontos anteriores.

_(Entrega 3)_

### 3 Geração de Código

Exercício 9: ( Compilador )
Implemente o gerador de código para o maior núcleo possível da linguagem Natrix.

_(Entrega 4)_
