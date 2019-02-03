student(john).
student(mary).

course(graphs).
course(math).

took(john,math).
took(john,graphs).
took(mary,graphs).


can_graduate(X) :- student(X), took(X,graphs),took(X,math).
-can_graduate(X) :- student(X), not can_graduate(X).

% ?can_graduate(john), ?can_graduate(mary)
#show can_graduate/1.
#show -can_graduate/1.
