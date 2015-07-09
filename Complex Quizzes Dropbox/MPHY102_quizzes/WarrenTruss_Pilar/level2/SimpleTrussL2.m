% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Warren Truss level 2
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% Re-done by Pilar Garcia - 10th March 2015 
% UCL Department: Medical Physics and Bioengineering
% Date:14/02/15

comb1=fopen('Simple Truss L2.xml','w'); 

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

% Assigning values to the variables
angle1=10+randi(70,[1 100]);
angle2=10+randi(50,[1 100]);

sign1 = randi([0 1],[1 100])*2 - 1;%Added by Pilar. It allows for the sign to change. Gives 100 values from the set {-1, 1}.
sign2 = randi([0 1],[1 100])*2 - 1;

Fv=(50+randi(1000,[1 100])).*sign1; 
Fh=(50+randi(700,[1 100])).*sign2; 

%Space allocation
Ra_y = ones(1,100);
Ra_x = ones(1,100);
Rc = ones(1,100);
Fab = ones(1,100);
Fbc = ones(1,100);
Fac = ones(1,100);


for i=1:1:100
    
    % START IMAGE
    
% Generates image for level 2 Simple Truss problems
% question name - Simple Trusses practice
% Created by Azalea Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% Modified by Pilar - 10th March 2015
% UCL Department: Medical Physics and Bioengineering
% Date:29/1/15


% drawing the truss triangle
x = [0 1.5 2];
y = [0 1 0];
T = plot (x,y,'-o', 'Linewidth', 2, 'color', 'black');
line ([0 2], [0 0],'Linewidth', 2, 'color', 'black')
text (-0.18,0, 'A', 'fontsize', 20)
text (1.6,1.05, 'B', 'fontsize', 20)
text (2.08,0, 'C', 'fontsize', 20)
text (0.25,0.1, strcat('\theta = ',num2str(angle1(i)),char(176)), 'fontsize', 20,'FontWeight','bold')
text (1.50,0.13, strcat('\phi = ',num2str(angle2(i)),char(176)), 'fontsize', 20, 'FontWeight','bold')
title('Warren Truss level 2','FontSize',20, 'FontWeight','bold')


if Fv(i) <0
    text (1.38, 1.25, '\downarrow','color', 'black', 'fontsize',50)
else
    text (1.38, 1.25, '\uparrow','color', 'black', 'fontsize',50)     
end
text (1.3,1.6, strcat('F_{V}= ',num2str(abs(Fv(i))),' N'), 'fontsize', 18)



if Fh(i) <0
    text (1.2, 1.09, '\leftarrow','color', 'black', 'fontsize',50)
else
    text (1.2, 1.09, '\rightarrow','color', 'black', 'fontsize',50)     
end
text (0.6,1.05, strcat('F_{H}= ',num2str(abs(Fh(i))),' N'), 'fontsize', 18)

%Indicating which question it is.
text (1,-0.2, strcat('Question ID = ',num2str(i)), 'fontsize', 10)

hold on

% Plotting the left support

x = [-0.08 0 0.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([-0.15 0.15], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')

% Plotting the right support

x = [1.92 2 2.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([1.92 2.08], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')
line ([1.80 2.20], [-0.25 -0.25],'Linewidth', 1.5, 'color', 'black')
rectangle('Position',[1.91,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[2.04,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);

% Axes requirements
axis ([-0.5 2.5 -0.4 1.8])
axis off

hold off

daspect ([1,1,1])
  
imgname=strcat('WarrenTrussL2_',num2str(i),'.jpg');

saveas(T,imgname);

    % END IMAGE
    

% QUESTION TEXT AND DIAGRAM

fprintf(comb1,'\n<!--question %d-->',i);
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Warren Truss %d Level 2</text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_2/WarrenTrussL2_%d.jpg"',i);
fprintf(comb1,'%s','alt="truss" width="30 height="30"/></p>'); 

fprintf(comb1,'\n<p style="text-align: left;">Consider the triangle in the Truss problem as shown above,');
fprintf(comb1,' where &theta; = %d<sup>o</sup> and &phi; = %d<sup>o</sup>, ',angle1(i), angle2(i));
fprintf(comb1,'and the forces applied on the system are F<sub>V</sub> = %d N and F<sub>H</sub> = %d N.</p>',Fv(i),Fh(i));
fprintf(comb1,'%s','<p>Using the method of joints, calculate');
fprintf(comb1,'%s',' a) The reaction forces and b) the forces on each member.</p>');
fprintf(comb1,'%s','<p>(Give your answer to 1 d.p.)</p>');

% CALCULATIONS

% taking moments and resolving forces 
Rc(i) = (Fh(i)-Fv(i)/tand(angle1(i))) / ((1/tand(angle1(i))) +(1/tand(angle2(i))));
Ra_y(i) = -Fv(i)-Rc(i);
Ra_x(i) = -Fh(i);


% resolving forces
Fab(i) = -Ra_y(i)/sind(angle1(i));  
Fbc(i) = -Rc(i)/sind(angle2(i));  
Fac(i) = -Fbc(i)*cosd(angle2(i)); 

% ANSWER

% Reaction forces, qs a)
fprintf(comb1,'\n%s','<p style="text-align: left;"> a) Reaction forces</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>A_x</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Ra_x(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>A_y</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Ra_y(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>C</sub>= {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Rc(i));

% Forces on each member, qs b)
fprintf(comb1,'\n%s','<p style="text-align: left;"> b) Forces on each member</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>AB</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fab(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>BC</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fbc(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>AC</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fac(i));

% Type of force on each member, qs c)
fprintf(comb1,'\n%s','<p> c) From the drop down list below indicate for each member if it is in tension or compression</p>');
% AB

if Fab(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>AB</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');  
end
if Fab(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>AB</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% BC
if Fbc(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>BC</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');
end
if Fbc(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>BC</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% AC
if Fac(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>AC</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>]]>');  % I added here ]]>
end
if Fac(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>AC</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>]]>');  % I added here ]]>
end

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</questiontext>');


% General Feedback

fprintf(comb1,'\n%s','<generalfeedback format="html">');
fprintf(comb1,'\n%s','<text>');

fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_2/solution.jpg"');
fprintf(comb1,'%s','alt="truss" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p>Use a similar diagram as the shown above to help solve this problem. </p>');
fprintf(comb1,'\n%s','<p>Consider the whole truss as a single beam. </p>');
fprintf(comb1,'\n%s','<p>Find the reaction forces by taking moments about A, and then resolving forces horizontally and vertically.</p>');
fprintf(comb1,'\n%s','<p>Consider each vertices or joints seperately to find the forces on each member and assume all elements are in tension.</p>');
fprintf(comb1,'\n%s','<p>Find a joint where only two forces are unknown and repeat until all the forces are found.</p>');
fprintf(comb1,'\n%s','<p>Finally, positive force means the element is in tension, otherwise compression.</p>]]>');

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</generalfeedback>');

fprintf(comb1,'\n%s','<penalty>0</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');

fprintf(comb1,'\n%s','</question>');

end

fprintf(comb1,'\n%s','</quiz>');

fclose(comb1);