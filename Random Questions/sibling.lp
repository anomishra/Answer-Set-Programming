person(sara). person(john).  person(sam). person(alice).person(bill).
person(sally). person(bob). person(mike).
gender(male). gender(female).
gender_of(john,male).
gender_of(alice,female).
gender_of(sally,female).
gender_of(sara,female).
gender_of(sam,male).
gender_of(bill,male).
gender_of(bob,male).
gender_of(mike,male).
%John is father of sam
father(john,sam).
mother(alice,sam).
father(john,bill).
mother(alice,bill).
father(bob,alice).
mother(sara,alice).
father(bob,sally).
mother(sara,sally).
father(bob,mike).
% X is parent to Y
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
child(X,Y) :- parent(Y,X).

sibling(X,Y) :- person(P),parent(P,X), parent(P,Y), X != Y.

#show sibling/2.