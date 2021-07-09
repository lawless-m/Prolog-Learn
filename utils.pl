
notmember(_, []).
notmember(E, [F|Ls]) :- E\=F, notmember(E, Ls).

differentMembers([], _).
differentMembers([H|T], Ls) :- member(H, Ls), notmember(H, T), differentMembers(T, Ls).


joined(E, L1, L2, Joined) :- append(L1, [E|L2], Joined).

 

