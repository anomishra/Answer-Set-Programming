% Hamiltonion Cycle
%no two selected edges end at the same node

vtx(a;b;c;d).
e(a,b; b,c; c,d; d,a; d,b; b,a; a,c).

{in(X,Y)}:-e(X,Y).
reachable(X,X):-vtx(X).
reachable(X,Z):-in(X,Y), reachable(Y,Z), vtx(X;Y;Z).

% using aggrate #count
%:- in(U,V), in(W,V), U!=W, vtx(U;V;W).
count(N) :-N=#count{U:in(U,V)}, vtx(V).
:-count(N), N>1.

:- not reachable(U,V), vtx(U), vtx(V).

#show count/1.