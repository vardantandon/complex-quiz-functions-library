%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0
%version 2.0: Pilar modified the equation for UDL4 as it was incorrect; (2)
%and also the way SF connects between C and D.

comb1=fopen('cantilever5.xml','w');

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

for i=1:1:100
    
% Start Image

l=randi([15,20]);
Le=l*10;

%Plotting the beam

x1=0;
x2=Le+Le/15;

%Ploting a vertical line

a=plot([Le/15,Le/15],[-1,-0.1],'Color','black','linewidth',5);

hold on

plot([Le/15,Le/15],[1,0.1],'Color','black','linewidth',5);

%Plotting a beam

rectangle('Position',[x1,-0.1,x2,0.2],'LineWidth',1.5);

%Axis restrictions and title

axis([-Le/4 x2+10 -1.8 1.75]);

title('Cantilever Beam','FontSize',14, 'FontWeight','bold');

axis off

%Plotting the sloped lines indicating the rigidity of the vertical wall (in
%keeping with cantilever beams in notes)

for c=0.2:0.2:1
    plot([-Le/25,Le/15],[c,c-0.1],'Color','black','linewidth',1);
end

for d=-0.9:0.2:-0.1
    plot([-Le/25,Le/15],[d,d-0.1],'Color','black','linewidth',1);
end

%Plotting and labelling the reaction forces

arrow([Le/30,-1.3],[Le/30,-0.15],'LineWidth',2) %Reaction force at boundary

text(-2,-1.25,'R','Fontsize',14,'FontWeight','bold') %Label reaction force at boundary

rectangle('Position',[-Le/5,-0.15,Le/8,0.3],'Curvature',[1,1],'LineWidth',1.5); %Moment circle

arrow([-Le/9,-0.15],[-Le/9 + 1,-0.15],'LineWidth',2) %Moment arrow

text(-Le/6,0.3,'M','Fontsize',14,'FontWeight','bold') %Moment label

%Indicating the length of the beam on the plot

a1=Le/15; %Starting point of measured beam
a2=Le+Le/15; %End point of measured beam
%Measured beam does not include beam length to the left of the barrier

a3=a1+(a1+a2)/2; %Midpoint of measured beam

plot([a2,a2],[-0.1,-1.5],'Linestyle','--','linewidth',2,'Color','black');

arrow([a3,-1.5],[a1,-1.5],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1.5],[a2,-1.5],'LineWidth',2); %Draws r.h.s. of arrow

L_in_m=Le/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.6,Length_label,'fontsize',14,'fontweight','bold');

%Indicating level

