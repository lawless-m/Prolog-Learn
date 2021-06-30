
second(X, [_|[X|_]]).


swap12([E1|[E2|T]], [E2|[E1|T]]).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).


listtran([], []).
listtran([G|Gt],[E|Et]) :- tran(G, E), listtran(Gt, Et).

twice([], []).
twice([A|At], [A|[A|Bt]]) :- twice(At, Bt).

combine1([], [], []).
combine1([A|At], [B|Bt], [A|[B|Ct]]) :- combine1(At, Bt, Ct).


combine2([], [], []).
combine2([A|At], [B|Bt], [[A,B]|Ct]) :- combine2(At, Bt, Ct).

combine3([], [], []).
combine3([A|At], [B|Bt], [j(A, B)|Ct]) :- combine3(At, Bt, Ct).

