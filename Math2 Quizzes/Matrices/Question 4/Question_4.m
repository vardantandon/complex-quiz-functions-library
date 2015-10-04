%Matrices Question 4 - Inverse matrix equations
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('Question_4.xml','w'); 

%xml initialization code
fprintf(file, quiz_start()); 

for i=1:1:100

%Calculations    
x = [1,-1,-1];
flag = randi([1 3],1,1);
a = randi([1 5],1,1)*x(randi(length(x)));
b = randi ([1 5],1,1)*x(randi(length(x)));
c = randi([1 5],1,1)*x(randi(length(x)));
d = randi ([1 5],1,1)*x(randi(length(x)));
e = randi([1 5],1,1)*x(randi(length(x)));
f = randi ([1 5],1,1)*x(randi(length(x)));
g = randi([1 5],1,1)*x(randi(length(x)));
h = randi ([1 5],1,1)*x(randi(length(x)));

if (flag == 1)
    syms x1
    A = [a,b,c;d,x1,e;f,g,x1];
    solx = solve((a*(x1*x1 - e*g) - b*(d*x1 - e*f) + c*(d*g - f*x1)),x1);
    Cof = coeffs(simplify(a*(x1*x1 - e*g) - b*(d*x1 - e*f) + c*(d*g - f*x1)));
    if (isreal(solx)==0)
        continue;
    end
else if(flag == 2)
        syms x1
        A = [a,b,c;d,e,x1;x1,f,g];
        solx = solve((a*(e*g - x1*f) - b*(d*g - x1*x1) + c*(d*f - e*x1)),x1);
        Cof = coeffs(simplify(a*(e*g - x1*f) - b*(d*g - x1*x1) + c*(d*f - e*x1)));
        if (isreal(solx)==0)
            continue;
        end
    else
        syms x1
        A = [a,b,c;x1,d,e;f,x1,g];
         solx = solve((a*(d*g - x1*e) - b*(x1*g - e*f) + c*(x1*x1 - d*f)),x1);
         Cof = coeffs(simplify(a*(d*g - x1*e) - b*(x1*g - e*f) + c*(x1*x1 - d*f)));
        if (isreal(solx)==0)
            continue;
        end
    end
end

aString = '';
bString = '+';
cString = '+';

if(length(Cof) < 3 || Cof(3) == 0 || Cof(2) == 0 || Cof(1) == 0)
    continue;
end

if double(Cof(3))~= 1
    aString = num2str(double(Cof(3)));
    if (c==-1)
    aString = '-';
    end
end

if double(Cof(2))~= 1
    if double(Cof(2)) < -1
    bString = num2str(double(Cof(2)));
    else if(double(Cof(2))==-1)
    bString = '-';
    else if((double(Cof(2))>-1))
    bString = strcat('+',num2str(double(Cof(2))));  
        end
        end
    end
end
if double(Cof(1))~= 1
    if double(Cof(1)) < -1
    cString = num2str(double(Cof(1)));
    else if(double(Cof(1))==-1)
    cString = '-';
    else if((double(Cof(1))>-1))
    cString = strcat('+',num2str(double(Cof(1))));  
        end
        end
    end
end

%Embedded components string generation
numString_1 = cloze_numerical(double(solx(1)), 0.05, 'Good job!', 'Incorrect, try again');
numString_2 = cloze_numerical(double(solx(2)), 0.05, 'Good job!', 'Incorrect, try again'); 

%Question string joining
if (flag == 1)
    questionString = strcat ('Find the values of x for which the following matrix has no inverse:<br><br> ',...
        '$$\\small \\begin{pmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ','x',' & ',num2str(e),' \\\\',num2str(f),' & ',num2str(g),' & ','x','\\end{pmatrix}\\:$$ <br><br>',...
        'Express the answers upto 3 significant figures and in increasing order such that x<sub>1</sub> < x<sub>2</sub><br><br>',...
        'x<sub>1</sub> = ',numString_1,'x<sub>2</sub> = ',numString_2);
