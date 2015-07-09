%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0

comb1=fopen('cantilever3.xml','w');

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

for i=1:1:100
    
% Start Image

%Generates image for level 3 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 15/09/14
%version 1.0
%version 2.0 --> Modified by Pilar Garcia Souto as (1) the SF should start
%at value R instead at zero in the feedback; (2) the answer to first
%multiple choice for SF should be "Either a horizontal or vertical line".


l=randi([10,20]);
L=l*10;

%Plotting the beam

x1=0;
x2=L+L/15;

%Ploting a vertical line

a=plot([L/15,L/15],[-1,-0.1],'Color','black','linewidth',5);

hold on

plot([L/15,L/15],[1,0.1],'Color','black','linewidth',5);

%Plotting a beam

rectangle('Position',[x1,-0.1,x2,0.2],'LineWidth',1.5);

%Axis restrictions and title

axis([-L/4 x2+10 -1.75 1.75]);

title('Cantilever Beam','FontSize',14, 'FontWeight','bold');

axis off

%Plotting the sloped lines indicating the rigidity of the vertical wall (in
%keeping with cantilever beams in notes)

for c=0.2:0.2:1
    plot([-L/25,L/15],[c,c-0.1],'Color','black','linewidth',1);
end

for d=-0.9:0.2:-0.1
    plot([-L/25,L/15],[d,d-0.1],'Color','black','linewidth',1);
end

%Plotting and labelling the reaction forces

arrow([L/30,-1.3],[L/30,-0.15],'LineWidth',2) %Reaction force at boundary

text(-2,-1.25,'R','Fontsize',14,'FontWeight','bold') %Label reaction force at boundary

rectangle('Position',[-L/5,-0.15,L/8,0.3],'Curvature',[1,1],'LineWidth',1.5); %Moment circle

arrow([-L/9,-0.15],[-L/9 + 1,-0.15],'LineWidth',2) %Moment arrow

text(-L/6,0.3,'M','Fontsize',14,'FontWeight','bold') %Moment label

%Indicating the length of the beam on the plot

a1=L/15; %Starting point of measured beam
a2=L+L/15; %End point of measured beam
%Measured beam does not include beam length to the left of the barrier

a3=a1+(a1+a2)/2; %Midpoint of measured beam

plot([a2,a2],[-0.1,-1],'Linestyle','--','linewidth',2,'Color','black');

arrow([a3,-1],[a1,-1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1],[a2,-1],'LineWidth',2); %Draws r.h.s. of arrow

L_in_m=L/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.1,Length_label,'fontsize',14,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

text(a3-5,1.55,'Level 3','fontsize',14,'fontweight','bold'); %Level 3 label

%Showing x direction

arrow([0,-1.5],[L/5,-1.5],'linewidth',2);

text(L/5+L/40,-1.5,'x','Fontsize',14,'fontweight','bold');

%Indicating x=0 position

arrow([L/15,1.3],[L/15,1.05],'LineWidth',2) 

text(L/15-L/30,1.35,'x=0','Fontsize',12,'fontweight','bold');

%Plotting distributed load

e1=randi([3,round(l/3)]);
E1=e1*10; 
yr=0.12;
hr=0.2;

Position_E1=a1+E1; %Position of ist end of distributed load

length_load=randi([3,round(l/2.5)]);
Length_Load=length_load*10;

Position_E2=Position_E1+Length_Load; %Position of second end of distributed load

rectangle('Position',[Position_E1,yr,Length_Load,hr],'LineWidth',2,'EdgeColor','r','FaceColor','g');

%Labelling distributed load

w=randi([15,50]);
W=w*10;
Weight_label=strcat(num2str(W),'N');

text(Position_E1+(Length_Load/3),0.2,Weight_label,'fontsize',12,'fontweight','bold');

%Indication of positions of the ends of the distributed load w.r.t x=0

%For E1

b1=a1; %Starting point of measured position
b2=Position_E1; %End point of measured position

b3=b1+(b1+b2)/2; %Midpoint

arrow([b3,-0.2],[b1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.2],[b2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

E1_in_m=E1/100; %Measured position of first end in m

E1_label=strcat(num2str(E1_in_m),'m');

b4=b1+(b1+b2)/4;

text(b4,-0.3,E1_label,'fontsize',14,'fontweight','bold');

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

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2-5,0.4,'B','fontsize',14,'fontweight','bold');
text(b2_2,0.4,'C','fontsize',14,'fontweight','bold');
text(a2,0.2,'D','fontsize',14,'fontweight','bold');

imgname=strcat('level3a_',num2str(i),'.jpg');

saveas(a,imgname);

hold off

%Plotting the equivalent free body diagram

%Plotting the beam

x1=0;
x2=L+L/15;

%Ploting a vertical line

b=plot([L/15,L/15],[-1,-0.1],'Color','black','linewidth',5);

hold on

plot([L/15,L/15],[1,0.1],'Color','black','linewidth',5);

%Plotting a beam

rectangle('Position',[x1,-0.1,x2,0.2],'LineWidth',1.5);

%Axis restrictions and title

axis([-L/4 x2+10 -1.75 1.75]);

title('Equivalent Free Body Diagram','FontSize',14, 'FontWeight','bold');

axis off

%Plotting the sloped lines indicating the rigidity of the vertical wall (in
%keeping with cantilever beams in notes)

for c=0.2:0.2:1
    plot([-L/25,L/15],[c,c-0.1],'Color','black','linewidth',1);
end

for d=-0.9:0.2:-0.1
    plot([-L/25,L/15],[d,d-0.1],'Color','black','linewidth',1);
end

%Plotting and labelling the reaction forces

arrow([L/30,-1.3],[L/30,-0.15],'LineWidth',2) %Reaction force at boundary

text(-2,-1.25,'R','Fontsize',14,'FontWeight','bold') %Label reaction force at boundary

rectangle('Position',[-L/5,-0.15,L/8,0.3],'Curvature',[1,1],'LineWidth',1.5); %Moment circle

arrow([-L/9,-0.15],[-L/9 + 1,-0.15],'LineWidth',2) %Moment arrow

text(-L/6,0.3,'M','Fontsize',14,'FontWeight','bold') %Moment label

%Indicating the length of the beam on the plot

a1=L/15; %Starting point of measured beam
a2=L+L/15; %End point of measured beam
%Measured beam does not include beam length to the left of the barrier

a3=a1+(a1+a2)/2; %Midpoint of measured beam

plot([a2,a2],[-0.1,-1],'Linestyle','--','linewidth',2,'Color','black');

arrow([a3,-1],[a1,-1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1],[a2,-1],'LineWidth',2); %Draws r.h.s. of arrow

L_in_m=L/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.1,Length_label,'fontsize',14,'fontweight','bold');

