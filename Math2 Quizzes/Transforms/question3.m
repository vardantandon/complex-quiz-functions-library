%Last Updated: 10/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question3.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    duration = randi([1,50]);
    frequency = 1000/duration;  
    amplitude = randi([10,20]);
    
    %Embedded components string generation
    numString = strcat('{1:NUMERICAL:=', num2str(frequency),':0.01#You got it!~%%100%%', num2str(frequency*2),':0.01#You got it!~%%100%%', num2str(frequency/2),':0.01#You got it!}');
    
    %Question string joining
    questionString = strcat('A machine emits a short pulse of sound, with constant intensity over a duration of&nbsp;', num2str(duration), '&nbsp;ms and an amplitude of&nbsp;', num2str(amplitude), 'dB. Estimate the highest possible frequency emitted within the pulse (to the nearest 2 d.p.):<br>', ...
        '<br>Frequency:&nbsp;', numString, 'Hz');
    
    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        'Width of Fourier Spectrum', ... 
        questionString, ...
        'Width of Fourier Spectrum', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);