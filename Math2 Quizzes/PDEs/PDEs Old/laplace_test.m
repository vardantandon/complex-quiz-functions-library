syms x a b c d m g h;
a = 1;
b = 4;
c = 13;
d = 20;
m = 1;
g = 1;
h = 3;
f = ((g*s^2 + (a*h + b*g + g*m)*s + a*h*m + b*g*m + d) / ((s + m)*(a*s^2 + b * s + c)));
output = ilaplace(f);
% strcat(char(output), ' yeah.')