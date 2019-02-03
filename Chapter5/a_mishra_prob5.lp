student(john;bob;rick;mary).

course(graphs;math).

took(john,math;john,graphs;mary,graphs).
-took(mary,math; bob, math).


% can_graduate
can_graduate(X) :- student(X), not ab(d(X)), not -can_graduate(X).
ab(d(X)) :- student(X),course(Y), not took(X,Y).

% -can_graduate
-can_graduate(X) :- student(X), course(Y), -took(X,Y).

% review_records
review_records(X) :- student(X), not can_graduate(X),  not -can_graduate(X).



% ?can_graduate(john), ?can_graduate(mary),?can_graduate(bob), ? review_records(rick)
#show can_graduate/1.
#show -can_graduate/1.
#show review_records/1.



