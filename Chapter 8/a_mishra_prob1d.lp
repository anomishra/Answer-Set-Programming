% color:
color(yellow).
color(white).
%also have black paint
color(black).

%wall
wall(w1).
wall(w2).

% two person jenny and jill
person(jenny).
person(jill).

#const n = 2.
step(0..n).

%fluent
fluent(inertial, on(C,W)) :- color(C), wall(W).
%action
action(paint(P,C,W)) :- person(P), color(C), wall(W).


% a causes f
holds(on(C,W), I+1) :- person(P),color(C), wall(W),
                       occurs(paint(P,C,W), I), I<n.

% painting new color on wall will remove the old color
-holds(on(C1,W), I+1) :- person(P), color(C1), color(C2), wall(W),
                         occurs(paint(P,C2,W), I), C1 != C2.

% Inertia:   standard
holds(F,I+1) :- fluent(inertial,F),
                holds(F,I),
                not -holds(F,I+1),
                I < n.

-holds(F,I+1) :- fluent(inertial,F),
				        -holds(F,I),
                 not holds(F,I+1),
                 I < n.

% CWA action
-occurs(A,I) :- action(A), step(I), not occurs(A,I).

%concurreny condition, two people can't paint the same wall at same time but can paint different wall
-occurs(paint(P1,C,W), I) | -occurs(paint(P2,C,W), I) :- person(P1), person(P2), color(C), wall(W),
                                                         step(I), action(paint(P1,C,W)),
                                                         action(paint(P2,C,W)), P1 != P2.

% Initial condition as per the book
holds(on(yellow, w1), 0).
%action given at step 0
occurs(paint(jenny,white,w1), 0).
%action jill painted another wall as white paint (given)
occurs(paint(jill,white,w2), 0).
%action given at step 1, i.e. painted wall black now
occurs(paint(jenny,black,w1), 1).

#show holds/2.
