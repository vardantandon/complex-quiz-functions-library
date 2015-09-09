%Last Updated: 20/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    
    mean = randi([8,16]) * 5;
    s = randi([7, 15]);
    answerRaw = (2*1.96*s*10/mean)^2;
    answer = ceil(answerRaw);
    
    %Embedded components string generation
    numString = cloze_numerical(answer, 0, 'Good job!', 'Incorrect, try again');
    
    %Question string joining
    questionString = ['Based on a number of strength tests, it is found from the test results that the average strength of a material is ' num2str(mean) ' N/mm2, and the standard deviation of the measured strength is ' num2str(s) ' N/mm2.<br><br>Assuming the strength follows normal distribution, determine the minimum number of tests we would have to perform such that we can construct a 95%% confidence interval on the expected strength of the material with a width less than ' num2str(0.1*mean) ' N/mm2 (i.e. 10%% of the average measured strength ' num2str(mean) ' N/mm2).<br><br><br>Answer:<br>Minimum number of tests required: ' numString];
    
    feedbackString = ['The 95%% confidence interval on the true strength &mu; can then be determined as:<br>' ...
        '$$ \\small \\bar{X} \\pm 1.96 \\frac{\\sigma}{\\sqrt{n}} $$<br>' ...
        'Hence, the width of the 95%% confidence interval is:<br>' ...
        '$$ \\small 2(1.96) \\frac{\\sigma}{\\sqrt{n}} $$<br>' ...
        'It is required that:<br>$$ \\small 2(1.96) \\frac{\\sigma}{\\sqrt{n}} \\leq 0.1 \\bar{X}$$<br>' ...
        '$$ \\small \\Rightarrow n \\geq \\left( \\frac{2(1.96)(' num2str(s) ')}{0.1(' num2str(mean) ')} \\right)^2 = ' num2str(answerRaw) '$$' ...
        '<br>Hence, the minimum number of tests is <b>' num2str(answer) '</b>.'];
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Strength Tests', ... 
        questionString, ...
        feedbackString, ...
        '', ...
        '', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);