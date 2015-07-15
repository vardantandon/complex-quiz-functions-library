file = fopen('Question_4.xml', 'w');
fprintf(file,quiz_start());


for i=1:1:10
    
flag = randi([1 3],1,1)
a = randi ([1 2],1,1)
b = randi([1 3],1,1)
syms x
cos_f =  1 - (a*(x^2))/2
sin_f = a*x - (a*(x^3))/6
tan_f = a*x +  (a*(x^3))/3

if (flag == 1)
        str = 'cos'
        answer = b*cos_f*cos_f    
  
else if (flag == 2)
        str = 'sin'
        answer = b*sin_f*sin_f   
    else 
        str = 'tan'
        answer = b*tan_f*tan_f
    end
end 
    

finalStr = strcat('{1:ALGEBRA:=', char(answer), ':', num2str(0.05), '#', 'Good job!', '!~*#', 'Incorrect, try again', '}');

questionString = strcat('Use Maclaurin expansion for ',str,'(x) to find the  first two non-zero terms of the Maclaurin expansion for <br>',...
      str,'$$^2$$(x).', '<br>Answer : <br>', finalStr);
    
  xmlCode = question_cloze(i, ...
        'Algebra', ... 
        questionString, ...
        'Algebra', ...
        '');

fprintf(file, xmlCode);
    
    
   
    
end 

fprintf(file, quiz_end()); %xml closing code
fclose(file);