%Matrices Question 6 Level 2 - Eigenvector and Eigenvalues 3x3 matrix 
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('Question_6_Level_2.xml','w'); 
<<<<<<< HEAD

%xml initialization code
fprintf(file, quiz_start()); 

for i=1:1:200


%Calculations
=======
fprintf(file, quiz_start()); %xml initialization code
for i=1:1:100
  
>>>>>>> origin/master
x = [1,-1,-1];

a = randi([1 10],1,1)*x(randi(length(x)));
b = randi ([1 10],1,1)*x(randi(length(x)));
c = randi([1 10],1,1)*x(randi(length(x)));
d = randi ([1 10],1,1)*x(randi(length(x)));  
f = randi([1 10],1,1)*x(randi(length(x)));
g = randi ([1 10],1,1)*x(randi(length(x)));
h = randi([1 10],1,1)*x(randi(length(x)));
j = randi ([1 10],1,1)*x(randi(length(x))); 
k = randi ([1 10],1,1)*x(randi(length(x))); 

A = [a,b,c;d,f,g;h,j,k];

[v,e] = eig(A);

if (isreal(e(1,1)) == 0 || isreal(e(2,2)) == 0 || isreal(e(3,3)) == 0)
    continue;
end 

if(v(1,1)<0)
    v(1,1) = -1*v(1,1);
    v(2,1) = -1*v(2,1);
    v(3,1) = -1*v(3,1);   
end

if(v(1,2)<0)
    v(1,2) = -1*v(1,2);
    v(2,2) = -1*v(2,2);
    v(3,2) = -1*v(3,2);
end

if(v(1,3)<0)
    v(1,3) = -1*v(1,3);
    v(2,3) = -1*v(2,3);
    v(3,3) = -1*v(3,3);
end

if(v(1,1) == 0)
   
   if(v(2,1)<0) 
    v(2,1) = -1*v(2,1);
    v(3,1) = -1*v(3,1);
   end
   if(v(2,1)==0)
      if(v(3,1)<0)
       v(3,1) = -1*v(3,1); 
      end 
   end
end

if(v(1,2) == 0)
    
    if(v(2,2)<0) 
    v(2,2) = -1*v(1,2);
    v(3,2) = -1*v(2,2);
    end
   if(v(2,2)==0)
      if(v(3,2)<0)
       v(3,2) = -1*v(3,2); 
      end 
   end
end

if(v(1,3) == 0)
    
    if(v(2,3)<0) 
    v(2,3) = -1*v(1,3);
    v(3,3) = -1*v(3,3);
    end
   if(v(2,3)==0)
      if(v(3,3)<0)
       v(3,3) = -1*v(3,3); 
      end 
   end
end


