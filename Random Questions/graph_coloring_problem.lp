%there is at most one node in a given graph colored by color named 1.


vtx(a; b; c; d).
e(a,b; b,c; c,d; d,a; b,d).
color(1;2;3).


{c(V,I)}:-vtx(V), color(I).

%each vertex is given a color
:- not c(V,1), not c(V,2), not c(V,3), vtx(V).

%each vertex cann't be given two colors.
:- c(V,I), c(V,J), I!=J, vtx(V), color(I;J).

%vertexs on a edge are not same color
:- c(V,I), c(W,I), vtx(V;W), color(I), e(V,W).


%Extended Statement given in question - at most one vertex is given color named 1
:-c(X,1), c(Y,1), X!=Y, vtx(X), vtx(Y).

#show c/2.


