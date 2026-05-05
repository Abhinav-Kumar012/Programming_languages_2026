arith : arith.cmi arith.cmo main.cmo
	ocamlc arith.cmo main.cmo -o arith

arith.cmo : arith.cmi arith.ml
	ocamlc -c arith.ml

arith.cmi : arith.mli
	ocamlc -c arith.mli

main.cmo : arith.cmi main.ml
	ocamlc -c main.ml

clean:
	rm arith *.cmo *.cmi
