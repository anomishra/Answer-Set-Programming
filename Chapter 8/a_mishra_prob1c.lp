% color:
color(yellow).
color(white).
%also have black paint
color(black).

%wall
wall(w).

#const n = 2.
step(0..n).

%fluent
fluent(inertial, on(C,W)) :- color(C), wall(W).
%action
action(paint(C,W)) :- color(C), wall(W).


% a causes f
holds(on(C,W), I+1) :- color(C), wall(W),
                      occurs(paint(C,W), I), I<n.

% painting new color on wall will remove the old color
-holds(on(C1,W), I+1) :- color(C1), color(C2), wall(W),
                         occurs(paint(C2,W), I), C1 != C2.

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

% Initial condition as per the book
holds(on(yellow, w), 0).
%action given at step 0
occurs(paint(white,w), 0).
%action given at step 1, i.e. painted wall black now
occurs(paint(black,w), 1).

#show holds/2.
