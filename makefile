all:
#	ocamlbuild -use-ocamlfind -libs graphics,unix test.native
	ocamlbuild -use-ocamlfind -libs unix test.native
