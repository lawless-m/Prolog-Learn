alldif([]).
alldif([H|T]) :- alldif(H, T).
alldif(_, []).
alldif(E, [H|T]) :- dif(E, H), alldif(E, T), alldif(H, T).

allmembers([], _).
allmembers([H|T], Db) :- member(H, Db), allmembers(T, Db).

difMembers(Ms, Db) :- alldif(Ms), allmembers(Ms, Db).

applyRules([], _).
applyRules([R|Rs], Db) :- call(rule(R, Db)), applyRules(Rs, Db).

solve(Db) :-
   findall(R, clause(rule(R, _), _), Rules),
   applyRules(Rules, Db), 
   values(Db).


