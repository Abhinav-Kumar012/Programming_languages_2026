len([],0).
len(L,N) :- [_ | T] = L, len(T,P), N is P+1.

not(member([],_)).
member(L,X) :- [H | T] = L, (X = H ; member(T,X)).

rev_helper([],I,I).
rev_helper([H|T],I,R) :- P = [H | I], rev_helper(T,P,R).

reverse_list(L,R) :- rev_helper(L,[],R).

append_h([],L,L).
append_h([H | T],L2,LA) :- P = [H | L2], append_h(T,P,LA).

append_list(L1,L2,LA) :- reverse_list(L1,R), append_h(R,L2,LA).