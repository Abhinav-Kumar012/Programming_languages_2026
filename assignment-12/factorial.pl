fact(1,1).
fact(N,X) :- N > 1, T is N-1, fact(T,Y), X is N*Y.