%Graph_coloring
vtx(p).
vtx(r).
e(r, p).

color(1).
color(2).
color(3).
{c(V, I)}:- vtx(V), color(I).
:- c(V, I), c(V, J), I < J, vtx(V), color(I), color(J).
:- not c(V,1), not c(V,2), not c(V,3), vtx(V).

c(p,1).

#show c/2.