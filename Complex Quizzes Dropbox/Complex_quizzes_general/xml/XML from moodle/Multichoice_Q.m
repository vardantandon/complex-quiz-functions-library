%Functions to generate *.xml scripts for Moodle Embedded answers [cloze] 
%question type - Multiple Choice
%Created by Stecia Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', suppervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 07/07/2014
%version 1.0

function [mult]= Multichoice_Q(N)
%generates .xml scripts for the numerical cloze question type

mult=fopen('multichoice.xml','w');

fprintf(mult,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(mult,'\n%s','<quiz>');
fprintf(mult,'\n%s','<!-- question1 -->');
fprintf(mult,'\n%s','<question type="cloze">');
fprintf(mult,'\n%s','<name>');
fprintf(mult,'\n%s','<text>----Question name----</text>');
fprintf(mult,'\n%s','</name>');
fprintf(mult,'\n%s','<questiontext format="html">');

fprintf(mult,'\n%s','<text><![CDATA[<p>----Question text ----</p>');
for i=1:1:N
    fprintf(mult,'\n<p>Solution %d = {1:MULTICHOICE:=----Correct Answer----#----Feedback----',i);
    fprintf(mult,'%s','~%50%----Partially Correct Answer----#----Feedback----~*#----Incorrect answer feedback----}</p>');
end
fprintf(mult,'%s',']]></text>');


fprintf(mult,'\n%s','</questiontext>');
fprintf(mult,'\n%s','<generalfeedback format="html">');
fprintf(mult,'\n%s','<text><![CDATA[<p>----General feedback----</p>]]></text>');
fprintf(mult,'\n%s','</generalfeedback>');
fprintf(mult,'\n%s','<penalty>0</penalty>');
fprintf(mult,'\n%s','<hidden>0</hidden>');
fprintf(mult,'\n%s','</question>');
fprintf(mult,'\n%s','</quiz>');

end