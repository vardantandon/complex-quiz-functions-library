%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

comb3=fopen('combined3.xml','w');

fprintf(comb3,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb3,'\n%s','<quiz>');

for i=1:1:100
    
% Start Image

l=randi([10,20]);
L=l*10;

%Plotting the beam

y1=0;
y2=0;
x1=0;
x2=L;

a=plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

title('Simply Supported Beam','FontSize',12, 'FontWeight','bold');

axis off

%Indicating the beam length on the plot

L_unit=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%Plotting distributed load

p1=randi([3,round(l/3)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([3,round(l/2.5)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling distributed load

w=randi([15,50]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P1+(WR/3),0.15,W_label,'fontsize',12,'fontweight','bold');

%Labelling distances

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');
d3_label=strcat(num2str(L-P1-WR),'cm');

arrow([P1/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P1/2,-0.1],[P1,-0.1],'LineWidth',2);

arrow([P1+(WR/2),-0.1],[P1,-0.1],'LineWidth',2);
arrow([P1+(WR/2),-0.1],[P1+WR,-0.1],'LineWidth',2);

arrow([(P1+WR+L)/2,-0.1],[P1+WR,-0.1],'LineWidth',2);
arrow([(P1+WR+L)/2,-0.1],[L,-0.1],'LineWidth',2);

text(P1/3,-0.2,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.2,d2_label,'fontsize',12,'fontweight','bold');

text(P1+WR+(L-P1-WR)/3,-0.2,d3_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

imgname=strcat('level3a_',num2str(i),'.jpg');

saveas(a,imgname);

hold off

%Drawing equivalent free body diagram with point loads

%Plotting the beam

y1b=0;
y2b=0;
x1b=0;
x2b=L;

b=plot([x1b,x2b],[y1b,y2b],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

title('Simply Supported Beam','FontSize',12, 'FontWeight','bold');

axis off

%Indicating the beam length on the plot

L_unit_b=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit_b,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%Plotting point load

P=P1+WR/2;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load

W_label_b=strcat(num2str(W),'N');

text(P-5,0.85,W_label_b,'fontsize',12,'fontweight','bold')

%Labelling distances

d_label=strcat(num2str(P),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',3);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',3);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',3);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',3);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(LP),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

imgname=strcat('level3b_',num2str(i),'.jpg');

saveas(b,imgname);

hold off

%End image

fprintf(comb3,'\n<!--question %d-->',i);
fprintf(comb3,'\n%s','<question type="cloze">');

fprintf(comb3,'\n%s','<name>');
fprintf(comb3,'\n<text>Combined %d Level 3</text>',i);
fprintf(comb3,'\n%s','</name>');

fprintf(comb3,'\n%s','<questiontext format="html">');
fprintf(comb3,'\n%s','<text>');
fprintf(comb3,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb3,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/combined3/level3a_%d.jpg"',i);
fprintf(comb3,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb3,'\n%s','<p style="text-align: left;">Consider a simply supported beam as shown above with length L.</p>');
fprintf(comb3,'\n%s','<p style="text-align: left;">There are two supports at either end of the beam,which generate reaction forces R1 and R2, at positions x=0 and x=L respectively.</p>');
fprintf(comb3,'\n%s','<p style="text-align: left;">There is a Uniformly Distributed Load (UDL) acting on the beam as shown in the diagram.</p>');
fprintf(comb3,'\n%s','<p style="text-align: left;">Below is the equivalent Free Body Diagram using only Point Loads.</p>');

fprintf(comb3,'\n%s','<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb3,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/combined3/level3b_%d.jpg"',i);
fprintf(comb3,'%s','alt="Beamplot" width="30 height="30"/></p>');


fprintf(comb3,'\n%s','<pstyle="text-align: left;" >Using the convention that upward forces and anti-clockwise moments are positive, and the information given:');
fprintf(comb3,'\n%s','<p>a) Calculate the reaction forces R1 and R2 to the nearest whole number.');

%Calculating reaction forces

R2=(W*P)/L;

R1=W-R2;

fprintf(comb3,'\n%s','<p style="text-align: center;" >');
fprintf(comb3,'R1 = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R1);
fprintf(comb3,'\n%s','<p style="text-align: center;" >');
fprintf(comb3,'R2 = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R2);

fprintf(comb3,'\n%s','<p style="text-align: left;">b) Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values:</p>');

%Calculating shear force

SFA=R1;
SFB=R1;
SFC=-1*R2;
SFD=0;


fprintf(comb3,'\n%s','<p style="text-align: left;">Shear Force just to the right of A i.e (x=0).</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFA);

fprintf(comb3,'\n<p style="text-align: left;">Shear Force just to the right of B i.e. (x=%d).</p>',P1);
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFB);

fprintf(comb3,'\n<p style="text-align: left;">Shear Force just to the right of C i.e. (x=%d).</p>',(P1+WR));
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFC);

fprintf(comb3,'\n%s','<p style="text-align: left;">Shear Force just to the right of D i.e (x=L).</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',0);

fprintf(comb3,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the SFD</p>');
fprintf(comb3,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb3,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb3,'\n%s','<p>3) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');


%Calculating the bending moments

%Converting cm to m

Lm=L/100;
P1m=P1/100;
WRm=WR/100;
P2=P1m+WRm;

BMA=0;
BMB=abs(R1*P1m);
BMC=abs(R2*(Lm-P2));
BMD=0;

fprintf(comb3,'\n%s','<p style="text-align: left;">c) Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values:</p>');

fprintf(comb3,'\n%s','<p style="text-align: left;">Bending moment at A.</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',0);

fprintf(comb3,'\n%s','<p style="text-align: left;">Bending Moment at B.</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMB);

fprintf(comb3,'\n%s','<p style="text-align: left;">Bending Moment at C.</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMC);

fprintf(comb3,'\n%s','<p style="text-align: left;">Bending Moment at D.</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',0);

fprintf(comb3,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the BMD</p>');
fprintf(comb3,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb3,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb3,'\n%s','<p>3) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb3,'\n%s','<p style="text-align:left;">d) Where does the maximum bending moment occur?</p>');

%Calculations for X1

m=(SFC-SFB)/WR;
c=SFB-(m*P1);
X1=(-1*c)/m;
X1m=X1/100;
Pm=P/100;

%Calculating Maximum Bending moment

if X1<P
    BM_Max=abs(R1*X1m);
else
    BM_Max=abs(R2*(Lm-X1m));
end

fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!The BMD is a maximum at the x intercept of the SFD.~*#Sorry. Try again.The BMD is a maximum at the x intercept of the SFD.} cm</p>',X1);

fprintf(comb3,'\n%s','<p style="text-align:left;">d) What is the maximum bending moment?</p>');
fprintf(comb3,'\n%s','<p style="text-align: center;">');
fprintf(comb3,'{1:NUMERICAL:=%3.0f:1#Good job!The BMD is a maximum at the x intercept of the SFD.~*#Sorry. Try again.The BMD is a maximum at the x intercept of the SFD.} N.m</p>]]>',BM_Max);

fprintf(comb3,'\n%s','</text>');
fprintf(comb3,'\n%s','</questiontext>');



fprintf(comb3,'\n%s','<penalty>0</penalty>');
fprintf(comb3,'\n%s','<hidden>0</hidden>');





fprintf(comb3,'\n%s','</question>');
end 
fprintf(comb3,'\n%s','</quiz>');