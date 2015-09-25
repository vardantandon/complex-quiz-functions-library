%Matrices Question 6 Level 1 - Eigenvector and Eigenvalues 2x2 matrix 
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('Question_6_Level_1.xml','w');

%xml initialization code
fprintf(file, quiz_start());

for i=1:1:100

%Calculations
x = [1,-1,-1];

a = randi([1 10],1,1)*x(randi(length(x)));
b = randi ([1 10],1,1)*x(randi(length(x)));
c = randi([1 10],1,1)*x(randi(length(x)));
d = randi ([1 10],1,1)*x(randi(length(x)));  
    
A = [a,b;c,d];

[v,e] = eig(A);

if (isreal(e(1,1)) == 0 || isreal(e(2,2)) == 0 )
    continue;
end 

if(v(1,1)<0)
    v(1,1) = -1*v(1,1);
    v(2,1) = -1*v(2,1);
end

if(v(1,2)<0)
    v(1,2) = -1*v(1,2);
    v(2,2) = -1*v(2,2);
end

if(v(1,1) == 0)
    if(v(2,1)<0)
        v(2,1) = -1*v(2,1);
    end
end

if(v(1,2) == 0)
    if(v(2,2)<0)
        v(2,2) = -1*v(2,2);
    end
end

%Embedded components string generation
if (e(1,1)<=e(2,2))
 answer_1 = e(1,1);
 answer_1a = v(1,1);
 answer_1b = v(2,1);
 answer_2 = e(2,2);
 answer_2a = v(1,2);
 answer_2b = v(2,2);
 numString_1 = cloze_numerical(e(1,1), 0.05, 'Good job!', 'Incorrect, try again');
 numString_1a = cloze_numerical(v(1,1), 0.05, 'Good job!', 'Incorrect, try again');
 numString_1b = cloze_numerical(v(2,1), 0.05, 'Good job!', 'Incorrect, try again');
 numString_2 = cloze_numerical(e(2,2), 0.05, 'Good job!', 'Incorrect, try again');
 numString_2a = cloze_numerical(v(1,2), 0.05, 'Good job!', 'Incorrect, try again');
 numString_2b = cloze_numerical(v(2,2), 0.05, 'Good job!', 'Incorrect, try again');
else
    answer_1 = e(2,2);
    answer_1a = v(1,2);
    answer_1b = v(2,2);
    answer_2 = e(1,1);
    answer_2a = v(1,1);
    answer_2b = v(2,1);
 numString_1 = cloze_numerical(e(2,2), 0.05, 'Good job!', 'Incorrect, try again');  
 numString_1a = cloze_numerical(v(1,2), 0.05, 'Good job!', 'Incorrect, try again');
 numString_1b = cloze_numerical(v(2,2), 0.05, 'Good job!', 'Incorrect, try again');
 numString_2 = cloze_numerical(e(1,1), 0.05, 'Good job!', 'Incorrect, try again');
 numString_2a = cloze_numerical(v(1,1), 0.05, 'Good job!', 'Incorrect, try again');
 numString_2b = cloze_numerical(v(2,1), 0.05, 'Good job!', 'Incorrect, try again');
end

V1String = matrix_noname('$$\\small V_{1} = k_{1}$$',{numString_1a ;numString_1b});
V2String = matrix_noname('$$\\small V_{2} = k_{2}$$',{numString_2a ;numString_2b});

%Question string joining
questionString = strcat ('Find the eigenvalues and the associated eigenvectors of the following matrix: <br><br>',...
'$$\\small A = \\begin{pmatrix}',num2str(a),' & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d),'\\end{pmatrix}\\:$$ <br><br>',...
'Calculate upto 3 significant figures and answer in increasing order $$\\small\\lambda_{1}\\leq\\lambda_{2}$$<br><br>',...
'EigenValues:<br><br>',...
'$$\\small \\lambda_{1} = $$',numString_1,'&nbsp;&nbsp;$$\\small \\lambda_{2}  = $$',numString_2,'<br><br>',...
'Associated EigenVectors:<br><br>',...
'$$\\small V_{1} = k_{1}\\begin{pmatrix}','v_{1,1}','\\\\','v_{1,2}','\\end{pmatrix}\\:$$&nbsp;&nbsp;&nbsp;$$\\small V_{2} = k_2\\begin{pmatrix}','v_{2,1}','\\\\','v_{2,2}','\\end{pmatrix}\\:$$<br><br>',...
'Specify the answer as a unitory vector where $$\\small v_{1,1}$$ and $$\\small v_{2,1}$$ are positive. In case $$\\small v_{1,1}$$ or $$\\small v_{2,1}$$ are negative , you can multiply all the elements of the matrix by -1 to make them positive.If $$\\small v_{1,1} = 0$$ or $$\\small v_{2,1} = 0$$ then check and make sure that $$\\small v_{1,2}$$ or $$\\small v_{2,2}$$ is given as positive respectively.<br><br>',...
 V1String,'&nbsp;&nbsp;&nbsp;',V2String,'<br><br>');
  
