% syms x a b c d m g h;
% a = 1;
% b = 4;
% c = 13;
% d = 20;
% m = 1;
% g = 1;
% h = 3;
% f = ((g*s^2 + (a*h + b*g + g*m)*s + a*h*m + b*g*m + d) / ((s + m)*(a*s^2 + b * s + c)));
% output = ilaplace(f);
% % strcat(char(output), ' yeah.')

%str = '-(exp(-(b^2*n^2*p^2*t)/L^2)*sin((n*p*x)/L)*((16*L)/(n^3*p^3) - (72*L*cos(n*p))/(n*p) - (16*L*cos(n*p))/(n^3*p^3) + (64*L*sin(n*p))/(n^2*p^2)))/L';
str = '(n^2)';
assume(n,'integer');
simplify(eval(str))

