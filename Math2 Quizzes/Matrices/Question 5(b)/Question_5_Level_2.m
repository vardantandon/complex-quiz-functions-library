%Matrices Question 5 Level 2 - Gaussian elimination 3x3 matrix 
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('Question_5_Level_2.xml','w'); 

%xml initialization code
fprintf(file, quiz_start()); 
for i=1:1:100

%Calculations    
r = [1,-1,-1];

a = randi([1 10],1,1)*r(randi(length(r)));
b = randi ([1 10],1,1)*r(randi(length(r)));
c = randi([1 10],1,1)*r(randi(length(r)));
d = randi ([1 10],1,1)*r(randi(length(r)));  
e = randi([1 10],1,1)*r(randi(length(r)));
f = randi ([1 10],1,1)*r(randi(length(r)));
g = randi ([1 10],1,1)*r(randi(length(r)));  
h = randi([1 10],1,1)*r(randi(length(r)));
j = randi ([1 10],1,1)*r(randi(length(r)));
k = randi ([1 10],1,1)*r(randi(length(r)));  
l = randi([1 10],1,1)*r(randi(length(r)));
m = randi([1 10],1,1)*r(randi(length(r)));
    
syms x y z
[solx,soly,solz] = solve([(a*x + b*y + g*z == c), (d*x + e*y + h*z == f),(k*x + l*y +m*z == j)],[x,y,z]);
deter = (a*(e*m - h*l) - b*(m*d - h*k) + g*(d*l - e*k));
if (isreal(solx)==0 || isreal(soly)==0 || isreal(solz)==0 || deter == 0 )
    continue;    
end     

%Embedded components string generation
numString_1 = cloze_numerical(double(solx), 0.05, 'Good job!', 'Incorrect, try again');
numString_2 = cloze_numerical(double(soly), 0.05, 'Good job!', 'Incorrect, try again');
numString_3 = cloze_numerical(double(solz), 0.05, 'Good job!', 'Incorrect, try again');

aString = '';
bString = '+';
gString = '+';
dString = '';
eString = '+';
hString = '+';
kString = '';
lString = '+';
mString = '+';

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

if g~= 1
    if g < -1
    gString = num2str(g);
    else if(g==-1)
    gString = '-';
    else if(g>-1)
    gString = strcat('+',num2str(g));  
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

if h~= 1
    if h < -1
    hString = num2str(h);
    else if(h==-1)
    hString = '-';
    else if(h>-1)
    hString = strcat('+',num2str(h));  
        end
        end
    end
end

if k~= 1
    kString = num2str(k);
    if (k==-1)
    kString = '-';
    end
end

if l~= 1
    if l < -1
    lString = num2str(l);
    else if(l==-1)
    lString = '-';
    else if(l>-1)
    lString = strcat('+',num2str(l));  
        end
        end
    end
end
if m~= 1
    if m < -1
    mString = num2str(m);
    else if(m==-1)
    mString = '-';
    else if(m>-1)
    mString = strcat('+',num2str(m));  
        end
        end
    end
end

%Question string joining
questionString = strcat ('Solve the following system of simultaneous equations using standard Gaussian elimination (including row sums): <br><br>$$\\small',...
aString,'x',bString,'y',gString,'z = ',num2str(c),'$$<br>$$\\small',dString,'x',eString,'y',hString,'z = ',num2str(f),'$$<br>$$\\small',kString,'x',lString,'y',mString,'z = ',num2str(j),...
'$$<br><br>Calculate upto 3 significant figures<br><br>',...
'x = ',numString_1,'<br>y = ',numString_2,'<br>z = ',numString_3);

%Feedback string joining
feedbackString = strcat ('To solve a system of linear equations using Gaussion elimination, we use the following steps : <br><br>',...
'1. Construct the augmented matrix for the system.<br>',...
'2. Use elementary row operations to transform the augmented matrix into a triangular one.<br>',...
'3. Write down the new linear system for which the triangular matrix is the associated augmented matrix.<br>',...
'4. Solve the new system<br><br>',...
'For solving a system of linear equations with 3 variables,<br><br>',...
'$$\\small ax + by + cz = u$$<br>$$\\small dx + ey + fz= v$$<br>$$\\small gx + hy +iz= w$$<br><br>',...
'Using the above steps, we construct an augmented matrix as follows,<br><br>',...
'$$\\small \\begin{pmatrix}','a & b & c','\\\\','d & e & f','\\\\','g & h & i','\\end{pmatrix}\\: = \\begin{pmatrix} u \\\\ v \\\\ w \\end{pmatrix}$$<br><br>',...
'Next we perform elementary row transformations on the augmented matrix such that it takes the following form,<br><br>',...
'$$\\small \\begin{pmatrix}','a^{1} & b^{1} & c^{1}','\\\\','0 & e^{1} & f^{1}','\\\\','0 & 0 & i^{1}','\\end{pmatrix}\\: = \\begin{pmatrix} u^{1} \\\\ v^{1} \\\\ w^{1} \\end{pmatrix}$$<br><br>',...
'Next we write down the new system of linear equations which is easier to calculate,<br><br>',...
'$$\\small a^{1} x + b^{1} y + c^{1} z = u^{1} $$<br>$$\\small e^{1} y + f^{1} z = v^{1} $$<br>\\small i^{1} z = w^{1} <br><br>',...
'We find the value of z from the third equation, then insert it in the second equation to get the value of y and use the values obtained from second and third equation to get the value of x in the first equation.');

%Complete question XML code generation 
xmlCode = question_cloze(i, ...
        'Gaussian elimination Level 2', ... 
        questionString, ...
        feedbackString, ...
        '');
    fprintf(file, xmlCode);
    
end 

%xml closing code
fprintf(file, quiz_end()); 
fclose(file);