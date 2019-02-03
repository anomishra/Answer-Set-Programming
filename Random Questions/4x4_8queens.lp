%eight queens
%Extend the program for n-queens problem
%to accommodate an additional constraint:
% "there are no queens in the 4 x 4 square in the middle of the board".



#const n = 8.

number(1..n).

%Condition 1 and 2
1{q(K,J): number(K)}1:- number(J).

%Condition 3
:-q(I,J), q(I,J1), J<J1.

%Condition 4
:-q(I,J), q(I1,J1), J<J1, |I1-I|==J1-J.

%Defining middle for 4 X 4
#const m = 4.
#const low_bound = (n - m)/2.
#const high_bound = low_bound + m + 1.

%Condition for queen not be in the middle of 4x4 square of 8-queens problem
%For this, calculated middle 4x4 starts for I = 3 and ends at I = 6
%                                       and J = 3 and J = 6
:- q(I,J), I>low_bound, I<high_bound, J>low_bound, J<high_bound.