%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - I beam level 0
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

%solve for an I-beam symmetric in both x and y

ibeam=fopen('ibeam0.xml','w');

fprintf(ibeam,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(ibeam,'\n%s','<quiz>');

for i =1:1:100
    
%%%%%%%START PLOTTING I-BEAM%%%%%%%%%%%%%%%
x=0;
y=0;
w=randi([10,20]);
h=randi([40,60]);

m=plot([0,w],[0,0],'Color','black','linewidth',3);

hold on

plot([0,0],[0,h],'Color','black','linewidth',3);

plot([0,w],[h,h],'Color','black','linewidth',3);

plot([w,w],[0,h],'Color','black','linewidth',3);

axis([-15 (w+10) -20 (h+10)]);

axis off



arrow([(w/2),-5],[w,-5],'linewidth',2);
arrow([(w/2),-5],[0,-5],'linewidth',2);
arrow([-2.5,(h/2)],[-2.5,h],'linewidth',2);
arrow([-2.5,(h/2)],[-2.5,0],'linewidth',2);

xlabel=strcat(num2str(w),'mm');
ylabel=strcat(num2str(h),'mm');

text((w/3),-10,xlabel,'fontsize',12,'fontweight','bold');
text(-10,(h/2),ylabel,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[w-5,h+6,2,3],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[w-2,h+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[w+1,h+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[w+4,h+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[w+7,h+6,2,3],'Curvature',[1,1],'LineWidth',1.5);

hold off

beami=strcat('ibeam0_',num2str(i),'.jpg');
saveas(m,beami);

%%%%%%%%%%%%%END PLOTTING I-BEAM%%%%%%%%%%%%%

%%%%%%%%%%%%%START CALCULATING ANSWERS%%%%%%%%%%%%%

%Centroid

y_cm=h/2;

x_cm=w/2;

%Ix and Iy

Ix=w*(h^3)/12;

E_Ix=0.01*Ix;

Iy=h*(w^3)/12;

E_Iy=0.01*Iy;

%%%%%%%%%%%%%END CALCULATING ANSWERS%%%%%%%%%%%%%

fprintf(ibeam,'\n<!--question: %d -->',i);
fprintf(ibeam,'\n%s','<question type="cloze">');
fprintf(ibeam,'\n%s','<name>');
fprintf(ibeam,'\n<text>I-beam %d (Level 0)</text>',i);
fprintf(ibeam,'\n%s','</name>');

fprintf(ibeam,'\n%s','<questiontext format="html">');
fprintf(ibeam,'\n%s','<text>');
fprintf(ibeam,'%s','<![CDATA[<p><img style="margin-right: auto; margin-left: auto; display: block;"');
fprintf(ibeam,' src="http://www.ucl.ac.uk/~wmapsfl/moodle/I-beam/Ibeam_0/ibeam0_%d.jpg" alt="Beamplot" width="561" height="420"/></p>',i);
fprintf(ibeam,'\n%s','<p style="text-align: center;">Given an I-beam with dimensions as indicated in the image above,');
fprintf(ibeam,'%s',' find the x and y coordinates of the centroid, to 1 d.p., in mm.</p>');
fprintf(ibeam,'\n%s','<p style="text-align: center;">Centroid = ');
fprintf(ibeam,'({1:NUMERICAL:=%6.1f#Excellent!~*#I''m sorry}  ,  {1:NUMERICAL:=%6.1f#Excellent!~*#I''m sorry})  mm </p>',x_cm,y_cm);

fprintf(ibeam,'\n%s','<p style="text-align: center;"> Calculate the second moments of inertia of the given area with respect to both x and y.</p>');
fprintf(ibeam,'\n%s','<p style="text-align: center;"> Give your answer to the nearest whole number and in mm<sup>4</sup>.</p>');

fprintf(ibeam,'\n%s','<p style="text-align: center;">I<sub>x</sub> = ');
fprintf(ibeam,'{2:NUMERICAL:=%3.0f:%1.0f#Excellent!~*#I''m sorry} mm<sup>4</sup></p>',Ix,E_Ix);
fprintf(ibeam,'\n%s','<p style="text-align: center;">I<sub>y</sub> = ');
fprintf(ibeam,'{2:NUMERICAL:=%3.0f:%1.0f#Excellent!~*#I''m sorry} mm<sup>4</sup></p>]]>',Iy,E_Iy);
fprintf(ibeam,'%s','</text>');

fprintf(ibeam,'\n%s','</questiontext>');

fprintf(ibeam,'\n%s','<generalfeedback format="html">');
fprintf(ibeam,'\n%s','<text><![CDATA[<p>The shape is symmetric in both x and y, so the centroid is right in the middle of the area.</p>');
fprintf(ibeam,'%s',']]></text>');
fprintf(ibeam,'\n%s','</generalfeedback>');


fprintf(ibeam,'\n%s','</question>');
end


fprintf(ibeam,'\n%s','</quiz>');