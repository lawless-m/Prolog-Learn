

double([], [], []).
double([], [B|Bt], [B|Ct]) :- double([], Bt, Ct).
double([A|At], [B|Bt], [A|Ct]) :- double(At, [B|Bt], Ct).

double(L) :- double(Z, L), is_list(Z).
double([H|T], D) :- double([H|T], [H|T], D).

rev(Fwd, Rev) :- rev(Fwd, [], Rev).
rev([], Rev, Rev).
rev([H|T], P, Rev) :- rev(T, [H|P], Rev).

palindrome(F) :- rev(F, R), F = R.


toptail([_|[_|[]]], []).
toptail([_|In], Out) :- rev(In, [_|A]), rev(A, Out).

lastR(List, X) :- rev(List, [X|_]).

lastr([L|T], X) :- lastr(T, L, X).
lastr([], X, X).
lastr([H|T], _, X) :- lastr(T, H, X).


swapfl([H1|T1], [H2|T2]) :- swapfl(T1, T2, H1, H2).
swapfl([_|T1], [_|T2], H1, H2) :- swapfl(T1, T2, H1, H2).
swapfl([L1|[]], [L2|[]], H1, H2) :- swapfl([], [], H1, L2, H2, L1).
swapfl([], [], FL1, FL1, FL2, FL2).


flat([], []).
flat([H|T], Flat) :- flat([H|T], [], Flat).
flat([], Flat, Flat).
flat([H|T], A, Flat) :- is_list(H), flat(H, A, Sa), flat(T, Sa, Flat).
flat(H, A, Flat) :- flat([], [H|A], Flat).
