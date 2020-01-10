CMO = lexer.cmo parser.cmo interp.cmo x86_64.cmo compile.cmo main.cmo
GENERATED = lexer.ml parser.ml parser.mli
FLAGS = -annot -g

all: natrix
	./natrix test.nx

.PHONY: tests
tests: natrix
	bash run-tests

natrix: $(CMO)
	ocamlc $(FLAGS) -o $@ nums.cma $(CMO)

.SUFFIXES: .mli .ml .cmi .cmo .mll .mly

.mli.cmi:
	ocamlc $(FLAGS) -c  $<

.ml.cmo:
	ocamlc $(FLAGS) -c $<

.mll.ml:
	ocamllex $<

.mly.ml:
	menhir -v $<

.mly.mli:
	menhir -v $<

clean:
	rm -f *.cm[io] *.o *.annot *~ natrix $(GENERATED)
	rm -f parser.output parser.automaton

.depend depend:$(GENERATED)
	rm -f .depend
	ocamldep *.ml *.mli > .depend

include .depend



