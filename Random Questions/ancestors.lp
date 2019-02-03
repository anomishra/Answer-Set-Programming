                                          %% ancestors.lp -- Chapter 4, Section 4.1.3
%% Last Modified: 1/29/14
%% Defining Ancestors

person(bill).  person(mary). person(bob).
person(kathy). person(mike). person(rich).
person(patty). person(sam).  person(susan).

father(bob,bill).
father(rich,bob).
father(mike,mary).
father(sam,rich).
mother(mary,bill).
mother(patty,bob).
mother(kathy,mary).
mother(susan,rich).

-father(F,C) :- person(F), person(C),
                not father(F,C).
-mother(M,C) :- person(M), person(C),
                not mother(M,C).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
-parent(X,Y) :- person(X), person(Y),
                not parent(X,Y).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y),
                 ancestor(X,Z).
-ancestor(X,Y) :- person(X), person(Y),
                  not ancestor(X,Y).

#show ancestor/2.