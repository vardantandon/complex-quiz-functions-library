file=fopen('Question_6_Level_2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code
for i=1:1:100
  
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

e = eig(A);

if (isreal(e(1)) == 0 || isreal(e(2)) == 0)
    continue;
end 

if (e(1)<=e(2) && e(2)<=e(3))
    numString_1 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
    numString_2 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
    numString_3 = cloze_numerical(e(3), 0, 'Good job!', 'Incorrect, try again');
else if (e(2)<=e(1) && e(1)<=e(3))
        numString_1 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
        numString_2 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
        numString_3 = cloze_numerical(e(3), 0, 'Good job!', 'Incorrect, try again');
    else if (e(1)<=e(2) && e(3)<=e(2))
            numString_1 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
            numString_2 = cloze_numerical(e(3), 0, 'Good job!', 'Incorrect, try again');
            numString_3 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
        else if (e(2)<=e(1) && e(3)<=e(1))
                numString_1 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
                numString_2 = cloze_numerical(e(3), 0, 'Good job!', 'Incorrect, try again');
                numString_3 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
            else if (e(3)<=e(1) && e(1)<=e(2))
                    numString_1 = cloze_numerical(e(3), 0, 'Good job!', 'Incorrect, try again');
                    numString_2 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
                    numString_3 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
                else if (e(3)<=e(2) && e(2)<=e(1))
                        numString_1 = cloze_numerical(e(3), 0, 'Good job!', 'Incorrect, try again');
                        numString_2 = cloze_numerical(e(2), 0, 'Good job!', 'Incorrect, try again');
                        numString_3 = cloze_numerical(e(1), 0, 'Good job!', 'Incorrect, try again');
                    end
                end
            end
        end
    end
end

questionString = strcat ('Find the eigenvalues and the associated eigenvectors of the following matrix: <br><br>',...
'$$\\small A = \\begin{pmatrix}',num2str(a),' & ',num2str(b),' & ',num2str(c),' \\\\',num2str(d),' & ',num2str(f),' & ',num2str(g),' \\\\',num2str(h),' & ',num2str(j),' & ',num2str(k),'\\end{pmatrix}\\:$$ <br><br>',...
'[Calculate upto 2 significant figures and answer in increasing order $$\\small\\lambda_{1}\\leq\\lambda_{2}\\leq\\lambda_{3}$$]<br><br>',...
'$$\\small \\lambda_{1} = $$',numString_1,'&nbsp;&nbsp;$$\\small \\lambda_{2}  = $$',numString_2,'&nbsp;&nbsp;$$\\small \\lambda_{3}  = $$',numString_3,'<br><br>');
    
  xmlCode = question_cloze(i, ...
        'Eigenvector and Eigenvalues L2', ... 
        questionString, ...
        '', ...
        '');
        
  fprintf(file, xmlCode);   
    
end 
fprintf(file, quiz_end()); %xml closing code
fclose(file);