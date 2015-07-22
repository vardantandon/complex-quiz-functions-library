syms x a b c d m g h;
a = 1;
b = 4;
c = 13;
d = 20;
m = 1;
g = 1;
h = 3;

a = randi([1 5]);
b = randi([6 9]);
c = randi([1 9]);
d = randi([20 30]);
m = randi([2 5]);
g = 1; %randi([1 3]);
h = randi([3 6]);

f = ((g*s^2 + (a*h + b*g + g*m*a)*s + a*h*m + b*g*m + d) / ((s + m)*(a*s^2 + b * s + c)));
% output = ilaplace(f);
% strcat(char(output), ' yeah.')

clc;

f;
parfrac = feval(symengine, 'partfrac', f, s);
childs = children(parfrac);
% [n, d] = numden(childs(2));
% coeff = coeffs(d);
% hVar = -coeff(2)/(2*coeff(3)); %calculate hVar
% kVar = coeff(1)-coeff(2)^2/(4*coeff(3)); %calculate kVar
% newDen = coeff(3)*(s-hVar)^2+kVar %this is your equivalent formula
% 
% newFrac = n / newDen
% newFunc = childs(1) + newFrac
latex(childs(1));
latex(ilaplace(laplace(childs(1))));

latex(childs(2));
latex(ilaplace(laplace(childs(2))));
latex(f)
latex(ilaplace(f))
