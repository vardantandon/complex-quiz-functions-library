%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - I beam level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


ibeam=fopen('ibeam.xml','w');

fprintf(ibeam,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(ibeam,'\n%s','<quiz>');

for i =1:1:100
    
%%%%%%%START PLOTTING I-BEAM%%%%%%%%%%%%%%%

W=randi([20,30]);
m=plot([0,W],[0,0],'Color','black','linewidth',5);

hold on

l1=randi([10,15]);
plot([0,0],[0,l1],'Color','black','linewidth',5);

plot([W,W],[0,l1],'Color','black','linewidth',5);

w=randi([7,12]);
a=(W-w)/2;
b=a+w;
plot([0,a],[l1,l1],'Color','black','linewidth',5);
plot([b,W],[l1,l1],'Color','black','linewidth',5);

l2=randi([20,30]);
plot([a,a],[l1,(l1+l2)],'Color','black','linewidth',5);
plot([b,b],[l1,(l1+l2)],'Color','black','linewidth',5);

plot([0,a],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);
plot([b,W],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);

L=(2*l1)+l2;

l3=l1;

w1=W;

plot([0,0],[(l1+l2),L],'Color','black','linewidth',5);
plot([W,W],[(l1+l2),L],'Color','black','linewidth',5);

plot([0,W],[L,L],'Color','black','linewidth',5);

axis([-15 (W+10) -20 (L+10)])
axis off

%labelling the beam

arrow([(W/2),-5],[W,-5],'linewidth',2);
arrow([(W/2),-5],[0,-5],'linewidth',2);

arrow([-5,(L/2)],[-5,L],'linewidth',2);
arrow([-5,(L/2)],[-5,0],'linewidth',2);

arrow([(a-2.5),(L/2)],[(a-2.5),(l1+l2)],'linewidth',2);
arrow([(a-2.5),(L/2)],[(a-2.5),l1],'linewidth',2);

arrow([(W/2),(l1+2.5)],[a,(l1+2.5)],'linewidth',2);
arrow([(W/2),(l1+2.5)],[b,(l1+2.5)],'linewidth',2);


Wlabel=strcat(num2str(W),'mm');
Llabel=strcat(num2str(L),'mm');
wlabel=strcat(num2str(w),'mm');
llabel=strcat(num2str(l2),'mm');

text((W/2.5),-10,Wlabel,'fontsize',12,'fontweight','bold');
text(-12,(L/2),Llabel,'fontsize',12,'fontweight','bold');
text((W/2.5),(l1-2.5),wlabel,'fontsize',12,'fontweight','bold');
text((a-9),(L/2),llabel,'fontsize',12,'fontweight','bold');
text(W+1,l1/2,'a','fontsize',12,'fontweight','bold');
text(W+1,l1+l2+l1/2,'a','fontsize',12,'fontweight','bold');
text(a/2,l1-3,'b','fontsize',12,'fontweight','bold');
text(b+a/2,l1-3,'b','fontsize',12,'fontweight','bold');
text(a/2,l1+l2+3,'b','fontsize',12,'fontweight','bold');
text(b+a/2,l1+l2+3,'b','fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[W-10,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[W-7,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[W-4,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[W-1,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[W+2,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5);

hold off

beami=strcat('ibeam1_',num2str(i),'.jpg');
saveas(m,beami);

%%%%%%%%%%%%%END PLOTTING I-BEAM%%%%%%%%%%%%%

%%%%%%%%%%%%%START CALCULATING ANSWERS%%%%%%%%%%%%%

%Centroid

A1=l3*w1;
A2=l2*w;
A3=l1*W;

AT=A1+A2+A3;

y1=L-(l3/2);
y2=l1+(l2/2);
y3=(l1/2);

y_cm=((A1*y1)+(A2*y2)+(A3*y3))/AT;

x1=w1/2;
x2=a+(w/2);
x3=W/2;

x_cm=((A1*x1)+(A2*x2)+(A3*x3))/AT;

%Ix and Iy

%wrt x

d1_x=y1-y_cm;
d2_x=y2-y_cm;
d3_x=y3-y_cm;

%wrt y

d1_y=x1-x_cm;
d2_y=x2-x_cm;
d3_y=x3-x_cm;

I_NA_x_1=w1*(l3^3)/12;
I_NA_x_2=w*(l2^3)/12;
I_NA_x_3=W*(l1^3)/12; 

IX_1=I_NA_x_1+A1*(d1_x^2);
IX_2=I_NA_x_2+A2*(d2_x^2);
IX_3=I_NA_x_3+A3*(d3_x^2);

Ix=IX_1+IX_2+IX_3;

E_Ix=0.01*Ix;

I_NA_y_1=l3*(w1^3)/12;
I_NA_y_2=l2*(w^3)/12;
I_NA_y_3=l1*(W^3)/12;

IY_1=I_NA_y_1+A1*(d1_y^2);
IY_2=I_NA_y_2+A2*(d2_y^2);
IY_3=I_NA_y_3+A3*(d3_y^2);

Iy=IY_1+IY_2+IY_3;

E_Iy=0.01*Iy;

%%%%%%%%%%%%%END CALCULATING ANSWERS%%%%%%%%%%%%%

fprintf(ibeam,'\n<!--question: %d -->',i);
fprintf(ibeam,'\n%s','<question type="cloze">');
fprintf(ibeam,'\n%s','<name>');
fprintf(ibeam,'\n<text>I-beam %d (Level 1)</text>',i);
fprintf(ibeam,'\n%s','</name>');

fprintf(ibeam,'\n%s','<questiontext format="html">');
fprintf(ibeam,'\n%s','<text>');
fprintf(ibeam,'%s','<![CDATA[<p><img style="margin-right: auto; margin-left: auto; display: block;"');
fprintf(ibeam,' src="http://www.ucl.ac.uk/~wmapsfl/moodle/I-beam/Ibeam_1/ibeam1_%d.jpg" alt="Beamplot" width="561" height="420"/></p>',i);
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
fprintf(ibeam,'%s','<p>In order to calculate the moments of inertia, it may be useful to split the area into different segments, in order to simplify the problem.</p>');
fprintf(ibeam,'%s',']]></text>');
fprintf(ibeam,'\n%s','</generalfeedback>');


fprintf(ibeam,'\n%s','</question>');
end


fprintf(ibeam,'\n%s','</quiz>');