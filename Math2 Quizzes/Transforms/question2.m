%Last Updated: 10/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:10
    
    opposite = mod(i, 2);
    
    if(opposite == 0)
        %Embedded components string generation  
        trueOrFalse = 'false';
        mcqStringVertical = cloze_mcq('vertical', 3, ...
            'The image appears smoother.', 'Incorrect', ...
            'The camera''s "point response function" becomes broader.', 'Incorrect', ...
            'The spectrum of spatial frequencies contained within the image becomes broader.', 'You got it!', ... 
            'Multiplying the Fourier transform of the image by a constant will not affect the smoothness of the image.', 'Incorrect');
    else
        %Embedded components string generation   
        trueOrFalse = 'true';
        mcqStringVertical = cloze_mcq('vertical', 3, ...
            'The image appears sharper.', 'Incorrect', ...
            'The camera''s "point response function" becomes narrower.', 'Incorrect', ...
            'The spectrum of spatial frequencies contained within the image becomes narrower.', 'You got it!', ... 
            'Multiplying the Fourier transform of the image by a constant will affect the smoothness of the image.', 'Incorrect');
    end
    
    %Question string joining
    questionString = strcat('When a camera lens is defocussed, which of the following statements is&nbsp;', trueOrFalse, ': <br>', ...
        '<br>', mcqStringVertical);
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Camera Lens', ... 
        questionString, ...
        'Camera Lens', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);