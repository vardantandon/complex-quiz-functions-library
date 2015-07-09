% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Centroid Solid Circle
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% UCL Department: Medical Physics and Bioengineering
% Date:1/4/15

circ1 = fopen('Solid Circle.xml','w');

fprintf(circ1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(circ1,'\n%s','<quiz>');


for i = 1:1:100
    
    % START IMAGE
    
    D= randi([10 40]);
    C= rectangle('Position',[0 0 D D],'Curvature',[1,1],'linewidth',3);
    
    axis([-7 (D+5) -2 (D+5)])
    axis off
    
    hold on
    
    arrow([(D/2),-2],[D,-2],'linewidth',2);
    arrow([(D/2),-2],[0,-2],'linewidth',2);
    
    xlabel=strcat(num2str(D),'mm');
    text((D/2),-4,xlabel,'fontsize',12,'fontweight','bold');
    
    title('Centroid: Solid Circle','FontSize',18, 'FontWeight','bold')
        
    hold off
    
    imgname=strcat('SolidCircle_',num2str(i),'.jpg');
    saveas(C,imgname);
    
    % END IMAGE
 
    % CALCULATION

Cx = D/2;
Cy = Cx;
I = (pi*D^4)/64;

    
% QUESTION TEXT
    
fprintf(circ1,'\n<!--question %d-->',i);
fprintf(circ1,'\n%s','<question type="cloze">');

fprintf(circ1,'\n%s','<name>');
fprintf(circ1,'\n<text>Centroid: Solid Circle %d</text>',i);
fprintf(circ1,'\n%s','</name>');

fprintf(circ1,'\n%s','<questiontext format="html">');
fprintf(circ1,'\n%s','<text>');
fprintf(circ1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(circ1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_2/WarrenTrussL2_%d.jpg"',i);
fprintf(circ1,'%s','alt="circle" width="30 height="30"/></p>');

fprintf(circ1,'\n<p style="text-align: left;">Determine the centroid of the above section</p>');
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'x = {1:NUMERICAL:=%2.0f:1#Good job!~*#Sorry. Try again.} mm</p>',Cx);
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'y = {1:NUMERICAL:=%2.0f:1#Good job!~*#Sorry. Try again.} mm</p>',Cy);

fprintf(circ1,'\n%s','and calculate the second moment of area with respect to both x and y axis.</p>');
fprintf(circ1,'%s','(Give your answer as a number)</p>');
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'I<sub>x</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} mm<sup>4</sup></p>',I);
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'I<sub>y</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} mm<sup>4</sup></p>',I);


% General Feedback

fprintf(circ1,'\n%s','<generalfeedback format="html">');
fprintf(circ1,'\n%s','<text>');

fprintf(circ1,'\n%s','<p>The centroid is the centre of the circle and ');
fprintf(circ1,'\n%s','<p>for a circle I<sub>x</sub> is equal to I<sub>y</sub>.</p>');

fprintf(circ1,'\n%s','</text>');
fprintf(circ1,'\n%s','</generalfeedback>');

fprintf(circ1,'\n%s','<penalty>0</penalty>');
fprintf(circ1,'\n%s','<hidden>0</hidden>');

fprintf(circ1,'\n%s','</question>');


    
end 

fprintf(circ1,'\n%s','</quiz>');

fclose(circ1);
