% object:
obj(phone).
obj(chihuahua).

%location home and library
location(home).
location(library).

%person
person(claire).
#const n = 1.
step(0..n).

%fluent
fluent(inertial, carried(Obj,P)) :- obj(Obj), person(P).
fluent(inertial, personAt(P,L)) :- location(L), person(P).
fluent(defined, objAt(Obj,L)) :- obj(Obj), location(L).
%action
action(went(P,L)) :- person(P), location(L).

% a causes f from part a)
holds(personAt(P,L), I+1) :- person(P),location(L),
                             occurs(went(P,L), I), I<n.

% object is to the location if carried by the person on a location
-holds(objAt(Obj,P), I) :- person(P), location(L), obj(Obj),
                           holds(personAt(P,L),I), holds(carried(Obj,P),I).

% one object is carried to the location by person
-holds(carried(Obj1,P), I) :- person(P), obj(Obj1), obj(Obj2),
                              holds(carried(Obj2,P),I), Obj1 != Obj2 .

% person will be at one location only
-holds(personAt(P,L1), I) :- person(P), location(L1), location(L2),
                              holds(personAt(P,L2),I), L1 != L2 .

%constraint for defined and inertial
-holds(F,I) :- fluent(defined,F), step(I), not holds(F,I).

% Inertia:   standard
holds(F,I+1) :- fluent(inertial,F), holds(F,I), not -holds(F,I+1), I < n.

-holds(F,I+1) :- fluent(inertial,F), -holds(F,I),  not holds(F,I+1),  I < n.

% CWA action
-occurs(A,I) :- action(A), step(I), not occurs(A,I).

% Initial condition as per the book
holds(carried(phone,claire), 0).
% obj phone changed to chihuahua
%holds(carried(chihuahua,claire), 0).
holds(personAt(claire, library),0).
%action given at step 0
occurs(went(claire, home), 0).

#show holds/2.
