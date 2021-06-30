<<<<<<< HEAD
numeral(0).
numeral(succ(X)) :- numeral(X).

gt(succ(_), 0).

gt(succ(G), succ(L)) :- gt(G, L).

=======
num(0).

num(succ(X)) :- num(X).

gt(succ(0), 0).

gt(succ(G), succ(L)) :- gt(G, L).






>>>>>>> 33d72c2bd72538d5d99f5c914fbe735e7ea3ac14
