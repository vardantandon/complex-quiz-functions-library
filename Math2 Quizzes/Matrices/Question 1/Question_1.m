file1=fopen('Question_1_Add.xml','w'); 
file2=fopen('Question_1_Mult.xml','w'); 
file3=fopen('Question_1_Det.xml','w'); 
file4=fopen('Question_1_Inv.xml','w'); 

fprintf(file1, quiz_start());%xml initialization code
fprintf(file2, quiz_start());
fprintf(file3, quiz_start());
fprintf(file4, quiz_start());


for i=1:1:100
    
x = [1,-1,-1];
pos = randi(length(x));
pos_1 = randi(length(x));
num = x(pos);
num_1 = x(pos_1);
a = randi([1 20],1,1)*num;
b = randi ([1 20],1,1)*num_1;
c = randi([1 20],1,1)*num_1;
d = randi ([1 20],1,1)*num;
e = randi([1 20],1,1)*num_1;
f = randi ([1 20],1,1)*num;
g = randi([1 20],1,1)*num_1;
h = randi ([1 20],1,1)*num;
i_1 = randi ([1 20],1,1)*num

j = randi([1 20],1,1)*num_1;
k = randi ([1 20],1,1)*num;
l = randi([1 20],1,1)*num;
m = randi ([1 20],1,1)*num_1;
n = randi([1 20],1,1)*num;
o = randi ([1 20],1,1)*num;
p = randi([1 20],1,1)*num_1;
q = randi ([1 20],1,1)*num_1;
r = randi ([1 20],1,1)*num;

A = [a,b,c;d,e,f;g,h,i_1];
B = [j,k,l;m,n,o;p,q,r];

Answer_1 = A+B;
Answer_2 = B-A;
Answer_3 = A*B;
Answer_4 = j*(n*r - o*q) - k*(m*r - o*p) + l*(m*q - n*p);
if ((a*(e*i_1 - f*h) - b*(d*i_1 - f*g) + c*(d*h - e*g)) == 0)
    continue;
end 
Answer_5 = inv(A);

numString_1 = cloze_numerical(Answer_1(1,1), 0, 'Good job!', 'Incorrect, try again');
numString_2 = cloze_numerical(Answer_1(1,2), 0, 'Good job!', 'Incorrect, try again');
numString_3 = cloze_numerical(Answer_1(1,3), 0, 'Good job!', 'Incorrect, try again');
numString_4 = cloze_numerical(Answer_1(2,1), 0, 'Good job!', 'Incorrect, try again');
numString_5 = cloze_numerical(Answer_1(2,2), 0, 'Good job!', 'Incorrect, try again');
numString_6 = cloze_numerical(Answer_1(2,3), 0, 'Good job!', 'Incorrect, try again');
numString_7 = cloze_numerical(Answer_1(3,1), 0, 'Good job!', 'Incorrect, try again');
numString_8 = cloze_numerical(Answer_1(3,2), 0, 'Good job!', 'Incorrect, try again');
numString_9 = cloze_numerical(Answer_1(3,3), 0, 'Good job!', 'Incorrect, try again');

numString_10 = cloze_numerical(Answer_2(1,1), 0, 'Good job!', 'Incorrect, try again');
numString_11 = cloze_numerical(Answer_2(1,2), 0, 'Good job!', 'Incorrect, try again');
numString_12 = cloze_numerical(Answer_2(1,3), 0, 'Good job!', 'Incorrect, try again');
numString_13 = cloze_numerical(Answer_2(2,1), 0, 'Good job!', 'Incorrect, try again');
numString_14 = cloze_numerical(Answer_2(2,2), 0, 'Good job!', 'Incorrect, try again');
numString_15 = cloze_numerical(Answer_2(2,3), 0, 'Good job!', 'Incorrect, try again');
numString_16 = cloze_numerical(Answer_2(3,1), 0, 'Good job!', 'Incorrect, try again');
numString_17 = cloze_numerical(Answer_2(3,2), 0, 'Good job!', 'Incorrect, try again');
numString_18 = cloze_numerical(Answer_2(3,3), 0, 'Good job!', 'Incorrect, try again');