%Feedback string joining
feedbackString = strcat('In order to find the eigenvalues we look at characteristic equation $$\\small det(A - \\lambda I_{2}) = 0$$ where $$\\small I_{2}$$ is a 2x2 identity matrix]<br><br>',...
'$$\\small det(A - \\lambda I_{2}) = \\begin{vmatrix}',num2str(a),'-\\lambda',' & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d),'-\\lambda','\\end{vmatrix}\\: = 0 $$<br><br>',...
'Solving the determinant we get ,<br><br> $$\\small \\lambda_{1} = ',num2str(answer_1),'$$&nbsp;&nbsp;$$\\small \\lambda_{2} = ',num2str(answer_2),'$$<br><br>',...
'The associated eigenvectors can be calculated as follows:<br><br>',...
'$$\\small (A - \\lambda_{1} I_{2})V_{1} = 0$$&nbsp;&nbsp;and&nbsp;&nbsp;$$\\small (A - \\lambda_{2} I_{2})V_{2} = 0$$<br><br>',...
'Putting the corresponding value for $$\\small \\lambda_{1}$$&nbsp;we get,<br><br>',...
'$$\\small \\begin{bmatrix}',num2str(a),' - (',num2str(answer_1),') & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d),' - (',num2str(answer_1),') \\end{bmatrix}\\:.\\begin{bmatrix}','v_{1,1}',' \\\\','v_{1,2}','\\end{bmatrix}\\: = 0$$<br><br>',...
'$$\\small \\Rightarrow \\begin{bmatrix}',num2str(a - answer_1),' & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d - answer_1),'\\end{bmatrix}\\:.\\begin{bmatrix}','v_{1,1}',' \\\\','v_{1,2}','\\end{bmatrix}\\: = 0$$<br><br>',...
'Solving the equation we get the first eigenvector but in order to make to unitory we proceed as follows,<br><br>',...
'$$\\small v_{1,1} = \\frac{v_{1,1}}{\\sqrt{v_{1,1}^{2} + v_{1,2}^2}} $$<br><br>',...
'$$\\small v_{1,2} = \\frac{v_{1,2}}{\\sqrt{v_{1,1}^{2} + v_{1,2}^2}} $$<br><br>',...
'So, The unitory eigenvector corresponding to $$\\small \\lambda_{1}$$&nbsp; can be written as: <br><br>',...
'$$\\small V_{1} = k_{1}\\begin{pmatrix}',num2str(answer_1a),'\\\\',num2str(answer_1b),'\\end{pmatrix}\\:$$<br><br>',...
'Putting the corresponding value for $$\\small \\lambda_{2}$$&nbsp;we get,<br><br>',...
'$$\\small \\begin{bmatrix}',num2str(a),' - (',num2str(answer_2),') & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d),' - (',num2str(answer_2),') \\end{bmatrix}\\:.\\begin{bmatrix}','v_{2,1}',' \\\\','v_{2,2}','\\end{bmatrix}\\: = 0$$<br><br>',...
'$$\\small \\Rightarrow \\begin{bmatrix}',num2str(a - answer_2),' & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d - answer_2),'\\end{bmatrix}\\:.\\begin{bmatrix}','v_{2,1}',' \\\\','v_{2,2}','\\end{bmatrix}\\: = 0$$<br><br>',...
'Solving the equation we get the second eigenvector but in order to make to unitory we proceed as follows,<br><br>',...
'$$\\small v_{2,1} = \\frac{v_{2,1}}{\\sqrt{v_{2,1}^{2} + v_{2,2}^{2}}} $$<br><br>',...
'$$\\small v_{2,2} = \\frac{v_{2,2}}{\\sqrt{v_{2,1}^{2} + v_{2,2}^2}} $$<br><br>',...
'So, The unitory eigenvector corresponding to $$\\small \\lambda_{2}$$&nbsp; can be written as: <br><br>',...
'$$\\small V_{2} = k_2\\begin{pmatrix}',num2str(answer_2a),'\\\\',num2str(answer_2b),'\\end{pmatrix}\\:$$');

%Complete question XML code generation     
  xmlCode = question_cloze(i, ...
        'Eigenvector and Eigenvalues', ... 
        questionString, ...
        feedbackString, ...
        '');
        
  fprintf(file, xmlCode);   
    
end 

%xml closing code
fprintf(file, quiz_end()); 
fclose(file);