else if (flag == 2)
        questionString = strcat ('Find the values of x for which the following matrix has no inverse :<br><br> ',...
            '$$\\small \\begin{pmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(e),' & ','x',' \\\\','x',' & ',num2str(g),' & ',num2str(f),'\\end{pmatrix}\\:$$ <br><br>',...
            'Express the answers upto 3 significant figures and in increasing order such that x<sub>1</sub> < x<sub>2</sub><br><br>',...
            'x<sub>1</sub> = ',numString_1,'x<sub>2</sub> = ',numString_2);
    else
        questionString = strcat ('Find the values of x for which the following matrix has no inverse :<br><br> ',...
            '$$\\small \\begin{pmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\','x',' & ',num2str(d),' & ',num2str(e),' \\\\',num2str(f),' & ','x',' & ',num2str(g),'\\end{pmatrix}\\:$$ <br><br>',...
            'Express the answers upto 3 significant figures and in increasing order such that x<sub>1</sub> < x<sub>2</sub><br><br>',...
            'x<sub>1</sub> = ',numString_1,'x<sub>2</sub> = ',numString_2);
    end
end

%Feedback string joining
if(flag == 1)
    feedbackString = strcat('When a matrix has no inverse, the determinant of the matrix is equal to 0. So, <br><br>',...
        '$$\\small \\begin{vmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ','x',' & ',num2str(e),' \\\\',num2str(f),' & ',num2str(g),' & ','x','\\end{vmatrix}\\: = 0 $$ <br><br>',...
        'On solving the determinant we get the following equation : <br><br>$$\\small',...
           num2str(a),'(x^{2} - (',num2str(e*g),')) - (',num2str(b),')((',num2str(d),'x) - (',num2str(e*f),')) + (',num2str(c),')((',num2str(e*g),') - (',num2str(f),'x)) = 0 $$<br><br>',...
        'On simplifying the equation, we get <br><br>',...
        '$$\\small ',aString,'x^{2}',bString,'x',cString,' = 0 $$<br><br>',...
        'Solving for x, we get: <br><br>',...
        '$$ \\small x_{1} = ',num2str(double(solx(1))),'$$ <br> $$\\small x_{2} = ',num2str(double(solx(2))),'$$');
else if(flag == 2)
        feedbackString = strcat('When a matrix has no inverse, the determinant of the matrix is equal to 0. So, <br><br>',...
            '$$\\small \\begin{vmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(e),' & ','x',' \\\\','x',' & ',num2str(g),' & ',num2str(f),'\\end{vmatrix}\\: = 0 $$ <br><br>',...
            'On solving the determinant we get the following equation : <br><br>$$\\small',...
            num2str(a),'((',num2str(e*f),') - (',num2str(g),'x)) - (',num2str(b),')((',num2str(d*f),') - x^{2}) + (',num2str(c),')((',num2str(d*g),') - (',num2str(e),'x)) = 0 $$<br><br>',...
            'On simplifying the equation, we get <br><br>',...
            '$$\\small ',aString,'x^{2}',bString,'x',cString,' = 0 $$<br><br>',...
            'Solving for x, we get: <br><br>',...
           '$$ \\small x_{1} = ',num2str(double(solx(1))),'$$ <br> $$\\small x_{2} = ',num2str(double(solx(2))),'$$');
    else
        feedbackString = strcat('When a matrix has no inverse, the determinant of the matrix is equal to 0. So, <br><br>',...
            '$$\\small \\begin{vmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\','x',' & ',num2str(d),' & ',num2str(e),' \\\\',num2str(f),' & ','x',' & ',num2str(g),'\\end{vmatrix}\\: = 0$$ <br><br>',...
            'On solving the determinant we get the following equation : <br><br>$$ \\small',...
            num2str(a),'((',num2str(d*g),') - (',num2str(e),'x)) - (',num2str(b),')((',num2str(g),'x) - (',num2str(e*f),') + (',num2str(c),')(x^{2} - (',num2str(d*f),')) = 0 $$<br><br>',...
            'On simplifying the equation, we get <br><br>',...
            '$$\\small ',aString,'x^{2}',bString,'x',cString,' = 0 $$<br><br>',...
            'Solving for x, we get: <br><br>',...
            '$$ \\small x_{1} = ',num2str(double(solx(1))),'$$ <br> $$\\small x_{2} = ',num2str(double(solx(2))),'$$');
    end
end

%Complete question XML code generation 
xmlCode = question_cloze(i, ...
        'Inverse matrix equations', ... 
        questionString, ...
        feedbackString, ...
        '');
        
  fprintf(file, xmlCode);
  
end 

%xml closing code
fprintf(file, quiz_end());
fclose(file);