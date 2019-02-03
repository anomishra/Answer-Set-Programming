%given in question
% a causes f if g
% h if f,g

% fluents from question
fluent(inertial,f).
fluent(inertial,g).
fluent(defined, h).

% actions
action(a).

%Steps
#const n=1.
step(0,n).



% laws defined as per provided rules in question
holds(f, I+1) :- occurs(a, I),
                 holds(g, I),
                 I < n.

holds(h, I) :-  holds(f, I), holds(g, I).

% CWA for fluents
-holds(F,I) :- fluent(defined,F),
               step(I),
               not holds(F,I).

% CWA for actions
-occurs(A,I) :- action(A), step(I),
                not occurs(A,I).


% Inertia:
holds(F,I+1) :- fluent(inertial,F),
                holds(F,I),
                not -holds(F,I+1),
                I < n.

-holds(F,I+1) :- fluent(inertial,F),
                 -holds(F,I),
                 not holds(F,I+1),
                 I < n.

%% Specific actions for testing.
% action provided
%occurs(a,0).


%% Change these at will:
% TEST - initial state.
%holds(f,0).
%holds(g,0).
%holds(h,0).


% TEST - effect of action = new state
%#show holds/2.
