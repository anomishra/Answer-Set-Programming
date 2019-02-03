%Extend the program for n-queens problem
%to accommodate an additional constraint:
%"there must be a queen at position (1,1)".





#const n = 12.

number(1..n).

q(1,1).

%Condition 1 and 2
1{q(K,J): number(K)}1:- number(J).

%Condition 3
:-q(I,J), q(I,J1), J<J1.

%Condition 4
:-q(I,J), q(I1,J1), J<J1, |I1-I|==J1-J.

