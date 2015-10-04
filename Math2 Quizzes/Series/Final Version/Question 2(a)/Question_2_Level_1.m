%Series Question 2 Level 1 - Summation series
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file = fopen('Question_2_Level_1.xml', 'w');

%xml initialization code
fprintf(file,quiz_start());

for i=1:1:100

%Calculations
a = randi([2 5],1,1);
b = randi([6 10],1,1);
c = randi([1 5],1,1);
d = randi([1 5],1,1);
flag = randi([1 4],1,1);

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

%Embedded components string generation
numString = cloze_numerical(sum, 0.05 , 'Good job!', 'Incorrect, try again');

if (flag == 1 || flag ==3)

%Question string joining
 questionString = strcat('Evaluate the sum of the infinite series : <br>','$$\\small \\sum _{n=0}^{\\infty }\\:[',cString,'(\\frac{1}{',num2str(a),...
    '})^n',dString,'(\\frac{1}{',num2str(b),'})^n]$$ <br>','<br>[Calculate upto 3 significant figures]<br>', ...
 '<br>Answer : <br>', numString);

%Feedback string joining
 feedbackString = strcat('The series can be represented as follows : <br>$$\\small',cString,' \\sum _{n=0}^{\\infty }\\:(','\\frac{1}{',num2str(a),...
 '})^n',dString,' \\sum _{n=0}^{\\infty }\\:','(\\frac{1}{',num2str(b),'})^n$$ <br><br>',...
 'The Sum of a Geometric series is given by :<br> $$\\small \\frac{a(1 - r^{n})}{1 - r}$$  where a is the first term , r is the common difference and n is the number of terms <br><br>',...
 'This contains two geometric series where the following is given : <br>',...
 'First term : a<sub>1</sub> = a<sub>2</sub> = a = 1 [At n=0 , the first term for both the series will be to the power 0 which equals 1]<br>Common ratios : r<sub>1</sub> =&nbsp;$$\\small \\frac{1}{', num2str(a),'}$$ ;&nbsp;',...
 'r<sub>2</sub> =&nbsp;$$\\small \\frac{1}{', num2str(b),'}$$<br>','Number of terms(n) = $$\\small \\infty$$ <br><br>',...
 'As n = $$\\small \\infty$$, Sum = $$\\small \\frac{a}{1 - r}$$<br>',...
 'Sum<sub>1</sub> = $$\\small \\frac{a}{1 - r_{1}}$$ ; Sum<sub>2</sub> = $$\\small \\frac{a}{1 - r_{2}}$$ <br>',...
 'Sum<sub>1</sub> =&nbsp;',num2str(sum_1), '&nbsp;;&nbsp;Sum<sub>2</sub> =&nbsp;',num2str(sum_2),'<br><br>Total Sum = (',num2str(c),') * Sum<sub>1</sub> + (',num2str(d),') * Sum<sub>2</sub><br>Total Sum =&nbsp;',num2str(sum));

else

%Question string joining
questionString = strcat('Evaluate the sum of the infinite series : <br>','$$\\small \\sum _{n=0}^{\\infty }\\:[',cString,'(\\frac{1}{',num2str(a),...
    '})^n' ,'+',dString,'(\\frac{1}{',num2str(b),'})^n]$$ <br>','<br>[Calculate upto 3 significant figures]<br>', ...
 '<br>Answer : <br>', numString);

%Feedback string joining
feedbackString = strcat('The series can be represented as follows : <br>$$\\small',cString,' \\sum _{n=0}^{\\infty }\\:(','\\frac{1}{',num2str(a),...
 '})^n','+',dString,' \\sum _{n=0}^{\\infty }\\:','(\\frac{1}{',num2str(b),'})^n$$ <br><br>',...
 'The Sum of a Geometric series is given by :<br> $$\\small \\frac{a(1 - r^{n})}{1 - r}$$  where a is the first term , r is the common difference and n is the number of terms <br><br>',...
 'This contains two geometric series where the following is given : <br>',...
 'First term : a<sub>1</sub> = a<sub>2</sub> = a = 1 [At n=0 , the first term for both the series will be to the power 0 which equals 1]<br>Common ratios : r<sub>1</sub> =&nbsp;$$\\small \\frac{1}{', num2str(a),'}$$ ;&nbsp;',...
 'r<sub>2</sub> =&nbsp;$$\\small \\frac{1}{', num2str(b),'}$$<br>','Number of terms(n) = $$\\small \\infty$$ <br><br>',...
 'As n = $$\\small \\infty$$, Sum = $$\\small \\frac{a}{1 - r}$$<br>',...
 'Sum<sub>1</sub> = $$\\small \\frac{a}{1 - r_{1}}$$ ; Sum<sub>2</sub> = $$\\small \\frac{a}{1 - r_{2}}$$ <br>',...
 'Sum<sub>1</sub> =&nbsp;',num2str(sum_1), '&nbsp;;&nbsp;Sum<sub>2</sub> =&nbsp;',num2str(sum_2),'<br><br>Total Sum = (',num2str(c),') * Sum<sub>1</sub> + (',num2str(d),') * Sum<sub>2</sub><br>Total Sum =&nbsp;',num2str(sum));
 
end 

%Complete question XML code generation
xmlCode = question_cloze(i, ...
        'Summation series', ... 
        questionString, ...
        feedbackString, ...
        '');

fprintf(file, xmlCode);

end

 %xml closing code
fprintf(file, quiz_end());
fclose(file);