numString_19 = cloze_numerical(Answer_3(1,1), 0, 'Good job!', 'Incorrect, try again');
numString_20 = cloze_numerical(Answer_3(1,2), 0, 'Good job!', 'Incorrect, try again');
numString_21 = cloze_numerical(Answer_3(1,3), 0, 'Good job!', 'Incorrect, try again');
numString_22 = cloze_numerical(Answer_3(2,1), 0, 'Good job!', 'Incorrect, try again');
numString_23 = cloze_numerical(Answer_3(2,2), 0, 'Good job!', 'Incorrect, try again');
numString_24 = cloze_numerical(Answer_3(2,3), 0, 'Good job!', 'Incorrect, try again');
numString_25 = cloze_numerical(Answer_3(3,1), 0, 'Good job!', 'Incorrect, try again');
numString_26 = cloze_numerical(Answer_3(3,2), 0, 'Good job!', 'Incorrect, try again');
numString_27 = cloze_numerical(Answer_3(3,3), 0, 'Good job!', 'Incorrect, try again');



numString_28 = cloze_numerical(Answer_4, 0.01, 'Good job!', 'Incorrect, try again');


numString_29 = cloze_numerical(Answer_5(1,1), 0.01, 'Good job!', 'Incorrect, try again');
numString_30 = cloze_numerical(Answer_5(1,2), 0.01, 'Good job!', 'Incorrect, try again');
numString_31 = cloze_numerical(Answer_5(1,3), 0.01, 'Good job!', 'Incorrect, try again');
numString_32 = cloze_numerical(Answer_5(2,1), 0.01, 'Good job!', 'Incorrect, try again');
numString_33 = cloze_numerical(Answer_5(2,2), 0.01, 'Good job!', 'Incorrect, try again');
numString_34 = cloze_numerical(Answer_5(2,3), 0.01, 'Good job!', 'Incorrect, try again');
numString_35 = cloze_numerical(Answer_5(3,1), 0.01, 'Good job!', 'Incorrect, try again');
numString_36 = cloze_numerical(Answer_5(3,2), 0.01, 'Good job!', 'Incorrect, try again');
numString_37 = cloze_numerical(Answer_5(3,3), 0.01, 'Good job!', 'Incorrect, try again');


questionString1 = strcat('Given the matrices A and B :<br><br> A = ',...
'$$\\small \\begin{pmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(e),' & ',num2str(f),' \\\\',num2str(g),' & ',num2str(h),' & ',num2str(i_1),'\\end{pmatrix}\\:$$ <br><br>',...
'B = $$\\small \\begin{pmatrix}',num2str(j),' & ',num2str(k),' & ',num2str(l),' \\\\',num2str(m),' & ',num2str(n),' & ',num2str(o),' \\\\',num2str(p),' & ',num2str(q),' & ',num2str(r),'\\end{pmatrix}\\:$$ <br><br>',...
'Calculate the following expressions and fill in the elements accordingly : <br><br>C = A + B =',...
'$$\\small \\begin{pmatrix}c_{11} & c_{12} & c_{13} \\\\c_{21} & c_{22} & c_{23} \\\\c_{31} & c_{32} & c_{33}\\end{pmatrix}\\:$$<br><br>',...
'c<sub>11</sub> ',numString_1,'&nbsp;&nbsp;c<sub>12</sub> ',numString_2,'&nbsp;&nbsp;c<sub>13</sub> ',numString_3,...
'<br>c<sub>21</sub> ',numString_4,'&nbsp;&nbsp;c<sub>22</sub> ',numString_5,'&nbsp;&nbsp;c<sub>23</sub> ',numString_6,...
'<br>c<sub>31</sub> ',numString_7,'&nbsp;&nbsp;c<sub>32</sub> ',numString_8,'&nbsp;&nbsp;c<sub>33</sub> ',numString_9,...
'<br><br>D = B - A = ',...
 '$$\\small \\begin{pmatrix}d_{11} & d_{12} & d_{13} \\\\d_{21} & d_{22} & d_{23} \\\\d_{31} & d_{32} & d_{33}\\end{pmatrix}\\:$$<br><br>',...
 'd<sub>11</sub> ',numString_10,'&nbsp;&nbsp;d<sub>12</sub> ',numString_11,'&nbsp;&nbsp;d<sub>13</sub> ',numString_12,...
 '<br>d<sub>21</sub> ',numString_13,'&nbsp;&nbsp;d<sub>22</sub> ',numString_14,'&nbsp;&nbsp;d<sub>23</sub> ',numString_15,...
 '<br>d<sub>31</sub> ',numString_16,'&nbsp;&nbsp;d<sub>32</sub> ',numString_17,'&nbsp;&nbsp;d<sub>33</sub> ',numString_18);
