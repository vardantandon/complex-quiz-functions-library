

a = randi([1 5],1,1)
b = randi([1 3],1,1)
syms x
fun = @(x)exp((b*x).^2)
ans = a*integral(fun,0,1)
