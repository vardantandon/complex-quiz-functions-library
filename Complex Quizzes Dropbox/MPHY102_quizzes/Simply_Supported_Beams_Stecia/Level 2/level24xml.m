%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 2
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


comb2=fopen('combined2.xml','w');

fprintf(comb2,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb2,'\n%s','<quiz>');

for i=1:1:1
    
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

%Plotting 1st point load

p=randi([3,l-5]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling 1st point load

w=randi([5,15]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')



%Plotting 2nd point load

p2=randi([p+1,l-1]);
P2=p2*10;
arrow([P2,0.75],[P2,0],'LineWidth',3);

%Labelling 2nd point load

w2=randi([5,15]);
W2=w2*10;
W2_label=strcat(num2str(W2),'N');

text(P2-5,0.85,W2_label,'fontsize',12,'fontweight','bold')

%Labelling distances

d_label=strcat(num2str(P),'cm');

plot([P2,P2],[0,-0.5],'LineStyle','--','Color','black','Linewidth',1.5);

d2_label=strcat(num2str(P2),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',3);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',3);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

arrow([P2/2,-0.5],[0,-0.5],'LineWidth',3);
arrow([P2/2,-0.5],[P2,-0.5],'LineWidth',3);

text(P2/3,-0.6,d2_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([(P+L)/2,-0.1],[L,-0.1],'LineWidth',3);
    arrow([(P+L)/2,-0.1],[P,-0.1],'LineWidth',3);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
      arrow([(P2+L)/2,-0.5],[L,-0.5],'LineWidth',3);
    arrow([(P2+L)/2,-0.5],[P2,-0.5],'LineWidth',3);
    
  LP2=L-P2;
    
    text(P2+(LP2/3),-0.6,strcat(num2str(LP2),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

imgname=strcat('level2_',num2str(i),'.jpg');

saveas(a,imgname);

hold off

%End image

fprintf(comb2,'\n<!--question %d-->',i);
fprintf(comb2,'\n%s','<question type="cloze">');

fprintf(comb2,'\n%s','<name>');
fprintf(comb2,'\n<text>Combined %d Level 2</text>',i);
fprintf(comb2,'\n%s','</name>');

fprintf(comb2,'\n%s','<questiontext format="html">');
fprintf(comb2,'\n%s','<text>');
fprintf(comb2,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb2,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/combined2/level2_%d.jpg"',i);
fprintf(comb2,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb2,'\n%s','<p style="text-align: left;">Consider a simply supported beam as shown above with length L.</p>');
fprintf(comb2,'\n%s','<p style="text-align: left;">There are two supports at either end of the beam,which generate reaction forces R1 and R2, at positions x=0 and x=L respectively.</p>');
fprintf(comb2,'\n%s','<p style="text-align: left;">There are two external point forces acting on the beam as shown in the diagram.</p>');
fprintf(comb2,'\n%s','<pstyle="text-align: left;" >Using the convention that upward forces and anti-clockwise moments are positive, and the information given:');
fprintf(comb2,'\n%s','<p>a) Calculate the reaction forces R1 and R2 to the nearest whole number.');

%Calculating reaction forces

R2=((W*P)+(W2*P2))/L;

R1=W+W2-R2;

fprintf(comb2,'\n%s','<p style="text-align: center;" >');
fprintf(comb2,'R1 = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R1);
fprintf(comb2,'\n%s','<p style="text-align: center;" >');
fprintf(comb2,'R2 = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R2);

fprintf(comb2,'\n%s','<p style="text-align: left;">b) Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values:</p>');

%Calculating shear force

SFA=R1;
SFB=R1-W;
SFC=R1-W-W2;
SFD=0;


fprintf(comb2,'\n%s','<p style="text-align: left;">Shear Force just to the right of A i.e (x=0).</p>');
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFA);

fprintf(comb2,'\n<p style="text-align: left;">Shear Force just to the right of B i.e. (x=%d).</p>',P);
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFB);

fprintf(comb2,'\n<p style="text-align: left;">Shear Force just to the right of C i.e. (x=%d).</p>',P2);
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFC);

fprintf(comb2,'\n%s','<p style="text-align: left;">Shear Force just to the right of D i.e (x=L).</p>');
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',0);

fprintf(comb2,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the SFD</p>');
fprintf(comb2,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb2,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb2,'\n%s','<p>3) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');


%Calculating the bending moments

%Converting cm to m

Lm=L/100;
Pm=P/100;
P2m=P2/100;

BMA=0;
BMB=abs(R1*Pm);
BMC=abs((R1*P2m)-(W*(P2m-Pm)));
BMD=0;

fprintf(comb2,'\n%s','<p style="text-align: left;">c) Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values:</p>');

fprintf(comb2,'\n%s','<p style="text-align: left;">Bending moment at A.</p>');
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMA);

fprintf(comb2,'\n%s','<p style="text-align: left;">Bending Moment at B.</p>');
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMB);

fprintf(comb2,'\n%s','<p style="text-align: left;">Bending Moment at C.</p>');
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMC);

fprintf(comb2,'\n%s','<p style="text-align: left;">Bending Moment at D.</p>');
fprintf(comb2,'\n%s','<p style="text-align: center;">');
fprintf(comb2,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMD);


fprintf(comb2,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the BMD</p>');
fprintf(comb2,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb2,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb2,'\n%s','<p>2) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>]]>');



fprintf(comb2,'\n%s','</text>');
fprintf(comb2,'\n%s','</questiontext>');



fprintf(comb2,'\n%s','<penalty>0</penalty>');
fprintf(comb2,'\n%s','<hidden>0</hidden>');





fprintf(comb2,'\n%s','</question>');
end 
fprintf(comb2,'\n%s','</quiz>');