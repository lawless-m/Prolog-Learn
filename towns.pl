xand(X, Y, L) :- member(X, L), member(Y, L), X \= Y.
xor(X, Y, L) :- (member(X, L); member(Y, L)), X \= Y.

                                                                     