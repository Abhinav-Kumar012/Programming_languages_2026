len([],0).
len(L,N) :- [_ | T] = L, len(T,P), N is P+1.

not(compare_list([_|_],[])).
not(compare_list([],[_|_])).
not(member([],_)).
member([H | T],X) :- (X = H ; member(T,X)).

rev_helper([],I,I).
rev_helper([H|T],I,R) :- P = [H | I], rev_helper(T,P,R).

reverse_list(L,R) :- rev_helper(L,[],R).

append_h([],L,L).
append_h([H | T],L2,LA) :- P = [H | L2], append_h(T,P,LA).

myappend(L1,L2,LA) :- reverse_list(L1,R), append_h(R,L2,LA).

compare_list([],[]).
compare_list([H1 | T1],[H2 | T2]) :- H1 = H2, compare_list(T1,T2).

is_palindrome(L) :- reverse_list(L,R), compare_list(L,R).

even_len(L) :- len(L,N), 0 =:= N mod 2.

duplicate_h([],I,I).
duplicate_h([H | T],I,LA) :- member(I,H) -> duplicate_h(T,I,LA) ; duplicate_h(T,[H | I],LA).

remove_duplicate(L,LA) :- duplicate_h(L,[],P), reverse_list(P,LA).