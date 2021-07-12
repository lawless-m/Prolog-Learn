notmember(_, []).
notmember(E, [E|_]) :- fail.
notmember(E, [F|T]) :- E \= F, notmember(E, T).

