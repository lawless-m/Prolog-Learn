

double([], [], []).
double([], [B|Bt], [B|Ct]) :- double([], Bt, Ct).
double([A|At], [B|Bt], [A|Ct]) :- double(At, [B|Bt], Ct).

double(L) :- double(Z, L), is_list(Z).
double([H|T], D) :- double([H|T], [H|T], D).


last([H|[]], H).
last([_|T], G) :- last(T, G).

reverse(Fwd, Rev) :- reverse(Fwd, [], Rev).
reverse([], Rev, Rev).
reverse([P|[U|[]]], R, Rev) :- reverse(P, [U|R], Rev).
reverse([_|T], R , Rev) :- last(T,L), reverse(T, [L|R], Rev).
