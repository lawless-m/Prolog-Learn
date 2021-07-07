% https://logic.puzzlebaron.com/play.php?u2=41e87beff656e2950346cd8b09480252

candidate(X) :- member(X, [ashley, daniel, edith, fred]).
party(X) :- member(X, [libertarian, objectivist, reformist, socialist]).
attend(X) :- member(X, [1200, 1600, 1875, 2600]).
day(X) :- member(X, [14, 15, 16, 17]).

election(Cs) :-
	Cs = [
		[day(14), candidate(_), party(_), attend(_)], 
		[day(15), candidate(_), party(_), attend(_)], 
		[day(16), candidate(_), party(_), attend(_)], 
		[day(17), candidate(_), party(_), attend(_)] 
	],

	% 1. Fred Maddox was the Libertarian.
	member([_, candidate(fred), party(libertarian), _], Cs),

	% 2. The politician whose speech brought in 2,600 attendees, 
	%    the Socialist, and the speaker who spoke on January 16th 
        %    are three different people.

	differentMembers([[_,_,_,attend(2600)], [day(16),_,_,_], [_,_,party(socialist),_]], Cs),

	% 3. The speaker who spoke on January 16th, Ashley Dale, 
	%    and the candidate whose speech brought in 1,200 attendees are three different people.

	differentMembers([ [day(16),_,_,_], [_,candidate(ashley),_,_], [_,_,_,attend(1200)]], Cs),

	% 4. The Objectivist spoke 1 day before Daniel Stead.

	differentMembers([[day(Dday),candidate(daniel), _,_], [day(+(Dday,-1)),_,party(objectivist),_]], Cs),

	% 5. Edith Frayle spoke in front of 1,200 attendees.

	member([_, candidate(edith), _, attend(1200)], Cs),

	% 6. The person who spoke on January 17th, Ashley Dale, 
	%    and the person whose speech brought in 1,875 attendees are three different people.

	differentMembers([[day(17),_,_,_], [_,candidate(ashley),_,_], [_,_,_,attend(1875)]], Cs),

	% 7. The candidate whose speech brought in 1,600 attendees spoke 1 day after the Libertarian.

	differentMembers([ [day(Day16k),_,_,attend(1600)], [day(+(Day16k,+1)),_,party(libertarian),_] ], Cs).


	
