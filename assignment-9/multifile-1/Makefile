CC = ocamlc

shape : shape.cmo main.cmo
	$(CC) shape.cmo main.cmo -o shape
shape.cmo : shape.cmi shape.ml
	$(CC) -c shape.ml
shape.cmi : shape.mli
	$(CC) -c shape.mli
main.cmo : main.ml
	$(CC) -c main.ml

clean : 
	rm *.cmi *.cmo shape