%Plotting equivalent point load

Position=(Position_E1+Position_E2)/2; %Position of point load

P=Position-a1; %measured position of point load

P_in_m=P/100; %measured position in m

arrow([Position,0.75],[Position,0.1],'LineWidth',3)

text(Position-L/30,0.85,Weight_label,'fontsize',14,'fontweight','bold') %labelling weight of the point load

%Indicating distance of point load from position x=0

c1=a1; %Starting point of measured position
c2=Position; %End point of measured position

c3=c1+(c1+c2)/2; %Midpoint 

arrow([c3,-0.2],[c1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([c3,-0.2],[c2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

Position_label=strcat(num2str(P_in_m),'m');

c4=c1+(c1+c2)/4;

text(c4,-0.3,Position_label,'fontsize',14,'fontweight','bold');

imgname2=strcat('level3b_',num2str(i),'.jpg');

saveas(b,imgname2);

hold off

%Plotting the SFD

R=W;

%By taking moments about A

M=(E1_in_m+E2_in_m)*W/2;

SFA=R;
SFB=R;
SFC=0;
SFD=0;


% SF=plot([0,0],[0,R],'linewidth',4,'Color','red'); %commented by Pilar  as this line should not be there
% hold on %commented by Pilar as this line should not be there

SF=plot([0,E1_in_m],[R,R],'linewidth',3,'Color','red');
hold on
plot([E1_in_m,E2_in_m],[R,0],'linewidth',3,'Color','red');
plot([E2_in_m,L_in_m],[0,0],'linewidth',3,'Color','red');

%Axes and titles

axis([0 L_in_m+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

shearforce=strcat('shearforce_level3_',num2str(i),'.jpg');

saveas(SF,shearforce);

hold off

%Plotting the bending moment diagram

BMA=-M;
BMB=-(abs(M-R*E1_in_m));
BMC=0;
BMD=0;

BM=plot([0,E1_in_m],[-M,BMB],'linewidth',3,'Color','red');

hold on

plot([E2_in_m,L_in_m],[0,0],'linewidth',3,'Color','red');

m=(SFC-SFB)/(E2_in_m-E1_in_m);
C=-1*(m*E2_in_m);

X=(E1_in_m:0.01:E2_in_m);

%When x=E1, y=BMB
A=BMB-(m*E1_in_m^2/2+C*E1_in_m);

Y=m.*(X.^2)/2 + C.*X +A;

plot(X,Y,'linewidth',3,'Color','red');

%Axes and titles

axis([0 L_in_m -M 0]);

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending Moment (N.m)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

bendingmoment=strcat('bendingmoment_level3_',num2str(i),'.jpg');

saveas(BM,bendingmoment);

hold off



%End image

fprintf(comb1,'\n<!--question %d-->',i);
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Cantilever %d Level 3</text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_3/level3a_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Consider a Cantilever beam as shown in the image above.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">The wall generates a reaction force, R, at positon A (x=0) and an anticlockwise moment, M.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">There is a single Uniformly distributed load acting between positions B and C as shown.</p>');
fprintf(comb1,'\n%s','<pstyle="text-align: left;" >Using the convention that upward forces (vertical),forces to the right (horizontal) and anti-clockwise moments are positive, and the information given:');
fprintf(comb1,'\n%s','<p>a) Calculate the magnitude of the reaction force R and the moment M to the nearest whole number.');

%R and m

fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R);
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'M = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',M);

fprintf(comb1,'\n%s','<p style="text-align: left;">b) Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values:</p>');

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

fprintf(comb1,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the SFD</p>');
fprintf(comb1,'\n%s','<p>1) A and B {1:MULTICHOICE:~=Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>3) C and D {1:MULTICHOICE:=Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');


%Calculating the bending moments

fprintf(comb1,'\n%s','<p style="text-align: left;">c) Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values:</p>');

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

fprintf(comb1,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the BMD</p>');
fprintf(comb1,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb1,'\n%s','<p>3) C and D {1:MULTICHOICE:=Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>]]>');



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

fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_3/level3b_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">The Equivalent Free Body Diagram for the system is shown above.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">Distributed loads are equivalent to point loads acting at the midpoint of the distributed load.</p>');

fprintf(comb1,'\n%s','<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_3/shearforce_level3_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Your Shear Force Diagram should look like the image shown above.</p>');

fprintf(comb1,'\n%s','<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_3/bendingmoment_level3_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Your Bending Moment Diagram should look like the image shown above. It is the integral of the SFD</p>]]>');

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</generalfeedback>');



fprintf(comb1,'\n%s','<penalty>0</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');





fprintf(comb1,'\n%s','</question>');
end 
fprintf(comb1,'\n%s','</quiz>');