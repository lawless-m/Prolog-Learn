num(0).

num(succ(X)) :- num(X).

gt(succ(0), 0).

gt(succ(G), succ(L)) :- gt(G, L).






