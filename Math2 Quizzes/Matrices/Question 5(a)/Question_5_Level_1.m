%Matrices Question 5 Level 1 - Gaussian elimination 2x2 matrix 
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('Question_5_Level_1.xml','w'); 

%xml initialization code
fprintf(file, quiz_start()); 

for i=1:1:100

%Calculations
r = [1,-1,-1];

a = randi([1 10],1,1)*r(randi(length(r)));
b = randi ([1 10],1,1)*r(randi(length(r)));
c = randi([1 50],1,1)*r(randi(length(r)));
d = randi ([1 10],1,1)*r(randi(length(r)));  
e = randi([1 10],1,1)*r(randi(length(r)));
f = randi ([1 50],1,1)*r(randi(length(r)));
    
syms x y
[solx,soly] = solve([a*x + b*y == c, d*x + e*y==f],[x,y]);
A = [a,b;c,d];
if (isreal(solx) == 0 || isreal(soly) == 0|| ((a*e - b*d) == 0) )
    continue;    
end     

%Embedded components string generation
numString_1 = cloze_numerical(double(solx), 0.05, 'Good job!', 'Incorrect, try again');
numString_2 = cloze_numerical(double(soly), 0.05, 'Good job!', 'Incorrect, try again');

aString = '';
bString = '+';
dString = '';
eString = '+';

if a~= 1
    aString = num2str(a);
    if (a==-1)
    aString = '-';
    end
end

if b~= 1
    if b < -1
    bString = num2str(b);
    else if(b==-1)
    bString = '-';
    else if(b>-1)
    bString = strcat('+',num2str(b));  
        end
        end
    end
end

if d~= 1
    dString = num2str(d);
    if (d==-1)
    dString = '-';
    end
end

if e~= 1
    if e < -1
    eString = num2str(e);
    else if(e==-1)
    eString = '-';
    else if(e>-1)
    eString = strcat('+',num2str(e));  
        end
        end
    end
end

%Question string joining
questionString = strcat ('Solve the following system of simultaneous equations using standard Gaussian elimination (including row sums): <br><br>$$\\small',...
aString,'x',bString,'y = ',num2str(c),'$$<br>$$\\small',dString,'x',eString,'y = ',num2str(f),...
'$$<br><br>Calculate upto 3 significant figures<br><br>',...
'x = ',numString_1,'<br>y = ',numString_2);

%Feedback string joining
feedbackString = strcat ('To solve a system of linear equations using Gaussion elimination, we use the following steps : <br><br>',...
'1. Construct the augmented matrix for the system.<br>',...
'2. Use elementary row operations to transform the augmented matrix into a triangular one.<br>',...
'3. Write down the new linear system for which the triangular matrix is the associated augmented matrix.<br>',...
'4. Solve the new system<br><br>',...
'For solving a system of linear equations with 2 variables,<br><br>',...
'$$\\small ax + by = e$$<br>$$\\small cx + dy = f$$<br><br>',...
'Using the above steps, we construct an augmented matrix as follows,<br><br>',...
'$$\\small \\begin{pmatrix}','a',' & ','b','\\\\','c',' & ','d','\\end{pmatrix}\\: = \\begin{pmatrix} e \\\\ f \\end{pmatrix}$$<br><br>',...
'Next we perform elementary row transformations on the augmented matrix such that it takes the following form,<br><br>',...
'$$\\small \\begin{pmatrix}','a^{1}',' & ','b^{1}','\\\\','0',' & ','d^{1}','\\end{pmatrix}\\: = \\begin{pmatrix} e^{1} \\\\ f^{1} \\end{pmatrix}$$<br><br>',...
'Next we write down the new system of linear equations which is easier to calculate,<br><br>',...
'$$\\small a^{1} x + b^{1} y = e^{1} $$<br>$$\\small d^{1} y = f^{1} $$<br><br>',...
'Finally we find the value of y from the second equation and then insert it in the first equation to get the value of x.');
  
%Complete question XML code generation 
xmlCode = question_cloze(i, ...
        'Gaussian elimination Level 1', ... 
        questionString, ...
        feedbackString, ...
        '');
    fprintf(file, xmlCode);
        
end 

%xml closing code
fprintf(file, quiz_end()); 
fclose(file);