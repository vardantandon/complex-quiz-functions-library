%Functions to generate *.xml scripts for Moodle Embedded answers [cloze] 
%question type - Short Answer
%Created by Stecia Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', suppervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 07/07/2014
%version 1.0

function [sa]= Short_Answer_Q(N)
%generates .xml scripts for the numerical cloze question type

sa=fopen('shortanswer.xml','w');

fprintf(sa,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(sa,'\n%s','<quiz>');
fprintf(sa,'\n%s','<!-- question1 -->');
fprintf(sa,'\n%s','<question type="cloze">');
fprintf(sa,'\n%s','<name>');
fprintf(sa,'\n%s','<text>----Question name----</text>');
fprintf(sa,'\n%s','</name>');
fprintf(sa,'\n%s','<questiontext format="html">');

fprintf(sa,'\n%s','<text><![CDATA[<p>----Question text ----</p>');
for i=1:1:N
    fprintf(sa,'\n<p>Solution %d = {1:SHORTANSWER:=----Correct Answer----#----Feedback----',i);
    fprintf(sa,'%s','~%50%----Partially Correct Answer----#----Feedback----~*#----Incorrect answer feedback----}</p>');
end
fprintf(sa,'%s',']]></text>');


fprintf(sa,'\n%s','</questiontext>');
fprintf(sa,'\n%s','<generalfeedback format="html">');
fprintf(sa,'\n%s','<text><![CDATA[<p>----General feedback----</p>]]></text>');
fprintf(sa,'\n%s','</generalfeedback>');
fprintf(sa,'\n%s','<penalty>0</penalty>');
fprintf(sa,'\n%s','<hidden>0</hidden>');
fprintf(sa,'\n%s','</question>');
fprintf(sa,'\n%s','</quiz>');

end