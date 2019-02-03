%% hierarchy.lp -- Chapter 4, Section 4.3
%% Last Modified: 1/29/14
%% This program creates a hierarchical representation
%% implied by the following statements:
%% The Narwhal is a submarine.
%% A submarine is a vehicle.
%% Submarines are black.
%% The Narwhal is part of the U.S. Navy.

class(sub).
class(car).
class(vehicle).
class(machine).

is_subclass(sub,vehicle).
is_subclass(car,vehicle).
is_subclass(vehicle, machine).

%% Subclass Relation:
subclass(C1,C2) :- is_subclass(C1,C2).

subclass(C1,C2) :- is_subclass(C1,C3),
                   subclass(C3,C2).

-subclass(C1,C2) :- class(C1),
                    class(C2),
                    not subclass(C1,C2).


object(narwhal).
object(mystery).

is_a(narwhal,sub).
is_a(mystery,vehicle).

%% Class Membership:
member(X,C) :- is_a(X,C).
member(X,C) :- is_a(X,C0),
               subclass(C0,C).

siblings(C1,C2) :- is_subclass(C1,C),
                   is_subclass(C2,C),
                   C1 != C2.
-member(X,C2) :- member(X,C1),
                 siblings(C1,C2),
                 C1 != C2.

%% Colors:

color(black).
color(red).
color(white).

%% Submarines are black:
has_color(X,black) :- member(X,sub).

%% An object can only have one color.
%% (Multiple colors can be represented as combinations
%% such as black_red.)
-has_color(X,C2) :- has_color(X,C1),
                    color(C2),
                    C1 != C2.

%% The Narwhal is part of the U.S. Navy
part_of(narwhal,us_navy).

%% Other properties:
used_for_travel(X) :- member(X,vehicle).
-alive(X) :- member(X,machine).

member(X,C) | -member(X,C) :- object(X), leaf(C).
in_a_leaf(X) :- object(X), leaf(C), member(X,C).
-in_a_leaf(X) :- object(X), not in_a_leaf(X).
:- object(X), -in_a_leaf(X).

-leaf(C) :- class(X), subclass(X,C).
leaf(C) :- class(C),not -leaf(C).

#show -leaf/1.
#show leaf/1.