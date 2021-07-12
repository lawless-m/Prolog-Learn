
alldif([]).
alldif([H|T]) :- alldif(H, T).
alldif(_, []).
alldif(E, [H|[]]) :- dif(E, H).
alldif(E, [H|T]) :- dif(E, H), alldif(E, T), alldif(H, T).

allmembers([], _).
allmembers([H|T], Db) :- member(H, Db), allmembers(T, Db).

differentMembers(Ms, Db) :- alldif(Ms), allmembers(Ms, Db).

% members
members(Db) :-
  Db = [A,B,C,D],
  length(A, 4), length(B,4), length(C,4), length(D,4).
  
values(Db) :-
  allmembers([ [1|_], [2|_], [3|_], [4|_] ], Db),
  allmembers([ [_,lindsay,_,_], [_,oxford,_,_], [_,portola,_,_], [_,quimby,_,_] ], Db),
  allmembers([ [_,_,8,_], [_,_,12,_], [_,_,18,_], [_,_,22,_] ], Db),
  allmembers([ [_,_,_,25], [_,_,_,27], [_,_,_,37], [_,_,_,34] ], Db).


% 1. Lindsay has a forecasted low of 12 degrees.
  rule1(Db) :-  member([_,lindsay, 12, _], Db).

% 2. Neither Oxford nor the town
%    with a forecasted low of 22 degrees
%    is the town that will get 2 inches of snow.

  rule2(Db) :-
    O = [_,oxford,_,_],
    T2 = [_,_,22,_],
    S2 = [2,_,_,_],

    differentMembers( [O,T2,S2], Db).


%  3. Oxford will get 1 less inch of snow than
%     the town with a forecasted high of 34 degrees.

  rule3(Db) :-
    member(Oxsnow, [1,2,3]),
    O = [Oxsnow,oxford,_,_],
    member(O,Db),
    H34Snow is +(Oxsnow, 1),
    H34 = [H34Snow,_,_,34],
    member(H34, Db),
    dif(O, H34).


% 4. Lindsay will get 2 more inches of snow than
%     the town with a forecasted high of 34 degrees.

    rule4(Db) :-
      member(Lsnow, [1,2,3,4]),
      member(T32Snow, [1,2,3,4]),
      Lsnow is +(T32Snow, 2),
      L = [Lsnow,lindsay,_,_],
      T32 = [T32Snow,_,_,34],
      member(L, Db),
      member(T32, Db).

% 5. Oxford has a forecasted low of 8 degrees.
  rule5(Db) :- member([_,oxford,8,_], Db).

% 6. Of the location that will get 3 inches of snow
%    and the location that will get 4 inches of snow,
%    one is Portola and the other has a predicted high of 27 degrees.

     rule6(Db) :-
       (P = [3,portola,_,_]; P = [4,portola,_,_]),
       (H27 = [3,_,_,27]; H27 = [4,_,_,27]),
       dif(P, H27),
       member(P, Db),
       member(H27, Db).


weathers(Ws) :-
  Ws = [ [1|_], [2|_], [3|_], [4|_] ],
  members(Ws),
  rule1(Ws),
  rule2(Ws),
  rule3(Ws),
  rule4(Ws),
  rule5(Ws),
  rule6(Ws),
  
 values(Ws),


  1=1.


