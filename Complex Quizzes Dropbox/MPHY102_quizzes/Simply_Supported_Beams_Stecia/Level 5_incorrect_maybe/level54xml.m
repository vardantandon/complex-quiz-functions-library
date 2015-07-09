%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 5
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

comb5=fopen('combined5.xml','w');

fprintf(comb5,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb5,'\n%s','<quiz>');

for i=1:1:100
    
% Start Image

l=20;
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

%plotting 1st distributed load

p1=randi([2,round(l/6)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([15,round(l-p1-2)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling 1st distributed load

w=randi([15,50]);
W1=w*10;
W1_label=strcat(num2str(W1),'N');

text(P1+(WR/3),0.15,W1_label,'fontsize',12,'fontweight','bold');

%Plotting point load

p=randi([3,l-3]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load

w=randi([8,20]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

%labelling distances

d_label=strcat(num2str(P),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',2);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',2);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',2);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
end 

plot([P1,P1],[0,-0.5],'LineStyle','--','Linewidth',1.5,'Color','black');
plot([P1+WR,P1+WR],[0,-0.5],'LineStyle','--','Linewidth',1.5,'Color','black');

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');

arrow([P1/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([P1/2,-0.5],[P1,-0.5],'LineWidth',2);

arrow([P1+(WR/2),-0.5],[P1,-0.5],'LineWidth',2);
arrow([P1+(WR/2),-0.5],[P1+WR,-0.5],'LineWidth',2);

text(P1/3,-0.6,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.6,d2_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');


%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

imgname=strcat('level5a_',num2str(i),'.jpg');

saveas(a,imgname);

hold off

%Drawing equivalent free body diagram

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

arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load


text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

%labelling distances

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',2);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',2);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',2);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Plotting distributed point load

Pb=P1+WR/2;
arrow([Pb,0.75],[Pb,0],'LineWidth',3)

%Labelling  1st point load

text(Pb-5,0.85,W1_label,'fontsize',12,'fontweight','bold')

plot([Pb,Pb],[0,-0.5],'LineStyle','--','LineWidth',1.5,'Color','black');

db_label=strcat(num2str(Pb),'cm');
db2_label=strcat(num2str(L-Pb),'cm');

if P>=L/2
    
    arrow([Pb/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([Pb/2,-0.5],[Pb,-0.5],'LineWidth',2);

text(Pb/3,-0.6,db_label,'fontsize',12,'fontweight','bold');

else 
    
 arrow([(Pb+L)/2,-0.5],[L,-0.5],'LineWidth',2);
    arrow([(Pb+L)/2,-0.5],[Pb,-0.5],'LineWidth',2);
    
  LP2=L-Pb;
    
    text(Pb+(LP2/3),-0.6,db2_label,'fontsize',12,'fontweight','bold');
    
end

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

imgname=strcat('level5b_',num2str(i),'.jpg');

saveas(b,imgname);

hold off

%End image

fprintf(comb5,'\n<!--question %d-->',i);
fprintf(comb5,'\n%s','<question type="cloze">');

fprintf(comb5,'\n%s','<name>');
fprintf(comb5,'\n<text>Combined %d Level 5</text>',i);
fprintf(comb5,'\n%s','</name>');

fprintf(comb5,'\n%s','<questiontext format="html">');
fprintf(comb5,'\n%s','<text>');
fprintf(comb5,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb5,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/combined5/level5a_%d.jpg"',i);
fprintf(comb5,'%s','alt="Beamplot" width="30 height="30"/></p>');

fprintf(comb5,'\n%s','<p style="text-align: left;">Consider a simply supported beam as shown above with length L.</p>');
fprintf(comb5,'\n%s','<p style="text-align: left;">There are two supports at either end of the beam,which generate reaction forces R1 and R2, at positions x=0 and x=L respectively.</p>');
fprintf(comb5,'\n%s','<p style="text-align: left;">There are two Uniformly Distributed Loads (UDLs) acting on the beam as shown in the diagram.</p>');
fprintf(comb5,'\n%s','<p style="text-align: left;">Below is the equivalent Free Body Diagram using only Point Loads.</p>');

fprintf(comb5,'\n%s','<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb5,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/combined5/level5b_%d.jpg"',i);
fprintf(comb5,'%s','alt="Beamplot" width="30 height="30"/></p>');


fprintf(comb5,'\n%s','<pstyle="text-align: left;" >Using the convention that upward forces and anti-clockwise moments are positive, and the information given:');
fprintf(comb5,'\n%s','<p>a) Calculate the reaction forces R1 and R2 to the nearest whole number.');

%Calculating reaction forces

R2=((W*P)+(W1*Pb))/L;

R1=W+W1-R2;

%Converting cm to m

Lm=L/100;
P1m=P1/100;
WRm=WR/100;
Pm=P/100;
Pbm=Pb/100;

%Other Calculations -Dr. Pilar Garcia Souto 

%==================


UDL = W1/WRm; % Value of the UDL in N/m

%Points of interest = PoI
PoI=[0,P1m,Pm,P1m+WRm,Lm];

%Shear force values
SFA=R1;
SFB=R1;
SFC= SFB - UDL*(Pm-P1m) -W;
SFD= -R2;
SFF=0;

%Location when SF=0, i.e. when the Bending Moment is at its maximum
Max_BM_position = -1;
SF_pre_drop = SFC - UDL*(Pm-P1m);
if(SFB>0 && SF_pre_drop<=0)
    %check the position at which crosses using equation of the line
    % y=R1 - UDL*x
    Max_BM_position = P1m+ R1/UDL;
    
elseif (SF_pre_drop>0 && SFC<=0)
    Max_BM_position =Pm;
elseif (SFC>0 && SFD<=0)
    %Check the position at which it crosses using equation of the line
    % y=SF(2) - UDL*x
    Max_BM_position = Pm+ SFC/UDL;
end

Max_BM_position_cm=Max_BM_position*100;

%Calculate the BM values at the points of interest
BMA=0;
BMB= abs(-R1*P1m);
BMC= abs(-R1*Pm +UDL*(Pm-P1m)*(Pm-P1m)/2);
BMD= R2*(Lm-P1m-WRm);
BMF=0;

%Calculate the Maximum BM, i.e. at position "Max_BM_position"
Max_BM=-1;
if(Pm>=Max_BM_position)
    Max_BM = abs(-R1*Max_BM_position +UDL*(Max_BM_position-P1m)*(Max_BM_position-P1m)/2);
else
    Max_BM = abs(-R1*Max_BM_position +UDL*(Max_BM_position-P1m)*(Max_BM_position-P1m)/2 + W*(Max_BM_position -Pm));
end

%Done
%Need to be careful with the number of decimals used and the error derived
%by using approximation numbers

fprintf(comb5,'\n%s','<p style="text-align: center;" >');
fprintf(comb5,'R1 = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R1);
fprintf(comb5,'\n%s','<p style="text-align: center;" >');
fprintf(comb5,'R2 = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',R2);

%Shear forces

fprintf(comb5,'\n%s','<p style="text-align: left;">b) Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values:</p>');
fprintf(comb5,'\n%s','<p style="text-align: left;">Shear Force just to the right of A i.e (x=0).</p>');
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFA);

fprintf(comb5,'\n<p style="text-align: left;">Shear Force just to the right of B i.e. (x=%d).</p>',P1);
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFB);

fprintf(comb5,'\n<p style="text-align: left;">Shear Force just to the right of C i.e. (x=%d).</p>',P);
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFC);

fprintf(comb5,'\n<p style="text-align: left;">Shear Force just to the right of D i.e. (x=%d).</p>',(P1+WR));
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',SFD);

fprintf(comb5,'\n<p style="text-align: left;">Shear Force just to the right of F i.e. (x=%d).</p>',L);
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',0);


fprintf(comb5,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the SFD</p>');
fprintf(comb5,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb5,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb5,'\n%s','<p>3) C and D {1:MULTICHOICE:=A vertical line and a slope.~A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

fprintf(comb5,'\n%s','<p>4) D and F {1:MULTICHOICE:Either a horizontal or vertical line.~=A combination of horizontal and vertical lines.~A line with a slope.~A curve}</p>');

%Calculating the bending moments

fprintf(comb5,'\n%s','<p style="text-align: left;">c) Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values:</p>');

fprintf(comb5,'\n%s','<p style="text-align: left;">Bending moment at A.</p>');
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMA);

fprintf(comb5,'\n%s','<p style="text-align: left;">Bending Moment at B.</p>');
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMB);

fprintf(comb5,'\n%s','<p style="text-align: left;">Bending Moment at C.</p>');
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMC);

fprintf(comb5,'\n%s','<p style="text-align: left;">Bending Moment at D.</p>');
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMD);

fprintf(comb5,'\n%s','<p style="text-align: left;">Bending Moment at F.</p>');
fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N.m</p>',BMF);

%Bending moment diagram indication

fprintf(comb5,'\n%s','<p style="text-align:left;">From the drop down menus below indicate how the indicated points are connected in the BMD</p>');

fprintf(comb5,'\n%s','<p>1) A and B {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

fprintf(comb5,'\n%s','<p>2) B and C {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~A line with a slope.~=A curve}</p>');

fprintf(comb5,'\n%s','<p>3) C and D {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A combination of a slope and a curve.~A line with a slope.~A curve}</p>');

fprintf(comb5,'\n%s','<p>4) D and F {1:MULTICHOICE:Either a horizontal or vertical line.~A combination of horizontal and vertical lines.~=A line with a slope.~A curve}</p>');

%Maximum bending moment position

fprintf(comb5,'\n%s','<p style="text-align:left;">d) Where does the maximum bending moment occur?</p>');

fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!The BMD is a maximum at the x intercept of the SFD.~*#Sorry. Try again.The BMD is a maximum at the x intercept of the SFD.} cm</p>',Max_BM_position_cm);

%Maximum bending Moment

fprintf(comb5,'\n%s','<p style="text-align:left;">d) What is the maximum bending moment?</p>');

fprintf(comb5,'\n%s','<p style="text-align: center;">');
fprintf(comb5,'{1:NUMERICAL:=%3.0f:1#Good job!The maximum bending moment is found by taking moments about the position where the SFD goes to 0.~*#Sorry. Try again.The maximum bending moment is found by taking moments about the position where the SFD goes to 0.} N.m</p>]]>',Max_BM);

fprintf(comb5,'\n%s','</text>');
fprintf(comb5,'\n%s','</questiontext>');



fprintf(comb5,'\n%s','<penalty>0</penalty>');
fprintf(comb5,'\n%s','<hidden>0</hidden>');





fprintf(comb5,'\n%s','</question>');
end 
fprintf(comb5,'\n%s','</quiz>');