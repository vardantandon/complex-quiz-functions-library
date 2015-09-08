file=fopen('Question_6_Level_1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code
for i=1:1:50
  
x = [1,-1,-1];

a = randi([1 10],1,1)*x(randi(length(x)));
b = randi ([1 10],1,1)*x(randi(length(x)));
c = randi([1 10],1,1)*x(randi(length(x)));
d = randi ([1 10],1,1)*x(randi(length(x)));  
    
A = [a,b;c,d];

e = eig(A);

if (isreal(e(1)) == 0 || isreal(e(2)) == 0)
    continue;
end 

if (e(1)<=e(2))
 numString_1 = cloze_numerical(e(1)||-e(1), 0, 'Good job!', 'Incorrect, try again');
 numString_2 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
else
 numString_1 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');  
 numString_2 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
end

questionString = strcat ('Find the eigenvalues and the associated eigenvectors of the following matrix: <br><br>',...
'$$\\small A = \\begin{pmatrix}',num2str(a),' & ',num2str(b),' \\\\',num2str(c),' & ',num2str(d),'\\end{pmatrix}\\:$$ <br><br>',...
'[Calculate upto 2 significant]<br><br>',...
'$$\\small \\lambda_{1} = $$',numString_1,'&nbsp;&nbsp;$$\\small \\lambda_{2}  = $$',numString_2,'<br><br>');
    

feedbackString = strcat('');


    
    
    
    
  xmlCode = question_cloze(i, ...
        'Eigenvector and Eigenvalues', ... 
        questionString, ...
        '', ...
        '');
        
  fprintf(file, xmlCode);   
    
end 
fprintf(file, quiz_end()); %xml closing code
fclose(file);