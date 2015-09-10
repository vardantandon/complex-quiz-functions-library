%Last Updated: 10/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question3.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:1
    
    fprintf(['Processing Question: ', num2str(i), '\n']);
    
    %close all
    
    %Calculations
    duration = (randi([1,25]) * 2) - 1;
    frequency = 1000/duration;  
    amplitude = randi([10,20]);
    t = -duration/2:0.01:duration/2;
    y = ones(size(t));
    y(1) = 0;
    y(size(y)) = 0;
    
    %Plot generation - Question
    clf
    hold on
    
    plot(t, y);
    plot([0,0],[0,1.2],'Color','black','linewidth',1);
    plot([-duration,duration],[0,0],'Color','black','linewidth',1);
    
    text(0.02*duration, 1, num2str(amplitude), 'Fontsize',12,'VerticalAlignment','bottom');
    text(-duration/2, -0.01, [num2str(-duration) '/2'], 'Fontsize',12,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(duration/2, -0.01, [num2str(duration) '/2'], 'Fontsize',12,'VerticalAlignment','top', 'HorizontalAlign', 'center');
    text(0, 1.22, 'f(t) [dB]', 'Fontsize',12,'VerticalAlignment','bottom', 'HorizontalAlign', 'center');
    text(1.03*duration, 0, 't [ms]', 'Fontsize',12, 'HorizontalAlign', 'left');
    
    axis off;
    set(gca,'Position',[0.06 .16 0.8 0.7]);

    hold off;
    plotStringQuestion = generateImageString(gcf, 'imageQuestion');
    
    %Plot generation - feedback
    clf;
    hold on
    
    t_fft = -2/duration:0.0002:2/duration;
    y_fft = sinc(pi*duration*t_fft);
    plot(t_fft, y_fft);
    
    plot([0,0],[0,1.2],'Color','black','linewidth',1);
    plot([-2/duration 2/duration],[0,0],'Color','black','linewidth',1);
    text(0, 1.22, 'F(u)', 'Fontsize',12,'VerticalAlignment','bottom', 'HorizontalAlign', 'center');
    text(1/duration, -0.02, 'u [10^{-3} Hz]', 'Fontsize',12, 'HorizontalAlign', 'right', 'VerticalAlign', 'top');
     
    plot([-0.96/(duration*3),-0.96/(duration*3)],[0,-0.2],':','Color','black','linewidth',1);
    plot([0.96/(duration*3),0.96/(duration*3)],[0,-0.2],':.','Color','black','linewidth',1);
    arrow([0, -0.2], [-0.96/(duration*3), -0.2], 'length', 5, 'TipAngle', 45);
    arrow([0, -0.2], [0.96/(duration*3), -0.2], 'length', 5, 'TipAngle', 45);
    text(0, -0.22, ['2/' num2str(duration)], 'Fontsize',12, 'HorizontalAlign', 'center', 'VerticalAlign', 'Top');
    
    axis off;
    axis([-1/duration 1/duration -0.4 1.4]);
    set(gca,'Position',[0.07 .02 0.85 0.95]);

    hold off;
    plotStringFeedback = generateImageString(gcf, 'imageFeedback');
    
    %Embedded components string generation
    numString = strcat('{1:NUMERICAL:=', num2str(frequency),':0.01#You got it!~%%100%%', ...
        num2str(frequency*2),':0.01#You got it!~%%100%%', num2str(frequency/2),':0.01#You got it!}');
    
    %Question string joining
    questionString = strcat('<img src="@@PLUGINFILE@@/imageQuestion.png" style="width:100%%; height:auto;"><br><br>A machine emits a short pulse of sound, with constant intensity over a duration of&nbsp;', num2str(duration), ...
        '&nbsp;ms and an amplitude of&nbsp;', num2str(amplitude), ...
        'dB. Estimate the highest possible frequency emitted within the pulse (to the nearest 2 d.p.):<br>', ...
        '<br>Frequency:&nbsp;', numString, '&nbsp;Hz');
    
    feedbackString = strcat('<img src="@@PLUGINFILE@@/imageFeedback.png" style="width:100%%; height:auto;"><br><br>The width of the Fourier spectrum is approximately equal to the reciprocal of the pulse duration:<br><p style="text-align: center;">', ...
        '$$ \\small Width of Fourier Spectrum = \\frac{1}{T} = \\frac{1}{', num2str(duration/1000), '} $$</p>', ...
        'Therefore the highest possible frequency emmited is&nbsp;', num2str(round(frequency,2)), '&nbsp;Hz.');
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Width of Fourier Spectrum', ... 
        questionString, ...
        feedbackString, ...
        '', ...
        '', ...
        plotStringQuestion, ...
        plotStringFeedback);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);