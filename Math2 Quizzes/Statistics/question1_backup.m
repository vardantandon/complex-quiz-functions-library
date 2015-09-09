%Last Updated: 20/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:1
    
    %Calculations
    n = randi([1001, 1800]);
    mean = randi([5000, 6000]) / 100;
    s = randi([50, 60]) / 10;
    
    intermediateAnswer = 1.96 * s / sqrt(n);
    fromVal = round(mean - intermediateAnswer, 2);
    toVal = round(mean + intermediateAnswer, 2);
    
    fprintf('Yo');
    
    %Plot generation - Question
    clf
    hold on
    
    %plot(t, y);
    %plot([0,0],[0,1.2],'Color','black','linewidth',1);
    %plot([-duration,duration],[0,0],'Color','black','linewidth',1);
    
    %{
    text(0.02*duration, 1, num2str(amplitude), 'Fontsize',12,'VerticalAlignment','bottom');
    text(-duration/2, -0.01, [num2str(-duration) '/2'], 'Fontsize',12,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(duration/2, -0.01, [num2str(duration) '/2'], 'Fontsize',12,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(0, 1.22, 'f(t) [dB]', 'Fontsize',12,'VerticalAlignment','bottom', 'HorizontalAlign', 'center');
    text(1.03*duration, 0, 't [ms]', 'Fontsize',12, 'HorizontalAlign', 'left');
    %}
    
    %p = normspec([1-3/128,Inf],1,2/128,'inside');
    p = normspec([1-s,Inf],mean,s,'inside');
    %text(-duration/2, -0.01, [num2str(-duration) '/2'], 'Fontsize',12,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    
    axis on;
    set(gca,'Position',[0.06 .16 0.8 0.7]);

    hold off;
    plotStringQuestion = generateImageString(gcf, 'imageQuestion');
    
    %Embedded components string generation
    numStringFrom = cloze_numerical(sprintf('%0.4g', fromVal), 0.01, 'Good job!', 'Incorrect, try again');
    numStringTo = cloze_numerical(sprintf('%0.4g', toVal), 0.01, 'Good job!', 'Incorrect, try again');
    
    %Question string joining
    questionString = strcat('A traffic engineer collected&nbsp;', num2str(n), ' samples of vehicle speeds. It is found that the mean speed is&nbsp;', sprintf('%0.4g', mean), ' kmph while the standard deviation is&nbsp;', sprintf('%0.2g', s), ' kmph. Assuming that the speed follow normal distribution, construct the 95%% confidence interval on speed.<br>', ...
        '<br><br>Answer (to 2 d.p.): <br>There is a 95%% chance that the <i>true</i> value of mean speed lies between&nbsp;', numStringFrom, '&nbsp;and&nbsp;', numStringTo, '.');
    
    feedbackString = 'The 95%% C.I. can be determined as<br><br>';
    feedbackString = strcat(feedbackString, '$$ \\small x \\pm 1.96 \\frac{\\sigma}{\\sqrt{n}} = ', sprintf('%0.4g', mean), ' \\pm 1.96 \\frac{', sprintf('%0.2g', s), '}{\\sqrt{', num2str(n), '}} = [', sprintf('%0.4g', fromVal), ', ', sprintf('%0.4g', toVal), ']$$');
    feedbackString = strcat(feedbackString, '<br><br>The result indicates that there is a 95%% chance that the <i>true</i> value of mean speed lies within [', sprintf('%0.4g', fromVal), ',&nbsp;', sprintf('%0.4g', toVal), '].');
    
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