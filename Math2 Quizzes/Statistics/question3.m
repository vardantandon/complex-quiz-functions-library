%Last Updated: 24/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question3.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    
    p0_05 = [12.71, 4.30, 3.18, 2.78, 2.57, 2.45, 2.36, 2.31, 2.26, 2.23, 2.20, 2.18, 2.16, 2.14, 2.13];
    p0_025 = [25.45, 6.20, 4.17, 3.50, 3.16, 2.97, 2.84, 2.75, 2.68, 2.63, 2.59, 2.56, 2.53, 2.51, 2.49];
    
    n = randi([8,12]);
    lab1 = randi([350, 550],n,1) / 10;
    lab2 = randi([450, 550],n,1) / 10;
    s = randi([6, 14]);
    twoTail = 1; %randi([0,1]);
    
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
    
    if tstar < 0
        tcrit = -1*tcrit;
    end
    
    if abs(tstar) < abs(tcrit)
        equalStrength = 1;
    else
        equalStrength = 2;
    end
    
    %Embedded components string generation
    numString = cloze_numerical(round(tstar,2), 0.01, 'Good job!', 'Incorrect, try again');
    mcqString = cloze_mcq('vertical', equalStrength, ...
        'Equal', '', ...
        'Not Equal', '');
    
    %Question string joining
    tableString = '<table style="text-align:center; border:1px solid black;"><tr style="border:1px solid black;"><td style="border:1px solid black;" colspan="2">28 day strength (MPa)</td></tr><tr style="border:1px solid black;"><td style="border:1px solid black; padding-left:5px; padding-right:5px;">Laboratory 1</td><td style="border:1px solid black; padding-left:5px; padding-right:5px;">Laboratory 2</td><tr>';
    for j = 1:n
        tableString = strcat(tableString, '<tr style="border:1px solid black;"><td style="border:1px solid black;">', sprintf('%0.2f',lab1(j)), '</td><td style="border:1px solid black;">', sprintf('%0.2f',lab2(j)), '</td><tr>');
    end
    tableString = strcat(tableString, '</table>');
    
    questionString = strcat('The table below summarises the test results obtained from a set of strength tests on the concrete produced by two laboratories. Formulate a&nbsp;', twoTailString, '-sample t-test to determine whether the products produced by them are different at a significance level 5%%');
    questionString = strcat(questionString, '<br><br>', tableString);
    questionString = strcat(questionString, '<br><br>Answer:<br>t* =&nbsp;', numString, '<br>The strength of the concrete produced by the two labs are:<br>', mcqString);
    
    feedbackString = strcat('We set up a&nbsp;', twoTailString, '-tail test of hypotheses where the hypotheses are formulated as:');
    feedbackString = strcat(feedbackString, '<br><br>Null hypothesis (H<sub>o</sub>): the strengths of the concrete produced by the two labs are equal ');
    feedbackString = strcat(feedbackString, '<br>Alt. hypothesis (H<sub>a</sub>): the strengths of the concrete produced by the two labs are not equal ');
    feedbackString = strcat(feedbackString, '<br><br>Mean strength of concrete produced by Lab 1: $$ \\small \\bar{X}_1 =&nbsp;', num2str(round(mean1,2)), ' $$');
    feedbackString = strcat(feedbackString, '<br>Mean strength of concrete produced by Lab 2: $$ \\small \\bar{X}_2 =&nbsp;', num2str(round(mean2,2)), ' $$');
    feedbackString = strcat(feedbackString, '<br><br>Standard dev. of strength of concrete produced by Lab 1: $$ \\small \\sigma_1 =&nbsp;', num2str(round(std1,2)), ' $$');
    feedbackString = strcat(feedbackString, '<br>Standard dev. of strength of concrete produced by Lab 2: $$ \\small \\sigma_2 =&nbsp;', num2str(round(std2,2)), ' $$');
    feedbackString = strcat(feedbackString, '<br><br>Sample size $$ \\small n_1 = n_2 =&nbsp;', num2str(n), ' $$');
    feedbackString = strcat(feedbackString, '<br><br>Calculate the&nbsp;', twoTailString, '-sample <i>t</i> statistics as:');
    feedbackString = strcat(feedbackString, '<br>$$ \\small t^* = \\frac{\\bar{X}_1 - \\bar{X}_2}{\\sqrt{\\frac{{\\sigma_1}^2}{n_1} + \\frac{{\\sigma_2}^2}{n_2}}} =&nbsp;', num2str(round(tstar,2)), '$$');
    feedbackString = strcat(feedbackString, '<br>At 5%% significance level, the critical value of t (with degree of freedom:&nbsp;', num2str(n), '-1 =&nbsp;', num2str(n-1), ') for rejecting the null hypothesis is t* =&nbsp;', num2str(round(tcrit,2)));
    if equalStrength == 1
        feedbackString = strcat(feedbackString, '<br><br>Hence the null hypothesis cannot be rejected');
    else
        feedbackString = strcat(feedbackString, '<br><br>Hence the null hypothesis can be rejected');
    end
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Lab t-tests', ... 
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