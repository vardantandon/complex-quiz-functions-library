file = fopen('Question_1.xml', 'w');
fprintf(file,quiz_start());

for i=1:1:100
    
    %Calculations
    flag = randi([1 3],1,1)
  
    
    if (flag == 1)
      
    a = randi([1 20],1,1) 
    b = randi([80 100],1,1)  
    c = randi([0 1],1,1)
    d = 2;
    
    
    if (c==0)
    var = ' odd';
        
    if ((mod(a,2) ~= 0) && (mod(b,2) ~= 0))
    n = (((((b-1))-(a+1))/2)) + 2
    sum = n/2*(2*(a) + (n-1)*d)
    end
    
    if ((mod(a,2) == 0) && (mod(b,2) ~= 0))
    n = ((((b-1))-(a))/2) + 1
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
    
    if ((mod(a,2) ~= 0) && (mod(b,2) == 0))
    n = (((b)-(a+1))/2) + 1
    sum = n/2*(2*(a) + (n-1)*d)
    end
       
    if ((mod(a,2) == 0) && (mod(b,2) == 0))
    n = ((b)-(a))/2
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
    
    else
    var = ' even';
        
    if ((mod(a,2) ~= 0) && (mod(b,2) ~= 0))
    n = ((b)-(a))/2
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
    
    if ((mod(a,2) == 0) && (mod(b,2) ~= 0))
    n = ((((b))-(a+1))/2) + 1
    sum = n/2*(2*(a) + (n-1)*d)
    end
    
    if ((mod(a,2) ~= 0) && (mod(b,2) == 0))
    n = (((b-1)-(a))/2) + 1
    sum = n/2*(2*(a+1) + (n-1)*d)
    end
       
    if ((mod(a,2) == 0) && (mod(b,2) == 0))
    n = (((b-1)-(a+1))/2) + 2
    sum = n/2*(2*(a) + (n-1)*d)
    end    
        
    end
            
    
    
    %Embedded components string generation
    
    numString = cloze_numerical(sum, 0 , 'Good job!', 'Incorrect, try again');
    
 %Question string joining
 questionString = strcat('Find the sum of all ',var ,' numbers between&nbsp;', num2str(a), ' and&nbsp;' , num2str(b), '<br>', ...
 '<br>Answer : <br>', numString);
    
    else if (flag == 2)
           
            var_1 = randi([1 6],1,1)*3
            var_2 = var_1 + 3
            var_3 = randi([27 33],1,1)*3
            d = 3;
            
            n = ((var_3 - var_1)/d) + 1
            sum = n/2*(2*var_1 + (n-1)*d)
            
            
                 
   %Embedded components string generation
    
    numString = cloze_numerical(sum, 0 , 'Good job!', 'Incorrect, try again');
    
 %Question string joining
 questionString = strcat('Find the sum of the series :<br>',num2str( var_1) ,'+',num2str(var_2),'+',num2str( var_2 + 3),'.....',num2str(var_3 - 3),'+',num2str(var_3), '<br>', ...
 '<br>Answer : <br>', numString);
            
    



   else 
            
            var_1 = randi([1 4],1,1)*5
            var_2 = var_1 + 5
            var_3 = randi([16 20],1,1)*5
            d = 5;
            
            n = ((var_3 - var_1)/d) + 1
            sum = n/2*(2*var_1 + (n-1)*d)
            
                    
   %Embedded components string generation
    
    numString = cloze_numerical(sum, 0 , 'Good job!', 'Incorrect, try again');
    
 %Question string joining
 questionString = strcat('Find the sum of the series :<br>',num2str( var_1) ,'+',num2str(var_2),'+',num2str(var_2 + 5),'.....',num2str(var_3 - 5),'+',num2str(var_3), '<br>', ...
 '<br>Answer : <br>', numString);
            
            
          
    end  


    end
    
    
%Complete question XML code generation
xmlCode = question_cloze(i, ...
        'Sum of numbers', ... 
        questionString, ...
        'Sum of numbers', ...
        '');
    
%Output
fprintf(file, xmlCode);
    
end

fprintf(file, quiz_end()); %xml closing code
fclose(file);
    
    

