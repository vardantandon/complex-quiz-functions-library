%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - I beam level 0
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

%solve for an I-beam symmetric in both x and y

file=fopen('circle_in_rectangle.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100

ID=strcat(num2str(i));

IDString=strcat('Second Moment of Area. Level 1.Question ID #', ID);   

% START IMAGE
    H= randi([35 45]);  
    B= randi([35 45]);
    D= B/4;
    rectangle('Position',[0 0 B H],'linewidth',3,'FaceColor','b');
    hold on
    rectangle('Position',[B/4 H/3 B/2 B/2],'Curvature',[1,1],'linewidth',3,'FaceColor','w')
    
    arrow([(B/2),-2],[B,-2],'linewidth',2);
    arrow([(B/2),-2],[0,-2],'linewidth',2);
    arrow([-2,(H/2)],[-2,H],'linewidth',2);
    arrow([-2,(H/2)],[-2,0],'linewidth',2);
    
    xlabel1=strcat(num2str(B),'mm');
    text((B/2),-4,xlabel1,'fontsize',12,'fontweight','bold');
    ylabel1=strcat(num2str(H),'mm');
    text(-11,(H/2),ylabel1,'fontsize',12,'fontweight','bold');
    
    arrow([(B/4),H/3.5],[3*B/4,H/3.5],'linewidth',2);
    arrow([(3*B/4),H/3.5],[B/4,H/3.5],'linewidth',2);
    
    ylabel2=strcat(num2str(D),'mm');
    text((B/3),H/4.5,ylabel2,'fontsize',12,'fontweight','bold');
    
    title('Second Moment of Area','FontSize',20, 'FontWeight','bold')  
    text(B+6, -2, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');
    axis([-20 (B+14) -2 (H+5)])
    axis off
    
    %Indicating level (c = x start location, d= diameter, e= y plane location)
c=-16; 
d=2;
e=-2;
rectangle('Position',[c,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+4*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
text (c+0.1, e-d ,'Level 1','FontWeight', 'bold', 'fontsize',15)
    
    daspect([1,1,1])
    hold off
%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

close

%%%%%%%%%%%%%START CALCULATING ANSWERS%%%%%%%%%%%%%

Cx = B/2;
Cy = H/2;
Ix = (B*H^3)/12-(pi*D^4)/64;
Iy = (H*B^3)/12-(pi*D^4)/64;

%%%%%%%%%%%%%END CALCULATING ANSWERS%%%%%%%%%%%%%

    numString_xcentre = cloze_numerical((round(Cx*10)/10), 0.025*Cx, 'Good job!', 'Incorrect');
    numString_ycentre = cloze_numerical((round(Cy*10)/10),0.025*Cy, 'Good job!', 'Incorrect');
    numString_x2MOM = cloze_numerical(round(Ix), 0.025*Ix, 'Good job!', 'Incorrect');
    numString_y2MOM = cloze_numerical(round(Iy), 0.025*Iy, 'Good job!', 'Incorrect');

%Question string joining
     questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p><b>A)</b></p><p>Given a section with dimensions as indicated in the image above (in which the centre of the circle overlies the centre of the rectangle),',...
    ' find the x and y coordinates of the centroid in mm, to 1.d.p.</p>',...
    '<p>Centroid = (', numString_xcentre,',', numString_ycentre,') mm.</p>',...
    '<p><p><b>B)</b></p>Calculate the second moments of area of the section with respect to both x and y.</p>',...
    '<p>Give your answer to the nearest whole number and in mm<sup>4</sup>.',...
    '<p>I<sub>x</sub> = ', numString_x2MOM,' mm<sup>4</sup>.',...
    '<p>I<sub>y</sub> = ', numString_y2MOM,' mm<sup>4</sup>.');


    generalfeedbackString=strcat('<p><b>PART A</b></p><p>The shape is symmetrical in both x and y, so the centroid is right in the middle of the area.</p>',...
      '<p><b>PART B</b></p><p>As the circle and the rectangle share the same neutral axis with respect to both x and y, I<sub>x</sub> and I<sub>y</sub> can be calculated as follows:</p>',...
      '<p>I<sub>x</sub> = (bd<sup>3</sup>/12) - ($$\\small\\pi$$d<sup>4</sup>/64) = (',num2str(B),'x',num2str(H),'^3/12) - ($$\\small\\pi$$',num2str(D),'^4/64)</p>',...
      '<p>I<sub>y</sub> = (bd<sup>3</sup>/12) - ($$\\small\\pi$$d<sup>4</sup>/64) = (',num2str(H),'x',num2str(B),'^3/12) - ($$\\small\\pi$$',num2str(D),'^4/64)</p>');
     
           
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>Use the equation for the second moment of area of a rectangle to solve this question:</p><p>I = bd<sup>3</sup>/12</p><p>And the equation for the second moment of area of a circle:</p><p>I = $$\\small\\pi$$d<sup>4</sup>/64</p>', ...
        plotString1, ...
        '', ...
        '', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);




