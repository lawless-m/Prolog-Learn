

s  -->  foo,bar,wiggle.
foo  -->  [choo].
foo  -->  foo,foo.
bar  -->  mar,zar.
mar  -->  me,my.
me  -->  [i].
my  -->  [am].
zar  -->  blar,car.
blar  -->  [a].
car  -->  [train].
wiggle  -->  [toot].
wiggle  -->  wiggle,wiggle.

/*

s(A, B) :- foo(A, C), bar(C, D), wiggle(D, B).

foo([choo|A], A).
foo(A, B) :- foo(A, C), foo(C, B).

bar(A, B) :- mar(A, C), zar(C, B).
mar(A, B) :- me(A,C), my(C, B).

me([i|B], B).

my([am|A], A).

zar(A, B) :- blar(A, C), car(C, B).

blar([a|A], A).

car([train|A], A).

wiggle([toot|A], A).
wiggle(A, B) :- wiggle(A, C), wiggle(C, B).

*/

as --> [].
as --> al, as, ar, ar.
al --> [a].
ar --> [b].

ee --> [].
ee --> ee, aa, aa.
aa --> [a].

abcd --> [].
abcd --> a2n, b2m, abcd, c2m, d2n.

b2m --> bm, bm.
b2m --> bm, bm, b2m.

c2m --> cm, cm.
c2m --> cm, cm, c2m.

a2n --> an.
a2n --> an, a2n.

d2n --> dn.
d2n --> dn, d2n.

an --> [a].
bm --> [b].
cm --> [c].
dn --> [d].


sa --> ta.
sa --> [as],sa,[ds].

ta --> [].
ta --> [bs,bs],ta,[cs,cs].
