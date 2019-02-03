%% implied by the following statements:
%% The SR-71 blackbird is a jet.
%% Jo is a robin.
%% A jet is a flyingObject.
%% A bird is a flyingObject.
%% Eagle & robin are birds.
%% jet fly faster than bird.
%% eagle fly faster than robin.
%% SR-71 blackbird fly faster than Jo.

class(flyingObject).
class(jet).
class(bird).
class(eagle).
class(robin).

object(sr71blackbird).
object(jo).

is_subclass(eagle,bird).
is_subclass(robin,bird).
is_subclass(bird,flyingObject).
is_subclass(jet,flyingObject).

%% Class C1 is a subclass of class C2 if C1 is a subclass of C2 or
%% if C1 is a subclass of C3 which is a subclass of C2.
subclass(C1,C2) :- is_subclass(C1,C2).
subclass(C1,C2) :- is_subclass(C1,C3),
                   subclass(C3,C2).

is_a(sr71blackbird, jet).
is_a(jo,robin).

%% Object X is a member of class C if X is a C or if X is a C0
%% and C0 is a subclass of C.
member(X,C) :- is_a(X,C).
member(X,C) :- is_a(X,C0),
               subclass(C0,C).

%% Sibling classes are disjoint unless we are specifically told otherwise.
siblings(C1,C2) :- is_subclass(C1,C),
                   is_subclass(C2,C),
                   C1 != C2.
-member(X,C2) :- member(X,C1),
                 siblings(C1,C2),
                 C1 != C2,
                 not member(X,C2).

%% flyfaster conditions
flyfaster(X,Y) :- member(X,jet), member(Y, bird), X > Y.
flyfaster(X,Y) :- member(X,eagle), member(Y, robin), X > Y.
flyfaster(jet, bird).
flyfaster(eagle, robin).

#show flyfaster/2.