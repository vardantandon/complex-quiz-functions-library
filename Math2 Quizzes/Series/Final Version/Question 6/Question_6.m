%Series Question 6 - Fourier series
%Authored By: Vardan Tandon under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file = fopen('Question_6.xml', 'w');

%xml initialization code
fprintf(file,quiz_start());

mcqStringVertical = cloze_mcq('vertical', 2, ...
        'The Fourier series contains no cosine functions', 'Incorrect ! The function f(x) is an even function, and therefore contains no sine functions', ...
        'The Fourier series contains no sine functions', 'Correct ! The function f(x) is an even function, and therefore contains no sine functions', ...
        'The Fourier series contains cosine and sine functions', 'Incorrect ! The function f(x) is an even function, and therefore contains no sine functions', ... 
        'The Fourier series contains no cosine or sine functions', 'Incorrect ! The function f(x) is an even function, and therefore contains no sine functions');
    
    
%Question string joining
questionString = strcat('A rectangular function is expressed mathematically as follows : <br> f(x) = 1&nbsp;&nbsp;&nbsp;for&nbsp;&nbsp;&nbsp; -$$\\pi$$/2<&nbsp;x&nbsp;<$$\\pi$$/2 <br>',...
                         'f(x) = 0&nbsp;&nbsp;&nbsp;for&nbsp;&nbsp;&nbsp; -$$\\pi$$ <&nbsp;x&nbsp;< $$\\pi$$/2&nbsp;&nbsp;and&nbsp;&nbsp; $$\\pi$$/2 <&nbsp;x&nbsp;< $$\\pi$$','<br>',...
                         'Which of the following descriptions of the Fourier series of f(x) is true:<br>',mcqStringVertical);
                     
%Feedback string joining
feedbackString = strcat('The function f(x) is an even function, and therefore contains no sine functions.');
                     
%Complete question XML code generation
xmlCode = question_cloze(i, ...
        'Fourier series', ... 
        questionString, ...
        feedbackString, ...
        '');
    

fprintf(file, xmlCode);

%xml closing code
fprintf(file, quiz_end());
fclose(file);