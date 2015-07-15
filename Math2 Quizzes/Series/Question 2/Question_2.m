
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

numString = cloze_numerical(sum, 0.05 , 'Good job!', 'Incorrect, try again');

if (flag == 1 || flag ==3)
questionString = strcat('Evaluate the sum of the infinite series : <br>','$$\\small \\sum _{n=0}^{\\infty }\\:[',num2str(c),'(\\frac{1}{',num2str(a),...
    '})^n',num2str(d),'(\\frac{1}{',num2str(b),'})^n]$$ <br>','<br>[Calculate upto 2 significant figures]<br>', ...
 '<br>Answer : <br>', numString);
else
questionString = strcat('Evaluate the sum of the infinite series : <br>','$$\\small \\sum _{n=0}^{\\infty }\\:[',num2str(c),'(\\frac{1}{',num2str(a),...
    '})^n' ,'+',num2str(d),'(\\frac{1}{',num2str(b),'})^n]$$ <br>','<br>[Calculate upto 2 significant figures]<br>', ...
 '<br>Answer : <br>', numString);
end

xmlCode = question_cloze(i, ...
        'Summation series', ... 
        questionString, ...
        'Summation series', ...
        '');

fprintf(file, xmlCode);

end

fprintf(file, quiz_end()); %xml closing code
fclose(file);