rectangle('Position',[Le-5*Le/20+5,1.5,Le/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[Le-4*Le/20+5,1.5,Le/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[Le-3*Le/20+5,1.5,Le/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[Le-2*Le/20+5,1.5,Le/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[Le-Le/20+5,1.5,Le/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');

text(a3-5,1.55,'Level 5','fontsize',14,'fontweight','bold'); %Level 5 label

%Showing x direction

arrow([0,-1.75],[Le/5,-1.75],'linewidth',2);

text(Le/5+Le/40,-1.75,'x','Fontsize',14,'fontweight','bold');

%Indicating x=0 position

arrow([Le/15,1.3],[Le/15,1.05],'LineWidth',2) 

text(Le/15-Le/30,1.35,'x=0','Fontsize',12,'fontweight','bold');

%Plotting 1st distributed load

e1=randi([2,round(l/4)]);
E1=e1*10; 
yr=0.12;
hr=0.2;

Position_E1=a1+E1; %Position of ist end of distributed load

length_load=randi([4,round(l/4)]);
Length_Load=length_load*10;

Position_E2=Position_E1+Length_Load; %Position of second end of distributed load

rectangle('Position',[Position_E1,yr,Length_Load,hr],'LineWidth',2,'EdgeColor','r','FaceColor','g');

%Labelling distributed load

w=randi([15,50]);
W=w*10;
Weight_label=strcat(num2str(W),'N');

text(Position_E1+(Length_Load/3),0.2,Weight_label,'fontsize',12,'fontweight','bold');

%Plotting 2nd distributed load

e3=randi([e1+length_load+1,l-5]);
E3=e3*10;
yr2=0.12;
hr2=0.2;

Position_E3=a1+E3; %Position of 1st end of 2nd distributed load

% length_load_2=randi([4,round(l/4)]);
Length_Load_2=Le-E3;

Position_E4=Position_E3+Length_Load_2; %Position of 2nd end of 2nd distributed load

rectangle('Position',[Position_E3,yr2,Length_Load_2,hr2],'LineWidth',2,'EdgeColor','r','FaceColor','g');

%Labelling 2nd distributed load

w2=randi([15,50]);
W2=w2*10;
Weight_label_2=strcat(num2str(W2),'N');

text(Position_E3+(Length_Load_2)/3,0.2,Weight_label_2,'fontsize',12,'fontweight','bold');

%Indication of positions of the ends of the 1st distributed load w.r.t x=0

%For E1

b1=a1; %Starting point of measured position
b2=Position_E1; %End point of measured position

b3=(b1+b2)/2; %Midpoint

arrow([b3,-0.2],[b1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.2],[b2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

E1_in_m=E1/100; %Measured position of first end in m

E1_label=strcat(num2str(E1_in_m),'m');

b4=b1+(b1+b2)/4;

text(b4,-0.3,E1_label,'fontsize',14,'fontweight','bold');

%For E2

plot([Position_E2,Position_E2],[0.1,-0.5],'Linestyle','--','linewidth',2,'Color','black');

b1_2=a1; %Starting point of measured position
b2_2=Position_E2; %End point of measured position

b3_2=b1_2+(b1_2+b2_2)/2; %Midpoint 

arrow([b3_2,-0.5],[b1_2,-0.5],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3_2,-0.5],[b2_2,-0.5],'LineWidth',2); %Draws r.h.s. of arrow

E2_in_m=(E1+Length_Load)/100; %Measured position of second load in m 

E2_label=strcat(num2str(E2_in_m),'m');

b4_2=b1_2+(b1_2+b2_2)/3;

text(b4_2,-0.6,E2_label,'fontsize',14,'fontweight','bold');

%Indication of positions of ends of the 2nd distibuted load w.r.t. x=0

%For E3

plot([Position_E3,Position_E3],[0.1,-0.8],'Linestyle','--','linewidth',2,'Color','black');

d1=a1; %Starting point of measured position
d2=Position_E3; %End point of measured position

d3=(d1+d2)/3; %Midpoint

arrow([d3,-0.8],[d1,-0.8],'LineWidth',2); %Draws l.h.s. of arrow
arrow([d3,-0.8],[d2,-0.8],'LineWidth',2); %Draws r.h.s. of arrow

E3_in_m=E3/100; %Measured position of first end in m

E3_label=strcat(num2str(E3_in_m),'m');

d4=d1+(d1+d2)/4;

text(d4,-0.9,E3_label,'fontsize',14,'fontweight','bold');

%For E4

plot([Le/15,Le/15],[-1,-1.5],'Linestyle','--','linewidth',2,'Color','black');
plot([Position_E4,Position_E4],[0.1,-1.1],'Linestyle','--','linewidth',2,'Color','black');

d1_2=a1; %Starting point of measured position
d2_2=Position_E4; %End point of measured position

d3_2=(d1_2+d2_2)/2; %Midpoint 

E4_in_m=(E3+Length_Load_2)/100; %Measured position of second load in m 

% E4_label=strcat(num2str(E4_in_m),'m');
% 
% d4_2=d1_2+(d1_2+d2_2)/3;
% 
% text(d4_2,-1.2,E4_label,'fontsize',14,'fontweight','bold');

%Plotting point loads

%1st point load

arrow([Position_E1,0.8],[Position_E1,0.3],'LineWidth',2); %plots a point load at the start of the ist distributed load

%2nd point load

Position2=Position_E3+(Length_Load_2)/3; %2nd point load at midpoint of 2nd udl

arrow([Position2,0.8],[Position2,0.3],'LineWidth',2);

plot([Position2,Position2],[0.1,-1.1],'Linestyle','--','linewidth',2,'Color','black');

arrow([d3_2,-1.1],[d1_2,-1.1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3_2,-1.1],[Position2,-1.1],'LineWidth',2); %Draws r.h.s. of arrow

P2_in_m=(Position2-a1)/100; %Measured position of second load in m 

P2_label=strcat(num2str(P2_in_m),'m');

d4_2=d1_2+(d1_2+d2_2)/3;

text(d4_2,-1.2,P2_label,'fontsize',14,'fontweight','bold');

%point load weights

w3=randi([10,20]);

w4=randi([10,20]);

W3=w3*10;

W4=w4*10;

W3_label=strcat(num2str(W3),'N');
W4_label=strcat(num2str(W4),'N');

text(Position_E1-Le/30,0.9,W3_label,'fontsize',14,'fontweight','bold');
text(Position2-Le/30,0.9,W4_label,'fontsize',14,'fontweight','bold');


%Plotting positions A, B, C, D, E and F

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2-10,0.4,'B','fontsize',14,'fontweight','bold');
text(b2_2-5,0.4,'C','fontsize',14,'fontweight','bold');
text(d2,0.4,'D','fontsize',14,'fontweight','bold');
text(Position2+5,0.5,'E','fontsize',14,'fontweight','bold');
text(a2,0.4,'F','fontsize',14,'fontweight','bold');



imgname=strcat('level5_',num2str(i),'.jpg');

saveas(a,imgname);

hold off

%Calculations

%Weight of beam

Wpl=15;

W_beam=Le*15;

%New Noatation

Pb=E1_in_m; 
Pc=E2_in_m;
Pd=E3_in_m;
Pe=P2_in_m;
L=L_in_m;

U1=W3; %1st point load
U2=W; %1st dist. load
U3=W4; %2nd point load
U4=W2; %2nd dist. load
U5=W_beam; %beam

%UDLs

UDL5=U5/L;
UDL2=U2/(Pc-Pb);
UDL4=U4/(L-Pd); %Pilar changed "l" for "L". 

%Reactions
R=U1+U2+U3+U4+U5;

M=U1*Pb+U2*((Pc+Pb)/2)+U3*Pe+U4*((L+Pd)/2)+U5*(L/2);

%Shear Force (given just to the right of each point)

SFA=R;
SFB=R-U1-UDL5*Pb;
SFC=R-U1-U2-UDL5*Pc;
SFD=R-U1-U2-UDL5*Pd;
SFE=R-U1-U2-U3-UDL4*(Pe-Pd)-UDL5*Pe;
SFF=0;

%Plotting the SFD

SF=plot([0,Pb],[SFA,SFA-(SFA-SFB)/5],'Color','red','linewidth',3);

hold on

plot([Pb,Pb],[SFA-(SFA-SFB)/5,SFB],'Color','red','linewidth',3);
plot([Pb,Pc],[SFB,SFC],'Color','red','linewidth',3);
plot([Pc,Pd],[SFC,SFC-(SFC-SFD)/5],'Color','red','linewidth',3);
plot([Pd,Pe],[SFC-(SFC-SFD)/5,SFD],'Color','red','linewidth',3);
plot([Pe,Pe],[SFD,SFE],'Color','red','linewidth',3);
plot([Pe,L],[SFE,SFF],'Color','red','linewidth',3);

SFAB=SFA-(SFA-SFB)/10;
SFCD=SFC-(SFC-SFD)/10;

%Axes and titles

axis([0 L+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

hold off

shearforce=strcat('shearforce_level5_',num2str(i),'.jpg');

saveas(SF,shearforce);

%Bending moment

BMA=-M;
BMB=-M+R*Pb-UDL5*(Pb/2)*Pb;
BMC=-U3*(Pe-Pc)-U4*((L+Pd)/2-Pc)-UDL5*(L-Pc)*((L+Pc)/2-Pc);
BMD=-U3*(Pe-Pd)-U4*((L-Pd)/2)-UDL5*(((L-Pd)^2)/2);
BME=-UDL4*(((L-Pe)^2)/2)-UDL5*(((L-Pe)^2)/2);
BMF=0;

% %Plotting the bending moment diagram
% 
% %1st segment
% 
% mab=(SFAB-SFA)/Pb;
% 
% %When y=SFA, x=0
% 
% cab=SFA;
% 
% xab=(0:0.01:Pb);
% 
% %When x=Pb, y=BMB;
% 
% aab=BMA;
% 
% yab=(mab.*((xab.^2)/2))+(cab.*xab)+aab;
% 
% BM=plot(xab,yab,'linewidth',3,'Color','red');
% 
% hold on
% 
% %2nd segment
% 
% mbc=(SFB-SFAB)/(Pc-Pb);
% 
% %When y=SFB, x=Pb
% 
% cbc=SFB-(mbc*Pb);
% 
% xbc=(Pb:0.01:Pc);
% 
% %When x=PC, y=BMC;
% 
% abc=BMC-(mbc*Pc^2/2+cbc*Pc);
% 
% ybc=mbc.*(xbc.^2)/2+cbc.*xbc+abc;
% 
% plot(xbc,ybc,'linewidth',3,'Color','red');
% 
% %3rd segment
% 
% mcd=(SFCD-SFC)/(Pd-Pc);
% 
% %When y=SFC, x=Pc
% 
% ccd=SFC-(mcd*Pc);
% 
% xcd=(Pc:0.01:Pd);
% 
% %When x=Pc, y=BMC;
% 
% acd=BMC-(mcd*Pc^2/2+ccd*Pc);
% 
% ycd=mcd.*(xcd.^2)/2+ccd.*xcd+acd;
% 
% plot(xcd,ycd,'linewidth',3,'Color','red');
% 
% %4th segment
% 
% mde=(SFE-SFD)/(Pd-Pc);
% 
% %When y=SFE, x=Pe
% 
% cde=SFE-(mde*Pe);
% 
% xde=(Pd:0.01:Pe);
% 
% %When x=Pe, y=BME;
% 
% ade=BME-(mde*Pe^2/2+cde*Pe);
% 
% yde=mde.*(xde.^2)/2+cde.*xde+ade;
% 
% plot(xde,yde,'linewidth',3,'Color','red');
% 
% %5th segment
% 
% mef=(SFE-SFD)/(L-Pe);
% 
% %When y=SFF, x=L
% 
% cef=SFF-(mef*L);
% 
% xef=(Pe:0.01:L);
% 
% %When x=L, y=0;
% 
% aef=0-(mef*L^2/2+cef*L);
% 
% yef=mef.*(xef.^2)/2+cef.*xef+aef;
% 
% plot(xef,yef,'linewidth',3,'Color','red');
% 
% %Axes and titles
% 
% axis([0 L_in_m+0.1 -M 0]);
% 
% title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');
% 
% ylabel('Bending Moment (N.m)','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% bendingmoment=strcat('bendingmoment_level1','.jpg');
% 
% saveas(BM,bendingmoment);

%Maximum BM

MaxBM=-M;
positionMax=0;

%End image

fprintf(comb1,'\n<!--question %d-->',i);
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Cantilever %d Level 5</text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_5_v2/level5_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Consider a Cantilever beam as shown in the image above.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">The wall generates a reaction force, R, at positon A (x=0) and an anticlockwise moment, M.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">The beam itself has a weight of 1.5kN per m.</p>');
fprintf(comb1,'\n%s','<pstyle="text-align: left;" >Using the convention that upward forces and anti-clockwise moments are positive, and the information given:');
fprintf(comb1,'\n%s','<p>a) Calculate the magnitude of the reaction force R and the moment M to the nearest whole number.');

%R and m

fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R);
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'M = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',M);

fprintf(comb1,'\n%s','<p style="text-align: left;">b) Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>');

%Calculating shear force


fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of A.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFA);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of B.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFB);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of C.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFC);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of D.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFD);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of E.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFE);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of F.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFF);


fprintf(comb1,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the SFD</p>');
fprintf(comb1,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A combination of a slope and a straight line.~A curve}</p>');

fprintf(comb1,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>3) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~=A line with a slope.~A combination of horizontal and vertical lines.~A combination of a slope and a straight line.~A curve}</p>');

fprintf(comb1,'\n%s','<p>4) D and E {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of a slope and a straight line.~A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>5) E and F {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

%Calculating the bending moments

fprintf(comb1,'\n%s','<p style="text-align: left;">c) Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):</p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Bending moment at A.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMA);

fprintf(comb1,'\n%s','<p style="text-align: left;">Bending Moment at B.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMB);

fprintf(comb1,'\n%s','<p style="text-align: left;">Bending Moment at C.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMC);

fprintf(comb1,'\n%s','<p style="text-align: left;">Bending Moment at D.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMD);

fprintf(comb1,'\n%s','<p style="text-align: left;">Bending Moment at E.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BME);

fprintf(comb1,'\n%s','<p style="text-align: left;">Bending Moment at F.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMF);

fprintf(comb1,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the BMD</p>');
fprintf(comb1,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb1,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb1,'\n%s','<p>3) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb1,'\n%s','<p>4) D and E {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb1,'\n%s','<p>5) E and F {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>]]>');



fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</questiontext>');



% <generalfeedback format="html">
% <text>
% <![CDATA[<p>-----General Feedback----</p>]]>
% </text>
% </generalfeedback.

fprintf(comb1,'\n%s','<generalfeedback format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');

fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_5_v2/shearforce_level5_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Your Shear Force Diagram should look like the image shown above.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">Note that the portions that would usually be horizontal are now sloped as we have taken the weight of the beam into account.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">However, the slope is negligible,so the weight of the beam is usually ignored.</p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Your Bending Moment Diagram is the integral of the SFD</p>]]>');
fprintf(comb1,'\n%s','<p style="text-align: left;">Remember that for Cantilever Beams, the SFD and BMD both end at zero, but do not start at zero.</p>]]>');


fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</generalfeedback>');



fprintf(comb1,'\n%s','<penalty>0</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');





fprintf(comb1,'\n%s','</question>');
end 
fprintf(comb1,'\n%s','</quiz>');