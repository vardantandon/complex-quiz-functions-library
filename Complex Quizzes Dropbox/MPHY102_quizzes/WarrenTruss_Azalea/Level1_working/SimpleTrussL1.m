% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Warren Truss level 1
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% UCL Department: Medical Physics and Bioengineering
% Date:26/01/15

comb1=fopen('Simple Truss L1.xml','w'); 

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

% Assigning values to the variables
angle1=10+randi(70,[1 100]);
angle2=90-angle1;
F=50+randi(150,[1 100]); 


for i=1:1:100
    

% QUESTION TEXT AND DIAGRAM

fprintf(comb1,'\n<!--question %d-->',i);
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Warren Truss %d Level 1</text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'%s','src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_1/question.jpg"');
fprintf(comb1,'%s','alt="truss" width="30 height="30"/></p>');

fprintf(comb1,'\n<p style="text-align: left;">Consider the right angle triangle in the Truss problem as shown above,');
fprintf(comb1,'where &theta = %d<sup>o</sup> and &phi = %d<sup>o</sup>, ',angle1(i), angle2(i));
fprintf(comb1,'and the force applied on the truss system is %d N.</p>',F(i));
fprintf(comb1,'%s','Using the method of joints, calculate');
fprintf(comb1,'%s',' a) The reaction forces and b) the forces on each member.</p>');
fprintf(comb1,'%s','(Give your answer to the nearest whole number.)</p>');

% CALCULATIONS

% from trigonometry
Ah(i) = 1./tand(angle1(i));
hC(i) = 1./tand(angle2(i));
% taking moments 
Rc(i) = (F(i).*Ah(i))./(Ah(i)+hC(i));
Ra(i) = F(i)-Rc(i);
% forces
F1(i) = -F(i)/((sind(angle2(i))./tand(angle1(i)))+cosd(angle2(i)));
F2(i) = F1(i)*(sind(angle2(i))./sind(angle1(i)));
F3(i) = -F1(i)*cosd(angle1(i));

% ANSWER

% Reaction forces, qs a)
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>A</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Ra(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>C</sub>= {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Rc(i));

% Forces on each member, qs b)
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>AB</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',F1(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>BC</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',F2(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>AC</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',F3(i));

% Type of force on each member, qs c)
fprintf(comb1,'\n%s','c)from the drop down list below indicate for each member if it is in tension or compression</p>');
% AB
if F1(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>AB</sub>{1:MULTICHOICE:~Compression ~=Tension}</p>');  
end
if F1(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>AB</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% BC
if F2(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>BC</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');
end
if F2(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>BC</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% AC
if F3(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>AC</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>]]>'); 
end
if F3(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>AC</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>]]>');  
end

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</questiontext>');


% General Feedback

fprintf(comb1,'\n%s','<generalfeedback format="html">');
fprintf(comb1,'\n%s','<text>');

fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_1/solution.jpg"');
fprintf(comb1,'%s','alt="truss" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<P>Use the diagram above to help solve this problem. </p>');
fprintf(comb1,'\n%s','<p>Consider the whole truss as a single beam.');
fprintf(comb1,'\n%s','<p>Find the reaction forces by taking moments about A and B.');
fprintf(comb1,'\n%s','<p>Consider each vertices seperately to find the forces on each member and assume all elements are in tension.');
fprintf(comb1,'\n%s','<p>Finally, positive force means the element is in tension, otherwise compression.</p>]]>');

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</generalfeedback>');

fprintf(comb1,'\n%s','<penalty>0</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');

fprintf(comb1,'\n%s','</question>');

end

fprintf(comb1,'\n%s','</quiz>');

fclose(comb1);