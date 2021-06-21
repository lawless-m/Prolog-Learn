din(iani, nasha).
din(nasha, olga).
din(olga, kata).

in(X, Y) :- din(X, Y).

in(X, Y) :- din(X, Z), in(Z, Y).


