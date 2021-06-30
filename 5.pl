
increment(A, B) :- B is 1+A.


sum(A, B, C) :- C is A+B.

addone([], []).
addone([A|At], [B|Bt]) :- increment(A, B), addone(At,Bt).



min(List, Min) :- List = [H|T], accMin(T, H, Min).
accMin([], Min, Min).
accMin([H|T], A, Min) :- H < A, accMin(T, H, Min).
accMin([H|T], A, Min) :- H >= A, accMin(T, A, Min).


scalarMult(S, [], []) :- number(S).
scalarMult(S, [L|Lt], [R|Rt]) :- number(S), R is *(S,L), scalarMult(S, Lt, Rt).

dot(L1, L2, Dot) :- is_list(L1), is_list(L2), dot(L1, L2, 0, Dot).
dot([], [], Dot, Dot).
dot([H1|T1], [H2|T2], M, Dot) :- K is +(M,*(H1,H2)), dot(T1, T2, K, Dot).