questionString2 = strcat('E = AB = ',...
 '$$\\small \\begin{pmatrix}e_{11} & e_{12} & e_{13} \\\\e_{21} & e_{22} & e_{23} \\\\e_{31} & e_{32} & e_{33}\\end{pmatrix}\\:$$<br><br>',...
 'e<sub>11</sub> ',numString_19,'&nbsp;&nbsp;e<sub>12</sub> ',numString_20,'&nbsp;&nbsp;e<sub>13</sub> ',numString_21,...
 '<br>e<sub>21</sub> ',numString_22,'&nbsp;&nbsp;e<sub>22</sub> ',numString_23,'&nbsp;&nbsp;e<sub>23</sub> ',numString_24,...
 '<br>e<sub>31</sub> ',numString_25,'&nbsp;&nbsp;e<sub>32</sub> ',numString_26,'&nbsp;&nbsp;e<sub>33</sub> ',numString_27);
questionString3 = strcat('Determinant of B = ',numString_28);
questionString4 = strcat('F = Inverse of A = ',...
 '$$\\small \\begin{pmatrix}f_{11} & f_{12} & f_{13} \\\\f_{21} & f_{22} & f_{23} \\\\f_{31} & f_{32} & f_{33}\\end{pmatrix}\\:$$<br><br>',...
 'f<sub>11</sub> ',numString_29,'&nbsp;&nbsp;f<sub>12</sub> ',numString_30,'&nbsp;&nbsp;f<sub>13</sub> ',numString_31,...
 '<br>f<sub>21</sub> ',numString_32,'&nbsp;&nbsp;f<sub>22</sub> ',numString_33,'&nbsp;&nbsp;f<sub>23</sub> ',numString_34,...
 '<br>f<sub>31</sub> ',numString_35,'&nbsp;&nbsp;f<sub>32</sub> ',numString_36,'&nbsp;&nbsp;f<sub>33</sub> ',numString_37);
 
 
 feedbackString1 = strcat('<b>Addition and Substraction</b> : Addition and substraction of two matrices can take place only if they have the same',...
 ' number of rows and columns.In order to perform addition or substraction the corresponding entries of both the matrices are added or substracted.For two 3x3 matrices, this can',...
 ' be done as follows:<br><br> $$\\small A = \\begin{pmatrix}a_{11} & a_{12} & a_{13} \\\\a_{21} & a_{22} & a_{23} \\\\a_{31} & a_{32} & a_{33}\\end{pmatrix}\\:',...
 ' B = \\begin{pmatrix}b_{11} & b_{12} & b_{13} \\\\b_{21} & b_{22} & b_{23} \\\\b_{31} & b_{32} & b_{33}\\end{pmatrix}\\:$$ <br><br>',...
 '$$\\small A \\pm B = \\begin{pmatrix}a_{11} \\pm b_{11} & a_{12} \\pm b_{12} & a_{13} \\pm b_{13} \\\\ a_{21} \\pm b_{21} & a_{22} \\pm b_{22} & a_{23} \\pm b_{23} \\\\ a_{31} \\pm b_{31} & a_{32} \\pm b_{32} & a_{33} \\pm b_{33}\\end{pmatrix}\\:$$ <br><br>');
 feedbackString2 = strcat('<b>Multiplication</b> : Multiplication of two matrices can take place only if the number of columns of the first matrix equals the number of rows of the second matrix.',...
 'The resultant matrix will have the same number of rows as the first matrix and same number of columns as the second matrix.',...
 'So assuming that A and B can be multiplied, the element c<sub>i,j</sub> in the resultant matrix is obtained by multiplying in a one to one basis the elements of the i-row in the first matrix with the j-column of the second matrix and adding all products.',...
 'For two 3x3 matrices, this can be done as follows:<br><br>',...
 '$$\\small A = \\begin{pmatrix}a_{11} & a_{12} & a_{13} \\\\a_{21} & a_{22} & a_{23} \\\\a_{31} & a_{32} & a_{33}\\end{pmatrix}\\:',...
 'B = \\begin{pmatrix}b_{11} & b_{12} & b_{13} \\\\b_{21} & b_{22} & b_{23} \\\\b_{31} & b_{32} & b_{33}\\end{pmatrix}\\:$$ <br><br>',...
 '$$\\small AB = \\begin{pmatrix}a_{11}b_{11} + a_{12}b_{21} + a_{13}b_{31} & a_{11}b_{12} + a_{12}b_{22} + a_{13}b_{32} & a_{11}b_{13} + a_{12}b_{23} + a_{13}b_{33} \\\\',...
 'a_{21}b_{11} + a_{22}b_{21} + a_{23}b_{31} & a_{21}b_{12} + a_{22}b_{22} + a_{23}b_{32} & a_{21}b_{13} + a_{22}b_{23} + a_{23}b_{33} \\\\',...
 'a_{31}b_{11} + a_{32}b_{21} + a_{33}b_{31} & a_{31}b_{12} + a_{32}b_{22} + a_{33}b_{32} & a_{31}b_{13} + a_{32}b_{23} + a_{33}b_{33}\\end{pmatrix}\\:$$<br><br>');
 feedbackString3 = strcat('<b>Determinant</b> : The determinant of a matrix is useful to calculate the inverse of a matrix and to solve/assess a system of linear equations.',...
 'Determinant only exists for square matrices.The determinant of a 3x3 matrix can be calculated as follows : <br><br>',...
 '$$\\small A = \\begin{pmatrix}a_{11} & a_{12} & a_{13} \\\\a_{21} & a_{22} & a_{23} \\\\a_{31} & a_{32} & a_{33}\\end{pmatrix}\\:$$<br><br>',...
 'det(A) = a<sub>11</sub>$$\\small \\begin{vmatrix}a_{22} & a_{23} \\\\a_{32} & a_{33} \\end{vmatrix}\\:$$ - a<sub>12</sub>$$\\small \\begin{vmatrix}a_{21} & a_{23} \\\\a_{31} & a_{33} \\end{vmatrix}\\:$$ + a<sub>13</sub>$$\\small \\begin{vmatrix}a_{21} & a_{22} \\\\a_{31} & a_{32} \\end{vmatrix}\\:$$<br><br>',...
 '$$\\small \\Rightarrow$$ a<sub>11</sub>(a<sub>22</sub>a<sub>33</sub> - a<sub>23</sub>a<sub>32</sub>) - a<sub>12</sub>(a<sub>21</sub>a<sub>33</sub> - a<sub>23</sub>a<sub>31</sub>) + a<sub>13</sub>(a<sub>21</sub>a<sub>23</sub> - a<sub>22</sub>a<sub>31</sub>)<br><br>',...
 'For higher order matrices, its a good practice to first calculate the determinants of the minor matrices and then using the formula to calculate the final determinant.<br><br>');
 feedbackString4 = strcat('<b>Inverse</b> : The inverse of a square matrix A is another matrix A<sup>-1</sup>such that<br>AA<sup>-1</sup> = I where I is an identity matrix of the same order as the matrix.',...
 'If the determinant of a matrix is zero then it will not have an inverse and it is considered to be a singular matrix.For a 2x2 matrix the inverse can be calculated as follows : <br><br>',...
 '$$\\small A = \\begin{pmatrix}a_{11} & a_{12} \\\\a_{21} & a_{22} \\end{pmatrix}\\:$$<br><br>',...
 '$$\\small A^{-1} = \\frac{1}{|A|}\\begin{bmatrix}a_{22} & -a_{12} \\\\-a_{21} & a_{11} \\end{bmatrix}\\:$$<br><br>',...
 '$$\\small \\Rightarrow \\frac{1}{a_{11}a_{22} - a_{12}a_{21}}\\begin{bmatrix}a_{22} & -a_{12} \\\\-a_{21} & a_{11} \\end{bmatrix}\\:$$<br><br>',...
 'For a 3x3 matrix the inverse can be calculated as follows : <br><br>',...
 '$$\\small A = \\begin{pmatrix}a_{11} & a_{12} & a_{13} \\\\a_{21} & a_{22} & a_{23} \\\\a_{31} & a_{32} & a_{33}\\end{pmatrix}\\:$$<br><br>',...
 'Now we calculate the cofactors of all the entries : <br><br>',...
 'Cofactor of a<sub>11</sub> (c<sub>11</sub>) = $$\\small \\begin{vmatrix}a_{22} & a_{23} \\\\a_{32} & a_{33} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>12</sub> (c<sub>12</sub>)= $$\\small -\\begin{vmatrix}a_{21} & a_{23} \\\\a_{31} & a_{33} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>13</sub> (c<sub>13</sub>)= $$\\small \\begin{vmatrix}a_{21} & a_{22} \\\\a_{31} & a_{32} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>21</sub> (c<sub>21</sub>)= $$\\small -\\begin{vmatrix}a_{12} & a_{13} \\\\a_{32} & a_{33} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>22</sub> (c<sub>22</sub>)= $$\\small \\begin{vmatrix}a_{11} & a_{13} \\\\a_{31} & a_{33} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>23</sub> (c<sub>23</sub>)= $$\\small -\\begin{vmatrix}a_{11} & a_{12} \\\\a_{31} & a_{32} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>31</sub> (c<sub>31</sub>)= $$\\small \\begin{vmatrix}a_{12} & a_{13} \\\\a_{22} & a_{23} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>32</sub> (c<sub>32</sub>)= $$\\small -\\begin{vmatrix}a_{11} & a_{13} \\\\a_{21} & a_{23} \\end{vmatrix}\\:$$<br><br>',...
 'Cofactor of a<sub>33</sub> (c<sub>33</sub>)= $$\\small \\begin{vmatrix}a_{11} & a_{12} \\\\a_{21} & a_{22} \\end{vmatrix}\\:$$<br><br>',...
 '$$\\small C = \\begin{pmatrix}c_{11} & c_{12} & c_{13} \\\\c_{21} & c_{22} & c_{23} \\\\c_{31} & c_{32} & c_{33}\\end{pmatrix}\\:$$ <br><br>',...
 'Adjoint (A) = C<sup>T</sup> where T stands for transpose of the matrix (c<sub>ij</sub> = c<sub>ji</sub>)<br><br>' ,...
 '$$\\small Adjoint(A) = \\begin{pmatrix}c_{11} & c_{21} & c_{31} \\\\c_{12} & c_{22} & c_{32} \\\\c_{13} & c_{23} & c_{33}\\end{pmatrix}\\:$$ <br><br>',...
 '$$\\small A^{-1} = \\frac{1}{|A|}Adjoint(A)$$ where |A| is the determinant of A and Adjoint(A) can been calculated from above.<br><br>',...
 'The correct answers are : <br><br>',...
 '$$\\small C = A + B = \\begin{pmatrix}',num2str(Answer_1(1,1)),' & ',num2str(Answer_1(1,2)),' & ',num2str(Answer_1(1,3)),' \\\\',num2str(Answer_1(2,1)),' & ',num2str(Answer_1(2,2)),' & ',num2str(Answer_1(2,3)),' \\\\',num2str(Answer_1(3,1)),' & ',num2str(Answer_1(3,2)),' & ',num2str(Answer_1(3,3)),'\\end{pmatrix}\\:$$<br><br>',...
 '$$\\small D = B - A = \\begin{pmatrix}',num2str(Answer_2(1,1)),' & ',num2str(Answer_2(1,2)),' & ',num2str(Answer_2(1,3)),' \\\\',num2str(Answer_2(2,1)),' & ',num2str(Answer_2(2,2)),' & ',num2str(Answer_2(2,3)),' \\\\',num2str(Answer_2(3,1)),' & ',num2str(Answer_2(3,2)),' & ',num2str(Answer_2(3,3)),'\\end{pmatrix}\\:$$<br><br>',...
 '$$\\small E = AB = \\begin{pmatrix}',num2str(Answer_3(1,1)),' & ',num2str(Answer_3(1,2)),' & ',num2str(Answer_3(1,3)),' \\\\',num2str(Answer_3(2,1)),' & ',num2str(Answer_3(2,2)),' & ',num2str(Answer_3(2,3)),' \\\\',num2str(Answer_3(3,1)),' & ',num2str(Answer_3(3,2)),' & ',num2str(Answer_3(3,3)),'\\end{pmatrix}\\:$$<br><br>',...
 '$$\\small Det(B) = ',num2str(Answer_4),'$$<br><br>',...
 '$$\\small A^{-1} = \\begin{pmatrix}',num2str(Answer_5(1,1)),' & ',num2str(Answer_5(1,2)),' & ',num2str(Answer_5(1,3)),' \\\\',num2str(Answer_5(2,1)),' & ',num2str(Answer_5(2,2)),' & ',num2str(Answer_5(2,3)),' \\\\',num2str(Answer_5(3,1)),' & ',num2str(Answer_5(3,2)),' & ',num2str(Answer_5(3,3)),'\\end{pmatrix}\\:$$<br><br>');
 
 
  xmlCode1 = question_cloze(i, ...
        'Basic operations', ... 
        questionString1, ...
        feedbackString1, ...
        '');
  xmlCode2 = question_cloze(i, ...
        'Basic operations', ... 
        questionString2, ...
        feedbackString2, ...
        '');
  xmlCode3 = question_cloze(i, ...
        'Basic operations', ... 
        questionString3, ...
        feedbackString3, ...
        '');
  xmlCode4 = question_cloze(i, ...
        'Basic operations', ... 
        questionString4, ...
        feedbackString4, ...
        '');
        
  fprintf(file1, xmlCode1);
  fprintf(file2, xmlCode2);
  fprintf(file3, xmlCode3);
  fprintf(file4, xmlCode4);
  
end 
fprintf(file1, quiz_end());
fprintf(file2, quiz_end());
fprintf(file3, quiz_end());
fprintf(file4, quiz_end());%xml closing code
fclose(file1);
fclose(file2);
fclose(file3);
fclose(file4);