% Solving systems of equations
% Assume we want to solce the following system for x and y
%  2x + 2 = 3y -2
%  3x + 1 = 2y
% When we do this problem we can use substitution or addition and find
% x = 1 and y = 2
%___________________________________________________________________________
% When we do the same problem with MATLAB we need to pu the system in 
% the following form  Ax = b where A is a matrix and x is a column vector
% of unknowns; and b are numbers.  And When we do that we get
%  2x - 3y = -4
% 3x - 2y = -1
% A is a matrix (2 -3; 3 -2)
% x = (x;y)
% b = (-2 ; -1)
%__________________________________________________________________________
%%
A = [ 2 -3;3 -2]
b = [-4;-1]
x = A\b


