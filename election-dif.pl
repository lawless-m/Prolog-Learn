% https://logic.puzzlebaron.com/play.php?u2=41e87beff656e2950346cd8b09480252

day(X) :- member(X, [14, 15, 16, 17]).

alldif([]).
alldif([H|T]) :- alldif(H, T).
alldif(_, []).
alldif(E, [H|[]]) :- dif(E, H).
alldif(E, [H|T]) :- dif(E, H), alldif(E, T), alldif(H, T).

allmembers([], _).
allmembers([H|T], Db) :- member(H, Db), allmembers(T, Db).

differentMembers(Ms, Db) :- alldif(Ms), allmembers(Ms, Db).

election(Cs) :-
	Cs = [ [14|_], [15|_], [16|_], [17|_] ],

	% 1. Fred Maddox was the Libertarian.
	member([_, fred, libertarian, _], Cs),

	% 2. The politician whose speech brought in 2,600 attendees,
	%    the Socialist, and the speaker who spoke on January 16th
        %    are three different people.

    differentMembers([ [_,_,_,2600], [16,_,_,_], [_,_,socialist,_] ], Cs),

	% 3. The speaker who spoke on January 16th, Ashley Dale,
	%    and the candidate whose speech brought in 1,200 attendees are three different people.

	differentMembers([ [16,_,_,_], [_,ashley,_,_], [_,_,_,1200] ], Cs),

	% 4. The Objectivist spoke 1 day before Daniel Stead.
	
    day(Dday),
    day(Oday),
    Oday is +(Dday, -1),

	differentMembers([ [Dday,daniel,_,_], [Oday,_,objectivist,_] ], Cs),

	% 5. Edith Frayle spoke in front of 1,200 attendees.

	member([_, edith, _, 1200], Cs),

	% 6. The person who spoke on January 17th, Ashley Dale, 
	%    and the person whose speech brought in 1,875 attendees are three different people.

	differentMembers([[17,_,_,_], [_,ashley,_,_], [_,_,_,1875]], Cs),

	% 7. The candidate whose speech brought in 1,600 attendees spoke 1 day after the Libertarian.

    day(Day16),
    day(Lday),
    Day16 is +(Lday,1),
	differentMembers([ [Day16,_,_,1600], [Lday,_,libertarian,_] ], Cs),
	


	allmembers([ [_,ashley,_,_], [_,daniel,_,_], [_,edith,_,_], [_,fred,_,_] ], Cs),
	allmembers([ [_,_,libertarian,_], [_,_,objectivist,_], [_,_,reformist,_], [_,_,socialist,_] ], Cs),
	allmembers([ [_,_,_,1200], [_,_,_,1600], [_,_,_,1875], [_,_,_,2600] ], Cs),
	
	1=1.


	
