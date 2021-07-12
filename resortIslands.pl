% https://logic.puzzlebaron.com/play.php?u2=14951b8bfcb2e4355414274ef6e8fc7b

values(Db) :-
	allmembers([ [175|_], [195|_], [215|_], [235|_] ], Db),
	allmembers([ [_,azure,_,_], [_,emerald,_,_], [_,grand,_,_], [_,silver,_,_] ], Db),
	allmembers([ [_,_,barbados,_], [_,_,grenada,_], [_,_,martinique,_], [_,_,barts,_] ], Db),
	allmembers([ [_,_,_,hang], [_,_,_,kayak], [_,_,_,paraglide], [_,_,_,spa] ], Db).

% 1. The resort that costs $195 per night offers hang gliding.
rule(1, Db) :- 
	member([195,_,_,hang], Db).

% 2. Grand Echo costs 20 dollars more per night than the hotel on Barbados.
rule(2, Db) :- 
	member(Gcost, [175,195,215,235]),
	member(Bcost, [175,195,215,235]),
	Gcost is +(Bcost, 20),
	G = [Gcost,grand,_,_],
	B = [Bcost,_,barbados,_],
	difMembers([ G,B ], Db).

% 3. Of the hotel on Martinique and the resort that offers spa services, 
% one is Silver Harbor and the other costs $215 per night.
rule(3, Db) :- 
	( M = [215,_,martinique,_] ; M = [_,silver,martinique,_] ),
	( Spa = [215,_,_,spa]; Spa = [_,silver,_,spa]),
	difMembers([ M, Spa ], Db).

% 4. The resort on Grenada is either the resort that offers parasailing or Grand Echo.
rule(4, Db) :- 
	( G=[_,grand,grenada,_]; G=[_,_,grenada,paraglide] ),
	member(G, Db).

% 5. Of the hotel that offers spa services and the option on Grenada,
%  one costs $235 per night and the other is Grand Echo.

rule(5, Db) :-
	(Spa = [235,_,_,spa]; Spa = [_,grand,_,spa]),
	(Gren = [235,_,grenada,_]; Gren = [_,grand,grenada,_]),
	difMembers([ Spa, Gren ], Db).

% 6. Azure Hills costs more per night than the hotel that offers parasailing.
rule(6, Db) :-
	member(Acost, [175,195,215,235]),
	member(Pcost, [175,195,215,235]),
	Acost > Pcost,
	A = [Acost,azure,_,_],
	P = [Pcost,_,_,paraglide],
	difMembers([ A,P ], Db).



