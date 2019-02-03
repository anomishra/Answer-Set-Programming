car(a;b;c;d).
pickup(b;c).
extended_cab(c).

% default 1,normally cars have four seats
four_seats(X) :- car(X), not ab(d(X)), not -four_seats(X).
ab(d(X)) :- pickup(X).


%default 1,normally pickup have two seats
two_seats(X) :- pickup(X), not ab(d(X)), not -two_seats(X).
ab(d(X)) :- extended_cab(X).

% condition that two seats are not four seats
two_seats(X) :- pickup(X), not four_seats(X).


four_seats(X) :- extended_cab(X).


#show four_seats/1.
#show two_seats/1.