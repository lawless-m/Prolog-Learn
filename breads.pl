xand(X, Y, L) :- member(X, L), member(Y, L), X \= Y.
xor(X, Y, L) :- (member(X, L); member(Y, L)), X \= Y.

before1h(T1, T2) :- T1='7:00am', T2='8:00am'.
before1h(T1, T2) :- T1='7:30am', T2='8:30am'.

before(T1, T2) :- T1='7:00am', member(T2,['7:30am','8:00am','8:30am']).
before(T1, T2) :- T1='7:30am', member(T2,['8:00am','8:30am']).
before(T1, T2) :- T1='8:00am', T2='8:30am'.

breads(Bs) :-
     Bs = [
           ['7:00am',_,_],
           ['7:30am',_,_],
           ['8:00am',_,_],
           ['8:30am',_,_]
          ],

      member([_,isabel,_], Bs),
      member([_,louise,_], Bs),
      member([_,willie,_], Bs),
      member([_,hilda,_], Bs),
      
     member([_,_,naan], Bs),
     member([_,_,challah], Bs),
     member([_,_,brioche], Bs),
     member([_,_,matzo], Bs),

     % 1. Isabel came in one hour before Willie.
     before1h(Itime, Wtime),
     member([Itime, isabel, _], Bs),
     member([Wtime, willie, _], Bs),


     % 2. Of the person who came in at 7:30am and Hilda,
     %    one asked for naan and the other asked for challah.

     xor(['7:30am', _, naan], [_, hilda, naan], Bs),
     xor(['7:30am', _, challah], [_, hilda, challah], Bs),

    % 3. The four customers were Willie,
    % the person who came in at 7:00am,
    % the person who ordered naan and
    % the person who came in at 8:30am.

    xor([_,willie,_], ['7:00am', _, _], Bs),
    xor([_,willie,_], [_, _, naan], Bs),
    xor([_,willie,_], ['8:30am', _, _], Bs),
    xor(['7:00am',_,_], [_, _, naan], Bs),
    xor(['8:30am',_,_], [_, _, naan], Bs),

    % 4. The customer who ordered matzo came in sometime
    %    before the person who ordered naan.

    before(Mtime, Ntime),
    member([Mtime, _, matzo], Bs),
    member([Ntime, _, naan], Bs),

1=1.


breads2(Bs) :-
     Bs = [
           ['7:00am',_,_],
           ['7:30am',_,_],
           ['8:00am',_,_],
           ['8:30am',_,_]
          ],

      member([_,isabel,_], Bs),
      member([_,louise,_], Bs),
      member([_,willie,_], Bs),
      member([_,hilda,_], Bs),

     member([_,_,naan], Bs),
     member([_,_,challah], Bs),
     member([_,_,brioche], Bs),
     member([_,_,matzo], Bs).
