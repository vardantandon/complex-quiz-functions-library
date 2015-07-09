%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0

comb1=fopen('cantilever1.xml','w');

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

for i=1:1:100
    
% Start Image

%Generates image for level 1 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 15/09/14
%version 1.0
%version 2.0. Modifications done by Pilar Garcia Souto (1) the SF should
%start at the value R, instead o. Needed to modify the graph.

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

arrow([a3,-1],[a1,-1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1],[a2,-1],'LineWidth',2); %Draws r.h.s. of arrow

plot([a2,a2],[-0.1,-1],'LineStyle','--','LineWidth',2,'Color','black');

L_in_m=L/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.1,Length_label,'fontsize',14,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-3*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

text(a3,1.55,'Level 1','fontsize',14,'fontweight','bold'); %Level 1 label

%Showing x direction

arrow([0,-1.5],[L/5,-1.5],'linewidth',2);

text(L/5+L/40,-1.5,'x','Fontsize',14,'fontweight','bold');

%Indicating x=0 position

arrow([L/15,1.3],[L/15,1.05],'LineWidth',2) 

text(L/15-L/30,1.35,'x=0','Fontsize',12,'fontweight','bold');

%Plotting point load

p=randi([4,l-3]);
P=p*10;
Position=a1+P;
arrow([Position,0.75],[Position,0.1],'LineWidth',3)

%Weight

w=randi([10,20]);
W=w*10;
Weight_label=strcat(num2str(W),'N');

text(Position-L/30,0.85,Weight_label,'fontsize',14,'fontweight','bold') %labelling weight of the pont load

%Indicating distance of point load from position x=0

b1=a1; %Starting point of measured position
b2=Position; %End point of measured position

b3=b1+(b1+b2)/2; %Midpoint 

arrow([b3,-0.2],[b1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.2],[b2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

P_in_m=P/100; %Position in m

Position_label=strcat(num2str(P_in_m),'m');

b4=b1+(b1+b2)/3;

text(b4,-0.3,Position_label,'fontsize',14,'fontweight','bold');

%Indicating positions A, B and C

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2+4,0.2,'B','fontsize',14,'fontweight','bold');
text(a2,0.2,'C','fontsize',14,'fontweight','bold');

hold off

imgname=strcat('level1_',num2str(i),'.jpg');

saveas(a,imgname);

%Plotting the SFD

R=W;

%By taking moments about A

M=(W*P_in_m);

%SF=plot([0,0],[0,R],'linewidth',3,'Color','red'); %commented by Pilar as the SF should start directly at R
%hold on %commented by Pilar

SF= plot([0,P_in_m],[R,R],'linewidth',2,'Color','red');

hold on

plot([P_in_m,P_in_m],[R,0],'linewidth',2,'Color','red');

plot([P_in_m,L_in_m],[0,0],'linewidth',2,'Color','red');

%Axes and titles

axis([0 L_in_m+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

shearforce=strcat('shearforce_level1_',num2str(i),'.jpg');

saveas(SF,shearforce);

hold off

%Plotting the bending moment diagram

BM=plot([0,P_in_m],[-M,0],'linewidth',2,'Color','red');

hold on

plot([P_in_m,L_in_m],[0,0],'linewidth',2,'Color','red');

%Axes and titles

axis([0 L_in_m -M 0]);

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending Moment (N.m)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

bendingmoment=strcat('bendingmoment_level1_',num2str(i),'.jpg');

saveas(BM,bendingmoment);

hold off

%End image

fprintf(comb1,'\n<!--question %d-->',i);
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Cantilever %d Level 1</text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_1/level1_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Consider a Cantilever beam as shown in the image above.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">The wall generates a support, R, at positon A (x=0) and an anticlockwise moment, M.</p>');
fprintf(comb1,'\n%s','<p style="text-align: left;">There is a single external point force acting on the beam at position B as shown in the diagram.</p>');
fprintf(comb1,'\n%s','<pstyle="text-align: left;" >Using the convention that upward forces and anti-clockwise moments are positive, and the information given:');
fprintf(comb1,'\n%s','<p>a) Calculate the magnitude of the reaction force R and the moment M to the nearest whole number.');

%R and m

fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R);
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'M = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',M);

fprintf(comb1,'\n%s','<p style="text-align: left;">b) Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values:</p>');

%Calculating shear force

SFA=R;
SFB=0;
SFC=0;


fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of A.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFA);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of B.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFB);

fprintf(comb1,'\n%s','<p style="text-align: left;">Shear Force just to the right of C.</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;">');
fprintf(comb1,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFC);

fprintf(comb1,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the SFD</p>');
fprintf(comb1,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>2) B and C {1:MULTICHOICE:=Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');


%Calculating the bending moments

BMA=-M;
BMB=0;
BMC=0;

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

fprintf(comb1,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the BMD</p>');
fprintf(comb1,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb1,'\n%s','<p>2) B and C {1:MULTICHOICE:=Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>]]>');



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
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_1/shearforce_level1_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Your Shear Force Diagram should look like the image shown above.</p>');

fprintf(comb1,'\n%s','<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/Cantilever/Level_2/bendingmoment_level1_%d.jpg"',i);
fprintf(comb1,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb1,'\n%s','<p style="text-align: left;">Your Bending Moment Diagram should look like the image shown above.</p>]]>');

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</generalfeedback>');



fprintf(comb1,'\n%s','<penalty>0</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');





fprintf(comb1,'\n%s','</question>');
end 
fprintf(comb1,'\n%s','</quiz>');