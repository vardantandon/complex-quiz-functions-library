%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - I beam level 0
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

%solve for an I-beam symmetric in both x and y

file=fopen('ibeam0.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100

ID=strcat(num2str(i));

IDString=strcat('Second Moment of Area. Level 0.Question ID #', ID);   

%%%%%%%START PLOTTING I-BEAM%%%%%%%%%%%%%%%
x=0;
y=0;
w=randi([10,20]);
h=randi([40,60]);

plot([0,w],[0,0],'Color','black','linewidth',3);

hold on

plot([0,0],[0,h],'Color','black','linewidth',3);

plot([0,w],[h,h],'Color','black','linewidth',3);

plot([w,w],[0,h],'Color','black','linewidth',3);

axis([-15 (w+10) -20 (h+10)]);

axis off

title('Second Moment of Area','FontSize',20, 'FontWeight','bold');

text(w+5, -20, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');


arrow([(w/2),-5],[w,-5],'linewidth',2);
arrow([(w/2),-5],[0,-5],'linewidth',2);
arrow([-2.5,(h/2)],[-2.5,h],'linewidth',2);
arrow([-2.5,(h/2)],[-2.5,0],'linewidth',2);

xlabel=strcat(num2str(w),'mm');
ylabel=strcat(num2str(h),'mm');

text((w/3),-10,xlabel,'fontsize',12,'fontweight','bold');
text(-10,(h/2),ylabel,'fontsize',12,'fontweight','bold');

%Indicating level (c = x start location, d= diameter, e= y plane location)
c=-15; 
d=2;
e=-20;
rectangle('Position',[c,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+4*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
text (c+0.1, e-d ,'Level 0','FontWeight', 'bold', 'fontsize',15)

% Axes requirements

% axis ([-0.5 1.1*w -0.4 1.5*h])

axis off

% daspect ([1,1,1])

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%%%%%%%%%%%%%END PLOTTING I-BEAM%%%%%%%%%%%%%

%%%%%%%%%%%%%START CALCULATING ANSWERS%%%%%%%%%%%%%

%Centroid

y_cm=h/2;

x_cm=w/2;

%Ix and Iy

Ix=w*(h^3)/12;

Iy=h*(w^3)/12;

%%%%%%%%%%%%%END CALCULATING ANSWERS%%%%%%%%%%%%%

    numString_xcentre = cloze_numerical((round(x_cm*10)/10), 0.025*x_cm, 'Good job!', 'Incorrect');
    numString_ycentre = cloze_numerical((round(y_cm*10)/10),0.025*y_cm, 'Good job!', 'Incorrect');
    numString_x2MOM = cloze_numerical(round(Ix), 0.025*Ix, 'Good job!', 'Incorrect');
    numString_y2MOM = cloze_numerical(round(Iy), 0.025*Iy, 'Good job!', 'Incorrect');

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p><b>A)</b></p><p>Given a rectangular beam with dimensions as indicated in the image above,',...
    ' find the x and y coordinates of the centroid in mm, to 1.d.p.</p>',...
    '<p>Centroid = (', numString_xcentre,',', numString_ycentre,') mm.</p>',...
    '<p><p><b>B)</b></p>Calculate the second moments of area of the rectangular beam with respect to both x and y.</p>',...
    '<p>Give your answer to the nearest whole number and in mm<sup>4</sup>.',...
    '<p>I<sub>x</sub> = ', numString_x2MOM,' mm<sup>4</sup>.',...
    '<p>I<sub>y</sub> = ', numString_y2MOM,' mm<sup>4</sup>.');

    generalfeedbackString=strcat('<p><b>PART A</b></p><p>The shape is symmetrical in both x and y, so the centroid is right in the middle of the area.</p>',...
    '<p><b>PART B</b></p><p>Use the equation I = bd<sup>3</sup>/12 to find the second moment of area, remembering to use the correct values for b and d each time.</p>',...
    '<p>In this case:</p>',...
    '<p>I<sub>x</sub> = &nbsp', num2str(w),' mm x (', num2str(h),'mm^3)/12</p>',...
    '<p>I<sub>y</sub> = &nbsp', num2str(h),' mm x (', num2str(w),'mm^3)/12</p>');   
           
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>Use the equation for the second moment of area of a rectangle to solve this question:</p><p>I = bd<sup>3</sup>/12</p>', ...
        plotString1, ...
        '', ...
        '', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);




