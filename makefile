all:
	ocamlbuild -use-ocamlfind -libs graphics,unix test.native
