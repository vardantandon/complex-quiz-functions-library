%Last Updated: 07/09/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    close all
    
    %Calculations
    
    mean = randi([8,16]) * 5;
    s = randi([7, 15]);
    answerRaw = (2*1.96*s*10/mean)^2;
    answer = ceil(answerRaw);
    
    intermediateAnswer = 1.96 * s / sqrt(answerRaw);
    fromVal = round(mean - intermediateAnswer, 2);
    toVal = round(mean + intermediateAnswer, 2);
    
    %Plot generation - Question
    clf
    hold on
    
    p = normspec([fromVal,toVal], mean, s / sqrt(answerRaw), 'inside');
    text(fromVal, -0.05, [num2str(fromVal) ' N/mm^2'], 'Fontsize',10,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(toVal, -0.05, [num2str(toVal) ' N/mm^2'], 'Fontsize',10,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(mean, 0.15, '95%', 'Fontsize',10,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    
    axis on;
    axis([mean - 2*intermediateAnswer, mean + 2*intermediateAnswer, 0, 0.6]);
    set(gca, 'Position',[0.12 .16 0.8 0.7], 'YLabel',[], 'XLabel',[]);
    
    hold off;
    plotStringFeedback = generateImageString(gcf, 'imageFeedback');
    
    %Embedded components string generation
    numString = cloze_numerical(answer, 0, 'Good job!', 'Incorrect, try again');
    
    %Question string joining
    questionString = ['Based on a number of strength tests, it is found from the test results that the average strength of a material is ' num2str(mean) ' N/mm^2, and the standard deviation of the measured strength is ' num2str(s) ' N/mm^2.<br><br>Assuming the strength follows normal distribution, determine the minimum number of tests we would have to perform such that we can construct a 95%% confidence interval on the expected strength of the material with a width less than ' num2str(0.1*mean) ' N/mm^2 (i.e. 10%% of the average measured strength ' num2str(mean) ' N/mm^2).<br><br><br>Answer:<br>Minimum number of tests required: ' numString];
    
    feedbackString = ['<img src="@@PLUGINFILE@@/imageFeedback.png" style="width:100%%; height:auto;"><br><br>' ...
        'The 95%% confidence interval on the true strength &mu; can then be determined as:<br>' ...
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
        '', ...
        plotStringFeedback);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);