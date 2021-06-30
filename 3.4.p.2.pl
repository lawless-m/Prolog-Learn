byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

conn(S, F) :- byCar(S, F).
conn(S, F) :- byTrain(S, F).
conn(S, F) :- byPlane(S, F).

travel(S, F) :- conn(S, F).
travel(S, F) :- conn(S, M), travel(M, F).


travel(S, F, go(S, F)) :- conn(S, F).
travel(S, F, go(S, M, G)) :- conn(S, M), travel(M, F, G).


go(car, S, F) :- byCar(S, F).
go(train, S, F) :- byTrain(S, F).
go(plane, S, F) :- byPlane(S, F).

htravel(S, F, go(T, S, F)) :- conn(S, F), go(T, S, F).
htravel(S, F, go(T, S, M, G)) :- go(T, S, M), htravel(M, F, G).

