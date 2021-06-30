numeral(0).
numeral(succ(X)) :- numeral(X).

gt(succ(_), 0).

gt(succ(G), succ(L)) :- gt(G, L).

