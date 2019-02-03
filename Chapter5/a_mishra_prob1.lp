% instance
lion(apollo).
baby_lion(helios;rogers).

% default
dangerous(X) :- lion(X), not ab(d(X)), not -dangerous(X).

% since baby_lio list is complete
-dangerous(X) :- baby_lion(X).
ab(d(X)) :- baby_lion(X).



#show dangerous/1.
#show -dangerous/1.