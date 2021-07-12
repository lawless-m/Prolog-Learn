append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).
prefix(P,L):-  append(P,_,L).
suffix(S,L):-  append(_,S,L).
sublist(SubL,L):-  suffix(S,L),  prefix(SubL,S).

claims(Cs) :-
         Cs = [
               [fred,_,_],
               [dilbert,_,_],
               [harry,_,_],
               [ivan,_,_]
              ],
         member([fred, 11, _], Cs), % #1
         member([_, 14, culver], Cs), % #2
         member(Z, [11,14]),
         B is +(Z,6),
         sublist([[_, Z, glacier], [dilbert, B, _]], Cs),
         member([ivan, _, york], Cs), % #4
         member([_, _, fuller], Cs),
         member([_,20,_], Cs).






