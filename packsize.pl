% https://logic.puzzlebaron.com/play.php?u2=aa90063b7c9d845518223ab32eaf51f9

alldif([]).
alldif([H|T]) :- alldif(H, T).
alldif(_, []).
alldif(E, [H|T]) :- dif(E, H), alldif(E, T), alldif(H, T).

allmembers([], _).
allmembers([H|T], Db) :- member(H, Db), allmembers(T, Db).

differentMembers(Ms, Db) :- alldif(Ms), allmembers(Ms, Db).

applyRules([], _).
applyRules([R|Rs], Db) :- call(rule(R, Db)), applyRules(Rs, Db).


list_list1longer([], [_]).
list_list1longer([_|S], [_|[_|S]]).

cols(C, Db) :- length(Db, C).

cols(C, Db) :- list_list1longer(Db, DbL), cols(C, DbL).


rows(_, []).
rows(R, [C|Cs]) :- length(C, R), rows(R, Cs).

members(R, C, Db) :-  cols(C, Db), rows(R, Db).

values(Db) :-
  allmembers([ [25|_], [30|_], [35|_], [40|_] ], Db),
  allmembers([ [_,bistric,_,_], [_,grennel,_,_], [_,naturba,_,_], [_,pinkster,_,_] ], Db),
  allmembers([ [_,_,gray,_], [_,_,green,_], [_,_,purple,_], [_,_,silver,_] ], Db),
  allmembers([ [_,_,_,myrna], [_,_,_,eugene], [_,_,_,donna], [_,_,_,howie] ], Db).

packsize(Db, Rules) :-
   members(4,4, Db),
   applyRules(Rules, Db),
   values(Db).

% 1. Eugene's pack is 5 liters larger than the green pack.
rule(1, Db) :-
    member(Esize, [25, 30, 35, 40]),
    member(Gsize, [25, 30, 35, 40]),
    Esize is +(Gsize, 5),

    E = [Esize, _, _, eugene],
    G = [Gsize, _, green, _],
    member(E, Db),
    member(G, Db).

%  2. Of Myrna's pack and the 35 liter pack, one is gray and the other is made by Naturba.
rule(2, Db) :-
   (M = [_,_,gray,myrna]; M = [_,naturba,_,myrna] ),
   (L35 = [35,_,gray,_]; L35 = [35,naturba,_,_] ),
   differentMembers( [M,L35], Db).

% 3. Donna's pack is 5 liters smaller than the Bistric pack.
rule(3, Db) :-
  member(Dsize, [25,30,35,40]),
  member(Bsize, [25,30,35,40]),
  Dsize is +(Bsize, -5),
  D = [Dsize,_,_,donna],
  B = [Bsize,bistric,_,_],
  member(D, Db),
  member(B, Db).

% 4. Myrna's pack, the Grennel pack and the Bistric pack are all different packs.
rule(4, Db) :-
   M = [_,_,_,myrna],
   G = [_,grennel,_,_],
   B = [_,bistric,_,_],
   differentMembers([ M,G,B ], Db).

% 5. The Grennel pack is 10 liters larger than the green pack.
rule(5, Db) :-
   member(GrennS, [25,30,35,40]),
   member(GreenS, [25,30,35,40]),
   GrennS is +(GreenS, 10),
   Gr = [GrennS,grennel,_,_],
   Ge = [GreenS,_,green,_],
   differentMembers([ Gr, Ge ], Db).

% 6. The purple pack, the 25 liter pack, and Myrna's pack are three different packs.
rule(6, Db) :-
    P = [_,_,purple,_],
    L25 = [25,_,_,_],
    M = [_,_,_,myrna],
   differentMembers([ P,L25,M ], Db).







