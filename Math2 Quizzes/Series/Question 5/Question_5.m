file = fopen('Question_5.xml', 'w');
fprintf(file,quiz_start());

for i=1:1:10

a = randi([1 5],1,1)
b = randi([1 3],1,1)
syms x
fun = @(x)(((x).^2).^5/120 + ((x).^2).^4/24 + ((x).^2).^3/6 + ((x).^2).^2/2 + ((x).^2) + 1)
ans = a*integral(fun,0,1)

numString = cloze_numerical(ans, 0.10 , 'Good job!', 'Incorrect, try again');

if (a == 1)
questionString = strcat('Use Maclaurin series to calculate the following integral to 3 significant figures : <br>',...
      '$$\\small\\int_0^1e^{x^2}$$<br>', '<br>Answer : <br>', numString);
else 
questionString = strcat('Use Maclaurin series to calculate the following integral to 3 significant figures : <br>',...
      '$$\\small\\int_0^1',num2str(a),'e^{x^2}$$<br>', '<br>Answer : <br>', numString);
end


xmlCode = question_cloze(i, ...
        'Integral', ... 
        questionString, ...
        'Integral', ...
        '');

fprintf(file, xmlCode);

end

fprintf(file, quiz_end()); %xml closing code
fclose(file);