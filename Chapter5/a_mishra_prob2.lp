person(john;susan;bob;mary;arnold;kate).
married(john,susan).
married(bob, mary).




% X married to Y means Y is also married to X
married(X,Y) :- married(Y,X), X!=Y.

% default
likes(X,Y) :- married(X,Y), not ab(d(X)), not -likes(X,Y).


% hates logic
-likes(X,Y) :- hates(X,Y).


% bob hates mary
hates(bob,mary).

married(kate,arnold).
ab(d(kate)).



#show likes/2.
#show hates/2.
%#show married/2.