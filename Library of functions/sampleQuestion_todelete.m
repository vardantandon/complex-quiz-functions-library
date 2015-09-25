%Sample code to demonstrate the use of Cloze Question Generation
%functions: question_cloze, cloze_mcq, cloze_numerical, cloze_short,
%quiz_start, quiz_end
%This code will generate a sampleQuestion.xml file containing Moodle xml
%code for 100 variations of a question. The question has different types of
%multiple choice questions, a numerical question and a short answer
%question embedded. 
%
%Last Updated: 21/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('sampleQuestion.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:1
    
    %fprintf(['Processing Question: ', num2str(i), '\n']);
    
    %Calculations
    a = randi(6)+3;
    b = randi(6)+3;
    c = a + b;
    
    %Plot generation
    w=a;
    h=b;
    
    plotVar=plot([0,w],[0,0],'Color','black','linewidth',3);
    hold on
    plot([0,0],[0,h],'Color','black','linewidth',3);
    plot([0,w],[h,h],'Color','black','linewidth',3);
    plot([w,w],[0,h],'Color','black','linewidth',3);
    
    reset(gca);
    reset(gcf);
    
    if i==1
    set(gca, 'Position', get(gca, 'OuterPosition') - ...
        get(gca, 'TightInset') * [-1 0 1 0; 0 -1 0 1; 0 0 1 0; 0 0 0 1]);
    end
    
    axis([-1.4 (w+0.5) -1.1 (h+0.5)]);
    axis off
    
    xlabel=strcat(num2str(w),'mm');
    ylabel=strcat(num2str(h),'mm');

    text((w/2) - 0.8,-0.4,xlabel,'fontsize',22,'fontweight','bold');
    text(-1.25,(h/2),ylabel,'fontsize',18,'fontweight','bold');
    
    hold off;
    
    %Plot string generation
    plotString = generateImageString(gcf, 'image');
    
    %Embedded components string generation
    mcqStringDrop = cloze_mcq('drop', 3, ...
        num2str(a+b-2), 'Too too low', ...
        num2str(a+b-1), 'Too low', ...
        num2str(a+b), 'You got it!', ... 
        num2str(a+b+1), 'Too high', ... 
        num2str(a+b+2), 'Too too high');
    
    mcqStringVertical = cloze_mcq('vertical', 3, ...
        num2str(a+b-2), 'Too too low', ...
        num2str(a+b-1), 'Too low', ...
        num2str(a+b), 'You got it!', ... 
        num2str(a+b+1), 'Too high', ... 
        num2str(a+b+2), 'Too too high');
    
    mcqStringHorizontal = cloze_mcq('horizontal', 3, ...
        num2str(a+b-2), 'Too too low', ...
        num2str(a+b-1), 'Too low', ...
        num2str(a+b), 'You got it!', ... 
        num2str(a+b+1), 'Too high', ... 
        num2str(a+b+2), 'Too too high');
    
    numString = cloze_numerical(c, 1, 'Good job!', 'Incorrect, try again', 2, 5);
    
    shortString = cloze_short('Paris', 'Good job!', 'Incorrect, try again');
    
    
    mcqStringDrop = cloze_mcq('drop', 3, ...
        num2str(a+b-2), 'Too too low', ...
        num2str(a+b-1), 'Too low', ...
        num2str(a+b), 'You got it!', ... 
        num2str(a+b+1), 'Too high', ... 
        num2str(a+b+2), 'Too too high');
    
    questionString = strcat('<br><br>Dropdown box', mcqStringDrop);
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Question Title', ... 
        questionString, ...
        'General Feedback comes here', ...
        '', ...
        '', ...
        plotString, ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);