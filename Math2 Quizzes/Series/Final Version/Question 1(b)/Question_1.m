file = fopen('Question_1.xml', 'w');
fprintf(file,quiz_start());

for i=1:1:100
    
    %Calculations
    flag = randi([1 3],1,1)
    multiplier = [1,10,100]
    pos = randi(length(multiplier))
    numb = multiplier(pos)
    
    multiplier_1 = [1,-1,-1]
    pos_1 = randi(length(multiplier_1))
    numb_1 = multiplier_1(pos_1)
    
    if (flag == 1)
      
    a = randi([1 20],1,1)*numb*numb_1
    b = randi([80 100],1,1)*numb 
    c = randi([0 1],1,1)
    d = 2;
    
    
    if (c==0)
    var = ' odd';
        
    if ((mod(a,2) ~= 0) && (mod(b,2) ~= 0))
    n = (((((b-1))-(a+1))/2)) + 2
    sum = n/2*(2*(a) + (n-1)*d)
    a1 = a
    b1 = b
    end
    
    if ((mod(a,2) == 0) && (mod(b,2) ~= 0))
    n = ((((b-1))-(a))/2) + 1
    sum = n/2*(2*(a+1) + (n-1)*d)
    a1 = a + 1
    b1 = b
    end
    
    if ((mod(a,2) ~= 0) && (mod(b,2) == 0))
    n = (((b)-(a+1))/2) + 1
    sum = n/2*(2*(a) + (n-1)*d)
    a1 = a
    b1 = b - 1
    end
       
    if ((mod(a,2) == 0) && (mod(b,2) == 0))
    n = ((b)-(a))/2
    sum = n/2*(2*(a+1) + (n-1)*d)
    a1 = a+1
    b1 = b-1
    end
    
    else
    var = ' even';
        
    if ((mod(a,2) ~= 0) && (mod(b,2) ~= 0))
    n = ((b)-(a))/2
    sum = n/2*(2*(a+1) + (n-1)*d)
    a1 = a+1
    b1 = b-1
    end
    
    if ((mod(a,2) == 0) && (mod(b,2) ~= 0))
    n = ((((b))-(a+1))/2) + 1
    sum = n/2*(2*(a) + (n-1)*d)
    a1 = a
    b1 = b-1
    end
    
    if ((mod(a,2) ~= 0) && (mod(b,2) == 0))
    n = (((b-1)-(a))/2) + 1
    sum = n/2*(2*(a+1) + (n-1)*d)
    a1 = a+1
    b1 = b
    end
       
    if ((mod(a,2) == 0) && (mod(b,2) == 0))
    n = (((b-1)-(a+1))/2) + 2
    sum = n/2*(2*(a) + (n-1)*d)
    a1 = a
    b1 = b
    end    
        
    end
            
    
    
    %Embedded components string generation
    
    numString = cloze_numerical(sum, 0 , 'Good job!', 'Incorrect, try again');
    
 %Question string joining
 questionString = strcat('Find the sum of all ',var ,' numbers between&nbsp;', num2str(a), ' and&nbsp;' , num2str(b), '<br>', ...
 '<br>Answer : <br>', numString);

  
feedbackString = strcat('This contains an arithmetic series where the following is given : <br>First term(a)  = ',num2str(a1), '<br>Common difference(d) = 2',...
  '<br>Last term(a<sub>n</sub>) =&nbsp;',num2str(b1), '<br><br>The total number of terms(n) can be calculated by the formula : <br>', ...
' a<sub>n</sub> = a + (n-1)d => n = ',num2str(n), '<br><br>Now that we have n, the Sum is given by :<br>',...
   'Sum = (n/2)(2a + (n-1)d) => Sum = ', num2str(sum));
    
    else if (flag == 2)
           
            var_1 = randi([1 6],1,1)*3*numb*numb_1
            var_2 = var_1 + 3
            var_3 = randi([27 33],1,1)*3*numb
            d = 3;
            
            n = ((var_3 - var_1)/d) + 1
            sum = n/2*(2*var_1 + (n-1)*d)
            
            
                 
   %Embedded components string generation
    
    numString = cloze_numerical(sum, 0 , 'Good job!', 'Incorrect, try again');
    
if (numb_1==1)
 %Question string joining
 questionString = strcat('Find the sum of the series :<br>',num2str( var_1) ,'+',num2str(var_2),'+',num2str( var_2 + 3),'.....',num2str(var_3 - 3),'+',num2str(var_3), '<br>', ...
 '<br>Answer : <br>', numString);
else
 questionString = strcat('Find the sum of the series :<br>',num2str( var_1) ,'',num2str(var_2),'',num2str( var_2 + 3),'.....',num2str(var_3 - 3),'+',num2str(var_3), '<br>', ...
 '<br>Answer : <br>', numString);   
    
end 
  
feedbackString = strcat('This contains an arithmetic series where the following is given : <br>First term(a)  = ',num2str(var_1), '<br>Common difference(d) = 3',...
  '<br>Last term(a<sub>n</sub>) =&nbsp;',num2str(var_3), '<br><br>The total number of terms(n) can be calculated by the formula : <br>', ...
' a<sub>n</sub> = a + (n-1)d => n = ',num2str(n), '<br><br>Now that we have n, the Sum is given by :<br>',...
   'Sum = (n/2)(2a + (n-1)d) => Sum = ', num2str(sum));

    



   else 
            
            var_1 = randi([1 4],1,1)*5*numb*numb_1
            var_2 = var_1 + 5
            var_3 = randi([16 20],1,1)*5*numb
            d = 5;
            
            n = ((var_3 - var_1)/d) + 1
            sum = n/2*(2*var_1 + (n-1)*d)
            
                    
   %Embedded components string generation
    
    numString = cloze_numerical(sum, 0 , 'Good job!', 'Incorrect, try again');
    
 %Question string joining
 
if (numb_1==1) 
 questionString = strcat('Find the sum of the series :<br>',num2str( var_1) ,'+',num2str(var_2),'+',num2str(var_2 + 5),'.....',num2str(var_3 - 5),'+',num2str(var_3), '<br>', ...
 '<br>Answer : <br>', numString);
else
 questionString = strcat('Find the sum of the series :<br>',num2str( var_1) ,'',num2str(var_2),'',num2str(var_2 + 5),'.....',num2str(var_3 - 5),'+',num2str(var_3), '<br>', ...
 '<br>Answer : <br>', numString);
    
end

feedbackString = strcat('This contains an arithmetic series where the following is given : <br>First term(a)  = ',num2str(var_1), '<br>Common difference(d) = 5',...
  '<br>Last term(a<sub>n</sub>) =&nbsp;',num2str(var_3), '<br><br>The total number of terms(n) can be calculated by the formula : <br>', ...
' a<sub>n</sub> = a + (n-1)d => n = ',num2str(n), '<br><br>Now that we have n, the Sum is given by :<br>',...
   'Sum = (n/2)(2a + (n-1)d) => Sum = ', num2str(sum));
            
          
    end  


    end
    
    
%Complete question XML code generation
xmlCode = question_cloze(i, ...
        'Sum of numbers', ... 
        questionString, ...
        feedbackString, ...
        '');
    
%Output
fprintf(file, xmlCode);
    
end

fprintf(file, quiz_end()); %xml closing code
fclose(file);
    
    

