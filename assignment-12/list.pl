len([],0).
len(L,N) :- [_ | T] = L, len(T,P), N is P+1.

not(member([],_)).
member(L,X) :- [H | T] = L, (X = H ; member(T,X)).

append(L,[],L).
append([],L,L).
 