%Embedded components string generation
if (e(1,1)<=e(2,2) && e(2,2)<=e(3,3))
   answer_1 = e(1,1);
   answer_1a = v(1,1);
   answer_1b = v(2,1);
   answer_1c = v(3,1);
   answer_2 = e(2,2);
   answer_2a = v(1,2);
   answer_2b = v(2,2);
   answer_2c = v(3,2);
   answer_3 = e(3,3);
   answer_3a = v(1,3);
   answer_3b = v(2,3);
   answer_3c = v(3,3);
   numString_1 = cloze_numerical(e(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_2 = cloze_numerical(e(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_3 = cloze_numerical(e(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_4 = cloze_numerical(v(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_5 = cloze_numerical(v(2,1), 0, 'Good job!', 'Incorrect, try again');
   numString_6 = cloze_numerical(v(3,1), 0, 'Good job!', 'Incorrect, try again');
   numString_7 = cloze_numerical(v(1,2), 0, 'Good job!', 'Incorrect, try again');
   numString_8 = cloze_numerical(v(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_9 = cloze_numerical(v(3,2), 0, 'Good job!', 'Incorrect, try again');
   numString_10 = cloze_numerical(v(1,3), 0, 'Good job!', 'Incorrect, try again');
   numString_11 = cloze_numerical(v(2,3), 0, 'Good job!', 'Incorrect, try again');
   numString_12 = cloze_numerical(v(3,3), 0, 'Good job!', 'Incorrect, try again');
else if (e(2,2)<=e(1,1) && e(1,1)<=e(3,3))
   answer_1 = e(2,2);
   answer_1a = v(1,2);
   answer_1b = v(2,2);
   answer_1c = v(3,2);
   answer_2 = e(1,1);
   answer_2a = v(1,1);
   answer_2b = v(2,1);
   answer_2c = v(3,1);
   answer_3 = e(3,3);
   answer_3a = v(1,3);
   answer_3b = v(2,3);
   answer_3c = v(3,3);
   numString_1 = cloze_numerical(e(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_2 = cloze_numerical(e(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_3 = cloze_numerical(e(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_4 = cloze_numerical(v(1,2), 0, 'Good job!', 'Incorrect, try again');
   numString_5 = cloze_numerical(v(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_6 = cloze_numerical(v(3,2), 0, 'Good job!', 'Incorrect, try again');
   numString_7 = cloze_numerical(v(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_8 = cloze_numerical(v(2,1), 0, 'Good job!', 'Incorrect, try again');
   numString_9 = cloze_numerical(v(3,1), 0, 'Good job!', 'Incorrect, try again');
   numString_10 = cloze_numerical(v(1,3), 0, 'Good job!', 'Incorrect, try again');
   numString_11 = cloze_numerical(v(2,3), 0, 'Good job!', 'Incorrect, try again');
   numString_12 = cloze_numerical(v(3,3), 0, 'Good job!', 'Incorrect, try again');
    else if (e(1,1)<=e(3,3) && e(3,3)<=e(2,2))
   answer_1 = e(1,1);
   answer_1a = v(1,1);
   answer_1b = v(2,1);
   answer_1c = v(3,1);
   answer_2 = e(3,3);
   answer_2a = v(1,3);
   answer_2b = v(2,3);
   answer_2c = v(3,3);
   answer_3 = e(2,2);
   answer_3a = v(1,2);
   answer_3b = v(2,2);
   answer_3c = v(3,2);
   numString_1 = cloze_numerical(e(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_2 = cloze_numerical(e(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_3 = cloze_numerical(e(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_4 = cloze_numerical(v(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_5 = cloze_numerical(v(2,1), 0, 'Good job!', 'Incorrect, try again');
   numString_6 = cloze_numerical(v(3,1), 0, 'Good job!', 'Incorrect, try again');
   numString_7 = cloze_numerical(v(1,3), 0, 'Good job!', 'Incorrect, try again');
   numString_8 = cloze_numerical(v(2,3), 0, 'Good job!', 'Incorrect, try again');
   numString_9 = cloze_numerical(v(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_10 = cloze_numerical(v(1,2), 0, 'Good job!', 'Incorrect, try again');
   numString_11 = cloze_numerical(v(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_12 = cloze_numerical(v(3,2), 0, 'Good job!', 'Incorrect, try again');
        else if (e(2,2)<=e(3,3) && e(3,3)<=e(1,1))
   answer_1 = e(2,2);
   answer_1a = v(1,1);
   answer_1b = v(2,1);
   answer_1c = v(3,1);
   answer_2 = e(3,3);
   answer_2a = v(1,3);
   answer_2b = v(2,3);
   answer_2c = v(3,3);
   answer_3 = e(1,1);
   answer_3a = v(1,1);
   answer_3b = v(2,1);
   answer_3c = v(3,1);
   numString_1 = cloze_numerical(e(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_2 = cloze_numerical(e(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_3 = cloze_numerical(e(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_4 = cloze_numerical(v(1,2), 0, 'Good job!', 'Incorrect, try again');
   numString_5 = cloze_numerical(v(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_6 = cloze_numerical(v(3,2), 0, 'Good job!', 'Incorrect, try again');
   numString_7 = cloze_numerical(v(1,3), 0, 'Good job!', 'Incorrect, try again');
   numString_8 = cloze_numerical(v(2,3), 0, 'Good job!', 'Incorrect, try again');
   numString_9 = cloze_numerical(v(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_10 = cloze_numerical(v(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_11 = cloze_numerical(v(2,1), 0, 'Good job!', 'Incorrect, try again');
   numString_12 = cloze_numerical(v(3,1), 0, 'Good job!', 'Incorrect, try again');
            else if (e(3,1)<=e(1,1) && e(1,1)<=e(2,2))
   answer_1 = e(3,3);
   answer_1a = v(1,3);
   answer_1b = v(2,3);
   answer_1c = v(3,3);
   answer_2 = e(1,1);
   answer_2a = v(1,1);
   answer_2b = v(2,1);
   answer_2c = v(3,1);
   answer_3 = e(2,2);
   answer_3a = v(1,2);
   answer_3b = v(2,2);
   answer_3c = v(3,2);
   numString_1 = cloze_numerical(e(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_2 = cloze_numerical(e(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_3 = cloze_numerical(e(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_4 = cloze_numerical(v(1,3), 0, 'Good job!', 'Incorrect, try again');
   numString_5 = cloze_numerical(v(2,3), 0, 'Good job!', 'Incorrect, try again');
   numString_6 = cloze_numerical(v(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_7 = cloze_numerical(v(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_8 = cloze_numerical(v(2,1), 0, 'Good job!', 'Incorrect, try again');
   numString_9 = cloze_numerical(v(3,1), 0, 'Good job!', 'Incorrect, try again');
   numString_10 = cloze_numerical(v(1,2), 0, 'Good job!', 'Incorrect, try again');
   numString_11 = cloze_numerical(v(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_12 = cloze_numerical(v(3,2), 0, 'Good job!', 'Incorrect, try again');
                else if (e(3,3)<=e(2,2) && e(2,2)<=e(1,1))
   answer_1 = e(3,3);
   answer_1a = v(1,3);
   answer_1b = v(2,3);
   answer_1c = v(3,3);
   answer_2 = e(2,2);
   answer_2a = v(1,2);
   answer_2b = v(2,2);
   answer_2c = v(3,2);
   answer_3 = e(1,1);
   answer_3a = v(1,1);
   answer_3b = v(2,1);
   answer_3c = v(3,1);
   numString_1 = cloze_numerical(e(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_2 = cloze_numerical(e(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_3 = cloze_numerical(e(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_4 = cloze_numerical(v(1,3), 0, 'Good job!', 'Incorrect, try again');
   numString_5 = cloze_numerical(v(2,3), 0, 'Good job!', 'Incorrect, try again');
   numString_6 = cloze_numerical(v(3,3), 0, 'Good job!', 'Incorrect, try again');
   numString_7 = cloze_numerical(v(1,2), 0, 'Good job!', 'Incorrect, try again');
   numString_8 = cloze_numerical(v(2,2), 0, 'Good job!', 'Incorrect, try again');
   numString_9 = cloze_numerical(v(3,2), 0, 'Good job!', 'Incorrect, try again');
   numString_10 = cloze_numerical(v(1,1), 0, 'Good job!', 'Incorrect, try again');
   numString_11 = cloze_numerical(v(2,1), 0, 'Good job!', 'Incorrect, try again');
   numString_12 = cloze_numerical(v(3,1), 0, 'Good job!', 'Incorrect, try again');
                    end
                end
            end
        end
    end
end

V1String = matrix_noname('$$\\small V_{1} = k_{1}$$',{numString_4 ;numString_5;numString_6});
V2String = matrix_noname('$$\\small V_{2} = k_{2}$$',{numString_7 ;numString_8;numString_9});
V3String = matrix_noname('$$\\small V_{3} = k_{3}$$',{numString_10 ;numString_11;numString_12});

%Question string joining
questionString = strcat ('Find the eigenvalues and the associated eigenvectors of the following matrix: <br><br>',...
'$$\\small A = \\begin{pmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f),' & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k),'\\end{pmatrix}\\:$$ <br><br>',...
'Calculate upto 3 significant figures and answer in increasing order $$\\small\\lambda_{1}\\leq\\lambda_{2}\\leq\\lambda_{3}$$<br><br>',...
'EigenValues:<br><br>',...
'$$\\small \\lambda_{1} = $$',numString_1,'&nbsp;&nbsp;$$\\small \\lambda_{2}  = $$',numString_2,'&nbsp;&nbsp;$$\\small \\lambda_{3}  = $$',numString_3,'<br><br>',...
'Associated EigenVectors:<br><br>',...
'$$\\small V_{1} = k_{1}\\begin{pmatrix}','v_{1,1}','\\\\','v_{1,2}','\\\\','v_{1,3}','\\end{pmatrix}\\:$$&nbsp;&nbsp;&nbsp;$$\\small V_{2} = k_2\\begin{pmatrix}','v_{2,1}','\\\\','v_{2,2}','\\\\','v_{2,3}','\\end{pmatrix}\\:$$&nbsp;&nbsp;&nbsp;$$\\small V_{3} = k_3\\begin{pmatrix}','v_{3,1}','\\\\','v_{3,2}','\\\\','v_{3,3}','\\end{pmatrix}\\:$$<br><br>',...
'Specify the answer as a unitory vector where $$\\small v_{1,1}$$ , $$\\small v_{2,1}$$ and $$\\small v_{3,1}$$ are positive. In case $$\\small v_{1,1}$$ , $$\\small v_{2,1}$$ or $$\\small v_{3,1}$$ are negative , you can multiply all the elements of the matrix by -1 to make them positive. If $$\\small v_{1,1} = 0$$ , $$\\small v_{2,1} = 0$$ or $$\\small v_{3,1} = 0$$ then check and make sure that $$\\small v_{1,2}$$ , $$\\small v_{2,2}$$ or $$\\small v_{3,2}$$ is given as positive respectively. If $$\\small v_{1,1} = v_{1,2} = 0$$ , $$\\small v_{2,1} = v_{2,2} = 0$$ or $$\\small v_{3,1} = v_{3,2} = 0$$ then check and make sure that $$\\small v_{1,3}$$ , $$\\small v_{2,3}$$ or $$\\small v_{3,3}$$ is given as positive respectively.<br><br>',...
 V1String,'&nbsp;&nbsp;&nbsp;',V2String,'&nbsp;&nbsp;&nbsp;',V3String,'<br><br>');

%Feedback string joining
feedbackString = strcat('In order to find the eigenvalues we look at characteristic equation $$\\small det(A - \\lambda I_{3}) = 0$$ where $$\\small I_{3}$$ is a 3x3 identity matrix]<br><br>',...
'$$\\small det(A - \\lambda I_{3}) = \\begin{vmatrix}',num2str(a),'-\\lambda',' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f),'-\\lambda',' & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k),'-\\lambda','\\end{vmatrix}\\: = 0 $$<br><br>',...
'Solving the determinant we get ,<br><br> $$\\small \\lambda_{1} = ',num2str(answer_1),'$$&nbsp;&nbsp;$$\\small \\lambda_{2} = ',num2str(answer_2),'$$&nbsp;&nbsp;$$\\small \\lambda_{3} = ',num2str(answer_3),'$$<br><br>',...
'The associated eigenvectors can be calculated as follows:<br><br>',...
'$$\\small (A - \\lambda_{1} I_{3})V_{1} = 0$$&nbsp;&nbsp;,&nbsp;&nbsp;$$\\small (A - \\lambda_{2} I_{3})V_{2} = 0$$&nbsp;&nbsp;and&nbsp;&nbsp;$$\\small (A - \\lambda_{3} I_{3})V_{3} = 0$$<br><br>',...
'Putting the corresponding value for $$\\small \\lambda_{1}$$&nbsp;we get,<br><br>',...
'$$\\small \\begin{bmatrix}',num2str(a),' - (',num2str(answer_1),') & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f),' - (',num2str(answer_1),') & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k),' - (',num2str(answer_1),') \\end{bmatrix}\\:.\\begin{bmatrix}','v_{1,1}',' \\\\','v_{1,2}',' \\\\','v_{1,3} \\end{bmatrix}\\: = 0$$<br><br>',...
'$$\\small \\Rightarrow \\begin{bmatrix}',num2str(a - answer_1),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f - answer_1),' & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k - answer_1),'\\end{bmatrix}\\:.\\begin{bmatrix}','v_{1,1}',' \\\\','v_{1,2}',' \\\\','v_{1,3} \\end{bmatrix}\\: = 0$$<br><br>',...
'Solving the equation we get the first eigenvector but in order to make to unitory we proceed as follows,<br><br>',...
'$$\\small v_{1,1} = \\frac{v_{1,1}}{\\sqrt{v_{1,1}^{2} + v_{1,2}^2 + v_{1,3}^2}} $$<br><br>',...
'$$\\small v_{1,2} = \\frac{v_{1,2}}{\\sqrt{v_{1,1}^{2} + v_{1,2}^2 + v_{1,3}^2}} $$<br><br>',...
'$$\\small v_{1,3} = \\frac{v_{1,3}}{\\sqrt{v_{1,1}^{2} + v_{1,2}^2 + v_{1,3}^2}} $$<br><br>',...
'So, The unitory eigenvector corresponding to $$\\small \\lambda_{1}$$&nbsp; can be written as: <br><br>',...
'$$\\small V_{1} = k_{1}\\begin{pmatrix}',num2str(answer_1a),'\\\\',num2str(answer_1b),'\\\\',num2str(answer_1c),'\\end{pmatrix}\\:$$<br><br>',...
'Putting the corresponding value for $$\\small \\lambda_{2}$$&nbsp;we get,<br><br>',...
'$$\\small \\begin{bmatrix}',num2str(a),' - (',num2str(answer_2),') & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f),' - (',num2str(answer_2),') & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k),' - (',num2str(answer_2),') \\end{bmatrix}\\:.\\begin{bmatrix}','v_{2,1}',' \\\\','v_{2,2}',' \\\\','v_{2,3} \\end{bmatrix}\\: = 0$$<br><br>',...
'$$\\small \\Rightarrow \\begin{bmatrix}',num2str(a - answer_2),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f - answer_2),' & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k - answer_2),'\\end{bmatrix}\\:.\\begin{bmatrix}','v_{2,1}',' \\\\','v_{2,2}',' \\\\','v_{2,3} \\end{bmatrix}\\: = 0$$<br><br>',...
'Solving the equation we get the first eigenvector but in order to make to unitory we proceed as follows,<br><br>',...
'$$\\small v_{2,1} = \\frac{v_{2,1}}{\\sqrt{v_{2,1}^{2} + v_{2,2}^2 + v_{2,3}^2}} $$<br><br>',...
'$$\\small v_{2,2} = \\frac{v_{2,2}}{\\sqrt{v_{2,1}^{2} + v_{2,2}^2 + v_{2,3}^2}} $$<br><br>',...
'$$\\small v_{2,3} = \\frac{v_{2,3}}{\\sqrt{v_{2,1}^{2} + v_{2,2}^2 + v_{2,3}^2}} $$<br><br>',...
'So, The unitory eigenvector corresponding to $$\\small \\lambda_{2}$$&nbsp; can be written as: <br><br>',...
'$$\\small V_{2} = k_{2}\\begin{pmatrix}',num2str(answer_2a),'\\\\',num2str(answer_2b),'\\\\',num2str(answer_2c),'\\end{pmatrix}\\:$$<br><br>',...
'Putting the corresponding value for $$\\small \\lambda_{3}$$&nbsp;we get,<br><br>',...
'$$\\small \\begin{bmatrix}',num2str(a),' - (',num2str(answer_3),') & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f),' - (',num2str(answer_3),') & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k),' - (',num2str(answer_3),') \\end{bmatrix}\\:.\\begin{bmatrix}','v_{3,1}',' \\\\','v_{3,2}',' \\\\','v_{3,3} \\end{bmatrix}\\: = 0$$<br><br>',...
'$$\\small \\Rightarrow \\begin{bmatrix}',num2str(a - answer_3),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f - answer_3),' & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k - answer_3),'\\end{bmatrix}\\:.\\begin{bmatrix}','v_{3,1}',' \\\\','v_{3,2}',' \\\\','v_{3,3} \\end{bmatrix}\\: = 0$$<br><br>',...
'Solving the equation we get the first eigenvector but in order to make to unitory we proceed as follows,<br><br>',...
'$$\\small v_{3,1} = \\frac{v_{3,1}}{\\sqrt{v_{3,1}^{2} + v_{3,2}^2 + v_{3,3}^2}} $$<br><br>',...
'$$\\small v_{3,2} = \\frac{v_{3,2}}{\\sqrt{v_{3,1}^{2} + v_{3,2}^2 + v_{3,3}^2}} $$<br><br>',...
'$$\\small v_{3,3} = \\frac{v_{3,3}}{\\sqrt{v_{3,1}^{2} + v_{3,2}^2 + v_{3,3}^2}} $$<br><br>',...
'So, The unitory eigenvector corresponding to $$\\small \\lambda_{3}$$&nbsp; can be written as: <br><br>',...
'$$\\small V_{3} = k_{3}\\begin{pmatrix}',num2str(answer_3a),'\\\\',num2str(answer_3b),'\\\\',num2str(answer_3c),'\\end{pmatrix}\\:$$<br><br>');

%Complete question XML code generation 
  xmlCode = question_cloze(i, ...
        'Eigenvector and Eigenvalues L2', ... 
        questionString, ...
        feedbackString, ...
        '');
        
  fprintf(file, xmlCode);   
    
end 

%xml closing code
fprintf(file, quiz_end()); 
fclose(file);