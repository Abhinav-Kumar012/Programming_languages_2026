ocamlc -c arith.mli
ocamlc -c arith.ml
ocamlc -c main.ml
ocamlc arith.cmo main.cmo -o arith
