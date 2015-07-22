%Last Updated: 20/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    
    p0_05 = [12.71, 4.30, 3.18, 2.78, 2.57, 2.45, 2.36, 2.31, 2.26, 2.23, 2.20, 2.18, 2.16, 2.14, 2.13];
    p0_025 = [25.45, 6.20, 4.17, 3.50, 3.16, 2.97, 2.84, 2.75, 2.68, 2.63, 2.59, 2.56, 2.53, 2.51, 2.49];
    
    n = randi([8,12]);
    lab1 = randi([35, 55],n,1);
    lab2 = randi([45, 55],n,1);
    s = randi([6, 14]);
    twoTail = randi([0,1]);
    
    mean1 = mean(lab1);
    mean2 = mean(lab2);
    std1 = std(lab1);
    std2 = std(lab2);
    tstar = (mean1-mean2) / (sqrt((std1^2 + std2^2)/n));
    
    if twoTail == 1
        tcrit = p0_025(n-1);
        twoTailString = 'two';
    else
        tcrit = p0_05(n-1);
        twoTailString = 'one';
    end
    
    %Embedded components string generation
    numString = cloze_numerical(round(tcrit,2), 0.01, 'Good job!', 'Incorrect, try again');
    mcqString = 
    
    %Question string joining
    tableString = '<table><tr><td colspan="2">28 day strength (MPa)</td></tr><tr><td>Laboratory 1</td><td>Laboratory 2</td><tr>';
    for j = 1:n
        tableString = strcat(tableString, '<tr><td>', lab1(j), '</td><td>', lab2(j), '</td><tr>');
    end
    tableString = strcat(tableString, '</table>');
    
    questionString = strcat('The table below summarises the test results obtained from a set of strength tests on the concrete produced by two laboratories. Formulate a&nbsp;', twoTailString, '-sample t-test to determine whether the products produced by them are different at a significance level 5%%');
    questionString = strcat(questionString, '<br><br>', tableString);
    questionString = strcat(questionString, '<br><br>Answer:<br>t* =&nbsp;', numString, '<br>The strength of the concrete produced by the two labs are:<br>', mcqString);
    
    feedbackString = 'The 95%% confidence interval on the true strength &mu; can then be determined as:';
    feedbackString = strcat(feedbackString, '<br>$$ \\small \\bar{X} \\pm 1.96 \\frac{\\sigma}{\\sqrt{n}} $$');
    feedbackString = strcat(feedbackString, '<br>Hence, the width of the 95%% confidence interval is:');
    feedbackString = strcat(feedbackString, '<br>$$ \\small 2(1.96) \\frac{\\sigma}{\\sqrt{n}} $$');
    feedbackString = strcat(feedbackString, '<br>And it is required that:');
    feedbackString = strcat(feedbackString, '<br>$$ \\small 2(1.96) \\frac{\\sigma}{\\sqrt{n}} \\leq 0.1 \\bar{X}$$');
    feedbackString = strcat(feedbackString, '<br>$$ \\small \\Rightarrow n \\geq \\left( \\frac{2(1.96)\\sigma}{0.1\\bar{X}} \\right)^2 =&nbsp;', num2str(round(answer,2)), '$$');
    feedbackString = strcat(feedbackString, '<br>Hence, the minimum number of tests is&nbsp;', num2str(ceil(answer)), '.');
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Mean Speed range', ... 
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