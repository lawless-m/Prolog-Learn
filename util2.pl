
notmember(_, []).
notmember(E, [F|Ls]) :- E\=F, notmember(E, Ls).

differentMembers([], _).
differentMembers([H|T], Ls) :- member(H, Ls), notmember(H, T), differentMembers(T, Ls).

append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).

prefix(P,L):-  append(P,_,L).
suffix(S,L):-  append(_,S,L).

sublist(SubL,L):-  suffix(S,L),  prefix(SubL,S).

splitOn(E, [H|T], Prefix, Suffix) :- splitOn(E, [H|T], [], Prefix, Suffix).

splitOn(E, [E|L], RPrefix, Prefix, L) :- reverse(RPrefix, Prefix).

splitOn(E, [H|L], RPrefix, Prefix, L) :- H \= E, splitOn(E, L, [H|RPrefix], Prefix, L).

