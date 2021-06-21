din(i, n).
din(n, o).
din(o, k).

in(X, Y) :- din(X, Y).

in(X, Y) :- din(X, Z), in(Z, Y).


