% vector product
a = [2 1 -1];
b = [-3 4 1];
c = [5 -1 -2];

% Not commutative axb = -bxa 
Cross1 = cross(a,b)
Cross2 = cross(b,a)
%%
% Distributive
a = [2 1 -1];
b = [-3 4 1];
c = [5 -1 -2];
Cross3 = cross(a,(b+c))
Cross4 = cross(a,b) + cross(a,c)
%%
% Not Associative
a = [2 1 -1];
b = [-3 4 1];
c = [5 -1 -2];
Cross5 = cross(a,cross(b,c))
Cross6 = cross(cross(a,b),c)
