                             % family.lp from Chapter 4, Section 4.1.1
% Last Modified: 2/6/14
% Basic family relationships

person(john).
person(sam).
person(alice).
person(bill).
person(bob).

gender(male).
gender(female).

father(john,sam).
father(john,bill).

mother(alice,sam).
mother(alice,bill).

gender_of(john,male).
gender_of(alice,female).
gender_of(sam,male).
gender_of(bill,male).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

child(X,Y) :- parent(Y,X).

brother(X,Y) :- gender_of(X,male),
                father(F,X),
                father(F,Y),
                mother(M,X),
                mother(M,Y),
                X != Y.

%% These two rules are used if we don't wish to make the closed-world
%% assumption:
-father(X,Y) :- person(Y), gender_of(X,female).

-father(X,Y) :- person(X),
                father(Z,Y),
                X != Z.

%% This closed-world assumption for father(X,Y)
%% subsumes the above two rules.
-father(X,Y) :- person(X), person(Y),
                not father(X,Y).

#show brother/2.