
file = fopen('Question_2.xml', 'w');
fprintf(file,quiz_start());

for i=1:1:100
    
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

cString = '';
dString = '';


if c~= 1
    cString = num2str(c);
    if (c==-1)
    cString = '-'
    end
end
if d~= 1
    dString = num2str(d);
    if (d==-1)
    dString = '-'
    end
end


numString = cloze_numerical(sum, 0.05 , 'Good job!', 'Incorrect, try again');

if (flag == 1 || flag ==3)
  
 questionString = strcat('Evaluate the sum of the infinite series : <br>','$$\\small \\sum _{n=0}^{\\infty }\\:[',cString,'(\\frac{1}{',num2str(a),...
    '})^n',dString,'(\\frac{1}{',num2str(b),'})^n]$$ <br>','<br>[Calculate upto 2 significant figures]<br>', ...
 '<br>Answer : <br>', numString);

 feedbackString = strcat('This contains two geometric series with first term a = 1 and common ratios $$\\small \\frac{1}{', num2str(a), '}$$ and $$\\small \\frac{1}{', num2str(b),...
     '}$$ respectively.<br>', 'Number of terms n = $$\\small \\infty$$ <br>', 'Sum = $$\\small \\frac{a(1 - r^{n})}{1 - r}$$ <br>', 'Sum =&nbsp;&nbsp;',num2str(sum));


else
questionString = strcat('Evaluate the sum of the infinite series : <br>','$$\\small \\sum _{n=0}^{\\infty }\\:[',cString,'(\\frac{1}{',num2str(a),...
    '})^n' ,'+',dString,'(\\frac{1}{',num2str(b),'})^n]$$ <br>','<br>[Calculate upto 2 significant figures]<br>', ...
 '<br>Answer : <br>', numString);

feedbackString = strcat('This contains two geometric series with first term a = 1 and common ratios $$\\small \\frac{1}{', num2str(a), '}$$ and $$\\small \\frac{1}{', num2str(b),...
     '}$$ respectively.<br>', 'Number of terms n = $$ \\small \\infty$$ <br>', 'Sum = $$\\small \\frac{a(1 - r^{n})}{1 - r}$$ <br>', 'Sum =&nbsp;&nbsp;',num2str(sum));
 
end 

xmlCode = question_cloze(i, ...
        'Summation series', ... 
        questionString, ...
        feedbackString, ...
        '');

fprintf(file, xmlCode);

end

fprintf(file, quiz_end()); %xml closing code
fclose(file);


