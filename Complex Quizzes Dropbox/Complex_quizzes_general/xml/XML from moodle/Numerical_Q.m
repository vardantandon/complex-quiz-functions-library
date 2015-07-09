%Functions to generate *.xml scripts for Moodle Embedded answers [cloze] 
%question type - Numerical
%Created by Stecia Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', suppervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 07/07/2014
%version 1.0

function [num]= Numerical_Q(N)
%generates .xml scripts for the numerical cloze question type

num=fopen('numerical.xml','w');

fprintf(num,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(num,'\n%s','<quiz>');
fprintf(num,'\n%s','<!-- question1 -->');
fprintf(num,'\n%s','<question type="cloze">');
fprintf(num,'\n%s','<name>');
fprintf(num,'\n%s','<text>----Question name----</text>');
fprintf(num,'\n%s','</name>');
fprintf(num,'\n%s','<questiontext format="html">');

fprintf(num,'\n%s','<text><![CDATA[<p>----Question text ----</p>');
for i=1:1:N
    fprintf(num,'\n<p>Solution %d = {1:NUMERICAL:=----Correct Answer----:----Error----#----Feedback----',i);
    fprintf(num,'%s','~%50%----Partially Correct Answer----:----Error----#----Feedback----~*#----Incorrect answer feedback----}</p>');
end
fprintf(num,'%s',']]></text>');


fprintf(num,'\n%s','</questiontext>');
fprintf(num,'\n%s','<generalfeedback format="html">');
fprintf(num,'\n%s','<text><![CDATA[<p>----General feedback----</p>]]></text>');
fprintf(num,'\n%s','</generalfeedback>');
fprintf(num,'\n%s','<penalty>0</penalty>');
fprintf(num,'\n%s','<hidden>0</hidden>');
fprintf(num,'\n%s','</question>');
fprintf(num,'\n%s','</quiz>');

end