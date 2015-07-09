% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Centroid Circular hollow rectangle
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% UCL Department: Medical Physics and Bioengineering
% Date:10/4/15

circ1 = fopen('Circle in Rectangle.xml','w');

fprintf(circ1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(circ1,'\n%s','<quiz>');


for i = 1:1:100
    
    % START IMAGE
    
    H= randi([35 45]);  
    B= randi([10 30]);
    D= B/4;
        
    C= rectangle('Position',[0 0 B H],'linewidth',3,'FaceColor','b');
    rectangle('Position',[B/4 H/3 B/2 B/2],'Curvature',[1,1],'linewidth',3,'FaceColor','w')
    
    arrow([(B/2),-2],[B,-2],'linewidth',2);
    arrow([(B/2),-2],[0,-2],'linewidth',2);
    arrow([-2,(H/2)],[-2,H],'linewidth',2);
    arrow([-2,(H/2)],[-2,0],'linewidth',2);
    
    xlabel1=strcat(num2str(B),'mm');
    text((B/2),-4,xlabel1,'fontsize',12,'fontweight','bold');
    ylabel1=strcat(num2str(H),'mm');
    text(-10,(H/2),ylabel1,'fontsize',12,'fontweight','bold');
    
    arrow([(B/4),H/3.5],[3*B/4,H/3.5],'linewidth',2);
    arrow([(3*B/4),H/3.5],[B/4,H/3.5],'linewidth',2);
    
    ylabel2=strcat(num2str(D),'mm');
    text((B/3),H/4.5,ylabel2,'fontsize',12,'fontweight','bold');
    
    title('Centroid: Rectanlge with Circular Hollow','FontSize',18, 'FontWeight','bold')  
    
    axis([-7 (B+5) -2 (H+5)])
    axis off
    
    
    daspect([1,1,1])
    

    C = figure;
    imgname = strcat('CircularHollow_',num2str(i),'.jpg');
    saveas(C,imgname)
    
    % END IMAGE
 
    % CALCULATION

Cx = B/2;
Cy = H/2;
Ix = (B*H^3)/12-(pi*D^4)/64;
Iy = (H*B^3)/12-(pi*D^4)/64;

    
% QUESTION TEXT
    
fprintf(circ1,'\n<!--question %d-->',i);
fprintf(circ1,'\n%s','<question type="cloze">');

fprintf(circ1,'\n%s','<name>');
fprintf(circ1,'\n<text>Centroid: Rectangle with Circular Hollow %d</text>',i);
fprintf(circ1,'\n%s','</name>');

fprintf(circ1,'\n%s','<questiontext format="html">');
fprintf(circ1,'\n%s','<text>');
fprintf(circ1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(circ1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_2/WarrenTrussL2_%d.jpg"',i);
fprintf(circ1,'%s','alt="rectangle" width="30 height="30"/></p>');

fprintf(circ1,'\n<p style="text-align: left;">Determine the centroid of the above section</p>');
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'x = {1:NUMERICAL:=%2.0f:1#Good job!~*#Sorry. Try again.} mm</p>',Cx);
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'y = {1:NUMERICAL:=%2.0f:1#Good job!~*#Sorry. Try again.} mm</p>',Cy);

fprintf(circ1,'\n%s','and calculate the second moment of area with respect to both x and y axis.</p>');
fprintf(circ1,'%s','(Give your answer as a number, i.e. not in standard form)</p>');
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'I<sub>x</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} mm<sup>4</sup></p>',Ix);
fprintf(circ1,'\n%s','<p style="text-align: center;" >');
fprintf(circ1,'I<sub>y</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} mm<sup>4</sup></p>]]>',Iy);

fprintf(circ1,'\n%s','</text>');
fprintf(circ1,'\n%s','</questiontext>');


% General Feedback

fprintf(circ1,'\n%s','<generalfeedback format="html">');
fprintf(circ1,'\n%s','<text>');

fprintf(circ1,'\n%s','<![CDATA[<p>The centroid is the central point of the whole section and ');
fprintf(circ1,'\n%s','<p>for the above section I<sub>x</sub> is not equal to I<sub>y</sub>.</p>]]>');

fprintf(circ1,'\n%s','</text>');
fprintf(circ1,'\n%s','</generalfeedback>');

fprintf(circ1,'\n%s','<penalty>0</penalty>');
fprintf(circ1,'\n%s','<hidden>0</hidden>');

fprintf(circ1,'\n%s','</question>');
   
end 

fprintf(circ1,'\n%s','</quiz>');

fclose(circ1);
