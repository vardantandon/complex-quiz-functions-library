
flag = randi([1 3],1,1)
a = randi ([1 2],1,1)
b = randi([1 3],1,1)
syms x
cos_f =  1 - (a*(x^2))/2
sin_f = a*x - (a*(x^3))/6
tan_f = a*x +  (a*(x^3))/3

if (flag == 1)

        answer = b*cos_f*cos_f    
  
else if (flag == 2)
        answer = b*sin_f*sin_f   
else 
        answer = b*tan_f*tan_f
    end
end 

