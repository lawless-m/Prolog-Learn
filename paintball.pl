xand(X, Y, L) :- member(X, L), member(Y, L), X \= Y.
xor(X, Y, L) :- (member(X, L); member(Y, L)), X \= Y.

pball(Pb) :-
  Pb = [
        [1,_,_],
        [2,_,_],
        [3,_,_],
        [4,_,_]
        ],

  % #1 The 'Target Bombs' uses red
  member([_, 'Target Bombs', red], Pb),

  % #2 The "Oil Crew" was ranked 1 place behind the yellow team
   member([Ypos,_,yellow], Pb),
   Oilp is +(Ypos, 1),
   member([Oilp, 'Oil Crew',_], Pb),

  % #3 The green team is either the "Spray Paints" or the squad that finished first.
  xor([_,'Spray Paints', green], [1,_,green], Pb),

  % # 4 The green team and the "Color Blinds" are different teams.
  xand([_, 'Color Blinds', _], [_,_,green], Pb),

  % # 5 The "Target Bombs" finished fourth.
  member([4, 'Target Bombs', _], Pb),

member([_,_,blue], Pb),
member([_,'Spray Paints',_], Pb).
