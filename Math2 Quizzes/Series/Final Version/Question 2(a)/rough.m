
a = randi([2 5],1,1)
b = randi([6 10],1,1)
c = randi([1 5],1,1)
d = randi([1 5],1,1)
flag = randi([1 4],1,1)

if (flag == 1)
    c = -1*c
    d = -1*d
    
else if(flag == 2)
        c = -1*c
        d = d
    else if(flag == 3)
            c = c
            d= -1*d
        else
            c = c
            d = d
        end
    end
end

sum_1 = 1/(1-(1/a))
sum_2 = 1/(1-(1/b))

sum = c*sum_1 + d*sum_2

