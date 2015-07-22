%Last Updated: 10/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    fprintf(['Processing Question: ', num2str(i), '\n']);
    
    %Calculations
    period1 = randi([1, 2]);
    period2 = randi([10, 15]);
    ampFactor = randi([1, 3]);
    periodArrowY = [0.25, 0.5, 1];
    xaxis_length = period2 * randi([3, 4]) / 2;
    if period1 == 1
        frequency_1_string = '1';
    else
        frequency_1_string = '1/2';
    end
    frequency_2_string = strcat('1/', num2str(period2));
    amp1 = 0.5 * ampFactor;
    amp2 = 2 * ampFactor;
    
    t = 0:0.01:3*period2;
    y = amp1 * sin(t * 2 * pi/period1) + amp2 * sin(t * 2 * pi/period2);
    tOneCycleMajor = 0:0.01:period2;
    tOneCycleMinor = (period2 + period1):0.01:(period2 + 2*period1);
    
    %Plot generation - Question
    clf
    hold on
    plot(t, y);
    plot([0,xaxis_length],[0,0],'Color','black','linewidth',1);
    
    axis([0 xaxis_length -(amp1+amp2) (amp1+amp2)]);
    axis on;
    grid(gca,'minor');
    grid on;
    box on;
    set(gca,'FontSize',14,'Position',[.11 .16 0.8 0.75],'MinorGridLineStyle',':');
    
    clear title xlabel ylabel;
    xlabel_string='t(seconds)';
    ylabel_string='s(t)';
    xlabel(xlabel_string);
    ylabel(ylabel_string);

    hold off;
    plotString = generateImageString(gcf, 'image');
    
    %Plot generation - Feedback
    clf;
    hold on
    plot(t, y, 'Color', '[0.65 0.65 0.65]');
    plot([0,xaxis_length],[0,0],'Color','blue','linewidth',1);
    
    axis([0 xaxis_length -(amp1+amp2) (amp1+amp2)]);
    axis on;
    grid(gca,'minor');
    grid on;
    box on;
    set(gca,'FontSize',14,'Position',[.11 .16 0.8 0.75],'MinorGridLineStyle',':');
    
    plot(tOneCycleMajor, amp2 * sin(tOneCycleMajor * 2 * pi/period2), 'b');
    arrow([period2 / 2, -periodArrowY(ampFactor)], ...
        [0, -periodArrowY(ampFactor)], 'length', 5, 'TipAngle', 45);
    arrow([period2 / 2, -periodArrowY(ampFactor)], ...
        [period2, -periodArrowY(ampFactor)], 'length', 5, 'TipAngle', 45);
    text(period2 / 2, -periodArrowY(ampFactor), ... 
        ['Period 2 = ',num2str(period2),'s'], ...
        'Fontsize',12,'HorizontalAlignment','center','VerticalAlignment','top');
    
    period1Height = amp2 * sin((period2 + period1 * 1.5) * 2 * pi/period2);
    
    plot(tOneCycleMinor, amp1 * sin(tOneCycleMinor * 2 * pi/period1)  ...
        + amp2 * sin(tOneCycleMinor * 2 * pi/period2), 'r');
    arrow([period2 + period1 +  period1 / 2, period1Height], ...
         [period2 + period1, period1Height], 'length', 5, 'TipAngle', 45);
    arrow([period2 + period1 + period1 / 2, period1Height], ...
         [period2 + period1 + period1, period1Height], 'length', 5, 'TipAngle', 45);
    text(period2 + period1 + period1 / 2, period1Height*0.9, ...
        ['Period 1 = ',num2str(period1),'s'], ...
       'Fontsize',12,'HorizontalAlignment','center','VerticalAlignment','top');
    
    clear title xlabel ylabel;
    xlabel(xlabel_string);
    ylabel(ylabel_string);

    hold off;
    plotStringFeedback = generateImageString(gcf, 'imageFeedback');
    
    %Embedded components string generation
    
    numString_higher = cloze_numerical(1/period1, 0.01, 'Good job!', 'Incorrect', 2);
    numString_lower = cloze_numerical(1/period2, 0.01, 'Good job!', 'Incorrect', 2);
        
    %Question string joining
    questionString = strcat('A graphical representation of the Fourier transform of the signal s(t) below will exhibit two peaks. Estimate the positions of these peaks on the frequency axis. <br>', ...
        '<br><img src="@@PLUGINFILE@@/image.png" style="width:100%%; height:auto;"><br><br>Give your answer to 2 d.p.<br>', ...
        'Higher Frequency:&nbsp;', numString_higher, ...
        '<br>Lower Frequency:&nbsp;', numString_lower);
    
    feedbackString = strcat('<br><img src="@@PLUGINFILE@@/imageFeedback.png" style="width:100%%; height:auto;"><br><br>The signal consists of the sum of two sine waves, with periods of&nbsp', num2str(period1), '&nbspsecond and&nbsp', num2str(period2), '&nbspseconds.', ...
        '&nbsp;Frequency and Period are related by the equation:<br><p style="text-align: center;">$$ \\small f = \\frac{1}{T} $$</p>', ...
        'Thus the peaks will be observed at frequencies of&nbsp', frequency_1_string, '&nbspHz and&nbsp;', frequency_2_string, '&nbspHz (=', num2str(round(1/period2,2)), '&nbspHz).');
    
    hint1 = 'Try again (hint 1)';
    hint2 = 'Try again (hint 2)';
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Fourier transform of Signal', ... 
        questionString, ...
        feedbackString, ...
        hint1, ...
        hint2, ...
        plotString, ...
        plotStringFeedback);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);