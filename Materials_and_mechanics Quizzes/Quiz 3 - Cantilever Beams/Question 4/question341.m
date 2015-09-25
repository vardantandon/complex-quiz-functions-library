%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0

file=fopen('cantilever4-2.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:50 %Loop used to create multiple questions

ID=strcat(num2str(i));

IDString=strcat('Cantilever Beams. Level 4.Question ID 2 - #', ID);    

% Start Image

%Generates image for level 4 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 15/09/14
%version 1.0


l=randi([15,20]);
Le=l*10;

%Plotting the beam

x1=0;
x2=Le+Le/15;

%Ploting a vertical line

plot([Le/15,Le/15],[-1,-0.1],'Color','black','linewidth',5);

hold on

plot([Le/15,Le/15],[1,0.1],'Color','black','linewidth',5);

%Plotting a beam

rectangle('Position',[x1,-0.1,x2,0.2],'LineWidth',1.5);

%Axis restrictions and title

axis([-Le/4 x2+10 -1.8 1.75]);

title('Cantilever Beam','FontSize',20, 'FontWeight','bold');

text(Le-20, -2, strcat('Question ID 1 - #', ID),'fontsize',8,'fontweight','bold');

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
rectangle('Position',[Le-Le/20+5,1.5,Le/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

% text(a3-5,1.55,'Level 4','fontsize',14,'fontweight','bold'); %Level 4 label

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
plot([Position_E1,Position_E1],[0.1,-0.2],'Linestyle','--','linewidth',2,'Color','black');

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

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');


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

UDL5=U5/L; %Pilar comment: UDL5 is not being used in level 4.
UDL2=U2/(Pc-Pb);
UDL4=U4/(L-Pd); %Pilar: I changed "l" for "L"

%Reactions
R=round(U1+U2+U3+U4);

M=round(U1*Pb+U2*((Pc+Pb)/2)+U3*Pe+U4*((L+Pd)/2));

%Shear Force (given just to the right of each point)

SFA=R;
SFB=(R-U1);
SFC=(R-U1-U2);
SFD=(R-U1-U2);
SFE=(R-U1-U2-U3-(UDL4*(Pe-Pd)));
SFF=0;


%Plot equivalent free body diagram

figure(2)

%Ploting a vertical line
plot([Le/15,Le/15],[-1,-0.1],'Color','black','linewidth',5);

hold on

plot([Le/15,Le/15],[1,0.1],'Color','black','linewidth',5);

%Plotting a beam

rectangle('Position',[x1,-0.1,x2,0.2],'LineWidth',1.5);

%Axis restrictions and title

axis([-Le/4 x2+10 -1.8 1.75]);

title('Equivalent Free Body Diagram','FontSize',14, 'FontWeight','bold');

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

P1 = a1 + Le/5;
P2 = a1 + Le*2/5;
P3 = a1 + Le*3/5;
P4 = a1 + Le*4/5;

% ==========
% % Plotting arrow for U1
% ==========

arrow([P1,0.4],[P1,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load

U1_label=strcat(num2str(U1),'N');

text(P1-Le/30,0.5,U1_label,'fontsize',14,'fontweight','bold');

b1=a1; %Starting point of measured position
b2=P1; %End point of measured position

b3=(b1+b2)/2; %Midpoint

arrow([b3,-0.2],[b1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.2],[b2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

P1_label=strcat(num2str(Pb),'m');

b4=b1+(b1+b2)/6;

text(b4,-0.32,E1_label,'fontsize',14,'fontweight','bold');

plot([P1,P1],[0.1,-0.2],'Linestyle','--','linewidth',2,'Color','black');

% 

% ==========
% % Plotting arrow for U2
% ==========

arrow([P2,0.2],[P2,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load
plot([P2,P2],[0.4,0.1],'Linestyle','--','linewidth',2,'Color','black');

U2_label=strcat(num2str(U2),'N');

text(P2-Le/30,0.5,U2_label,'fontsize',14,'fontweight','bold');

b1=a1; %Starting point of measured position
b2=P2; %End point of measured position

b3=(b1+b2)/2; %Midpoint

arrow([b3,-0.5],[b1,-0.5],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.5],[b2,-0.5],'LineWidth',2); %Draws r.h.s. of arrow

P2_label=strcat(num2str((Pb+Pc)/2),'m');

b4=b1+(b1+b2)/3;

text(b4,-0.61,P2_label,'fontsize',14,'fontweight','bold');

plot([P2,P2],[0.1,-0.55],'Linestyle','--','linewidth',2,'Color','black');

% 
% 
% ==========
% % Plotting arrow for U3
% ==========

arrow([P3,0.4],[P3,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load

U3_label=strcat(num2str(U3),'N');

text(P3-Le/30,0.5,U3_label,'fontsize',14,'fontweight','bold');

b1=a1; %Starting point of measured position
b2=P3; %End point of measured position

b3=(b1+b2)/2; %Midpoint

arrow([b3,-0.8],[b1,-0.8],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.8],[b2,-0.8],'LineWidth',2); %Draws r.h.s. of arrow

P3_label=strcat(num2str(Pe),'m');

b4=b1+(b1+b2)/2;

text(b4,-0.92,P3_label,'fontsize',14,'fontweight','bold');

plot([P3,P3],[0.1,-0.8],'Linestyle','--','linewidth',2,'Color','black');

% ==========
% % Plotting arrow for U4
% ==========

arrow([P4,0.2],[P4,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load
plot([P4,P4],[0.4,0.1],'Linestyle','--','linewidth',2,'Color','black');

U4_label=strcat(num2str(U4),'N');

text(P4-Le/30,0.5,U4_label,'fontsize',14,'fontweight','bold');

b1=a1; %Starting point of measured position
b2=P4; %End point of measured position

b3=(b1+b2)/2; %Midpoint

arrow([b3,-1.1],[b1,-1.1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-1.1],[b2,-1.1],'LineWidth',2); %Draws r.h.s. of arrow

P4_label=strcat(num2str((Pd+L)/2),'m');

b4=b1+(b1+b2)*2/3;

text(b4,-1.21,P4_label,'fontsize',14,'fontweight','bold');

plot([P4,P4],[0.1,-1.1],'Linestyle','--','linewidth',2,'Color','black');

text(Le-20, -2, strcat('!!NB - Not to Scale!!'),'fontsize',8,'fontweight','bold');
%Plot string generation

plotString2 = generateImageString(gcf, 'image2');

hold off


figure(3)
% %Plotting the SFD

plot([0,Pb],[SFA,SFA],'Color','red','linewidth',3);

hold on


plot([Pb,Pb],[SFA,SFB],'Color','red','linewidth',3);
plot([Pb,Pc],[SFB,SFC],'Color','red','linewidth',3);
plot([Pc,Pd],[SFC,SFC],'Color','red','linewidth',3);
plot([Pd,Pe],[SFD,SFE+U3],'Color','red','linewidth',3);
plot([Pe,Pe],[SFE+U3,SFE],'Color','red','linewidth',3);
plot([Pe,L],[SFE,SFF],'Color','red','linewidth',3);

SFAB=SFA-(SFA-SFB)/4;
SFCD=SFC-(SFC-SFD)/4;

%Axes and titles

axis tight
grid on
% axis([0 L+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

%Bending moment

BMA=(-M);
BMB=(-M+R*Pb);
BMC=(-U3*(Pe-Pc)-U4*((L+Pd)/2-Pc));
BMD=(-U3*(Pe-Pd)-U4*((L-Pd)/2));
BME=(-UDL4*(((L-Pe)^2)/2));
BMF=0;

% Plotting BMD

plot([0,Pb],[-M,BMB],'linewidth',3,'Color','red');
hold on
plot([Pc,Pd],[BMC,BMD],'linewidth',3,'Color','red');

% Plotting first UDL

m1=(SFC-SFB)/(Pc-Pb);
c1=SFB-(m1*Pb);
X1=(Pb:0.01:Pc);

a1=BMB-(m1*Pb.^2/2+c1*Pb);

Y1=(m1.*(X1.^2)/2 + c1.*X1 +a1);

plot(X1,Y1,'linewidth',3,'Color','red');

% Plotting 2nd UDL (first half)

m2=(SFE+U3-SFD)/(Pe-Pd);
c2=SFD-(m2*Pd);
X2=(Pd:0.01:Pe);

a2=BMD-(m2*Pd.^2/2+c2*Pd);

Y2=(m2.*(X2.^2)/2 + c2.*X2 +a2);

plot(X2,Y2,'linewidth',3,'Color','red');

% Plotting 2nd UDL (second half)

m3=(SFF-SFE)/(L-Pe);
c3=SFE-(m3*Pe);
X3=(Pe:0.01:L);

a3=BME-(m3*Pe.^2/2+c3*Pe);

Y3=(m3.*(X3.^2)/2 + c3.*X3 +a3);

plot(X3,Y3,'linewidth',3,'Color','red');

%Axes and titles
axis tight
grid on
% axis([0 L_in_m -M 0]);

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending Moment (Nm)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString4 = generateImageString(gcf, 'image4');

%Embedded components string generation
    
    numString_r = cloze_numerical(round(R), 0.025*R, 'Good job!', 'Incorrect');
    numString_m = cloze_numerical(round(M), 0.025*M, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(round(SFA), 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(round(SFB), 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(round(SFC), 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD = cloze_numerical(round(SFD), 0.025*SFD, 'Good job!', 'Incorrect');
    numString_SFE = cloze_numerical(round(SFE), 0.025*SFE, 'Good job!', 'Incorrect');
    numString_SFF = cloze_numerical(round(SFF), 0.025*SFF, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines', 'Good Job!','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good Job!', 'A curve','Incorrect');
    numString_SFD_C_D = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good Job!','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_SFD_D_E = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Incorrect', 'A horizontal line and a line with a slope','Good Job!', 'A curve','Incorrect');
    numString_SFD_E_F = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect!','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good Job!', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(round(BMA), 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(round(BMB), 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(round(BMC), 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD= cloze_numerical(round(BMD), 0.025*BMD, 'Good job!', 'Incorrect');
    numString_BME= cloze_numerical(round(BME), 0.025*BME, 'Good job!', 'Incorrect');
    numString_BMF= cloze_numerical(round(BMF), 0.025*BMF, 'Good job!', 'Incorrect');   
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Good job!');
    numString_BMD_C_D = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good Job!', 'A curve' ,'Incorrect');
    numString_BMD_D_E = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Incorrect', 'A curve' ,'Good Job!');
    numString_BMD_E_F = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Incorrect', 'A curve' ,'Good Job!');

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a Cantilever beam as shown in the image above.</p>',...
    '<p>The wall generates a reaction force, R at positon A (x=0) and an anticlockwise moment, M.</p>', ...
    '<p>Using the convention that upward forces (vertical), forces to the right (horizontal), and anti-clockwise moments are positive, and the information given:</p>',...
    '<p><b>A)</b></p><p>Calculate the magnitude of the reaction force R and the moment M to the nearest whole number.',...
    '<p></p><p>R:&nbsp', numString_r,'N</p>', ...
    '<p>M:&nbsp', numString_m, 'Nm</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b></p><p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x=0cm (Point A):&nbsp', numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(Pb*100)),'cm (Point B):&nbsp', numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(Pc*100)),'cm (Point C):&nbsp', numString_SFC, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(Pd*100)),'cm (Point D):&nbsp', numString_SFD, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(Pe*100)),'cm (Point E):&nbsp', numString_SFE, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(L*100)),'cm (Point F):&nbsp', numString_SFF, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) A and B:</p><p>' , numString_SFD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_SFD_B_C, ...
    '<p>3) C and D:</p><p>' , numString_SFD_C_D, ...
    '<p>4) D and E:</p><p>' , numString_SFD_D_E, ...
    '<p>5) E and F:</p><p>' , numString_SFD_E_F, ...
    '<br><b>C)</b></p>Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at point A:&nbsp', numString_BMA, 'Nm</p>', ...
    '<p>Bending moment at point B:&nbsp', numString_BMB, 'Nm</p>', ...
    '<p>Bending moment at point C:&nbsp', numString_BMC, 'Nm</p>', ...
    '<p>Bending moment at point D:&nbsp', numString_BMD, 'Nm</p>', ...
    '<p>Bending moment at point E:&nbsp', numString_BME, 'Nm</p>', ...
    '<p>Bending moment at point F:&nbsp', numString_BMF, 'Nm</p>', ...
    '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) A and B:</p><p>' , numString_BMD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_BMD_B_C, ...
    '<p>3) C and D:</p><p>' , numString_BMD_C_D, ...
    '<p>4) D and E:</p><p>' , numString_BMD_D_E, ...
    '<p>5) E and F:</p><p>' , numString_BMD_E_F); ...

    AA=(Pb+Pc)/2;
    BB=(Pd+L)/2;

    generalfeedbackString=strcat('<p><b>PART A</b></p><p>Below is the equivalent free body diagram for this system.</p><p>!Note - for the sake of clarity distances are not to scale on this diagram!</p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
        '<p>Each UDL is simplified to being a point load of equivalent force, acting at the midpoint of the UDL.</p>',...
        '<p>For total forces to be balancd in the y direction:</p>', ...
        '<p>R - &nbsp',num2str(W3),' - &nbsp',num2str(W),' - &nbsp',num2str(W4),' - &nbsp',num2str(W2),'= 0</p>',...
        '<p>Therefore, R = &nbsp',num2str(R),'N.</p>',...
        '<p>The moment created by the wall must balance the moment created by the four point loads:</p>', ...
        '<p>M - (',num2str(Pb),'m x &nbsp',num2str(W3),'N) - (',num2str(round(AA*100)/100),'m x &nbsp',num2str(W),'N)  - (',num2str(round(Pe*100)/100),'m x &nbsp',num2str(W4),'N)  - (',num2str(round(BB*100)/100),'m x &nbsp',num2str(W2),'N)  = 0</p>', ...
        '<p>Therefore, M = &nbsp',num2str(M),'Nm.</p>',...
        '<p><b>PART B</b></p>In this case the SFD can be defined by the following co-ordinates:', ...    
        '<p>(0,',num2str(SFA),'), (',num2str(Pb),',',num2str(SFA),'), (',num2str(Pb),',',num2str(SFB),'), (',num2str(Pc),',',num2str(SFC),'), (',num2str(Pd),',',num2str(SFD),'), (',num2str(round(Pe*100)/100),',',num2str(round(SFE+U3)),'),  (',num2str(round(Pe*100)/100),',',num2str(round(SFE)),'),  (',num2str(L),', 0).</p>', ...
        '<p>The SFD diagram in this case therefore looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p></p><b>PART C</b><p>For cantilever beams, the beam is always ''hogging'', and therefore has a negative bending moment by convention.',...
        '<p>Therefore the BM at point A is &nbsp',num2str(round(BMA)),'Nm. (This is also the maximum BM in this case).</p>',...
        '<p>The BM at point B, considering forces to the left = &nbsp',num2str(BMA),'Nm + (',num2str(Pb),'m x &nbsp', num2str(R),'N) = &nbsp',num2str(round(BMB)),'Nm.',...
        '<p>The BM at point C, considering forces to the left = &nbsp',num2str(BMA),'Nm + (',num2str(Pc),'m x &nbsp', num2str(R),'N) - (',num2str(Pc-Pb),'m x &nbsp', num2str(W3),'N) - (',num2str((Pc-Pb)/2),'m x &nbsp', num2str(W),'N)  = &nbsp',num2str(round(BMC)),'Nm.',...
        '<p>The BM at point D, considering forces to the right = - (',num2str(round((Pe-Pd)*100)/100),'m x &nbsp', num2str(W4),'N) - (',num2str(BB-Pd),'m x &nbsp', num2str(W2),'N) = &nbsp',num2str(round(BMD)),'Nm.',...
        '<p>The BM at point E, considering forces to the right = - (',num2str(round(((L-Pe)/2)*100)/100),'m x &nbsp', num2str(round((L-Pe)/(L-Pd)*W2*100)/100),'N) = &nbsp',num2str(round(BME)),'Nm.',...
        '<p>The BM at point F is zero, are there are no forces to the right of point F to consider.</p>',...
        '<p>The BMD therefore looks like this in this case:</p>', ...
        '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">',...
        '<p>Remember, the BMD is also the integral of the SFD.</p>');

            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b><p>Remember to produce an equivalent free body diagram first, and then apply the following equations:</p><p>$$\\small\\sum$$ M<sub>z</sub>=0</p><p>$$\\small\\sum$$ F<sub>y</sub>=0</p><p>$$\\small\\sum$$ F<sub>x</sub>=0</p><p>When producing SFDs and BMDs for cantilever beams, neither plot will start at the origin, but both will end on the x-axis.</p><p>The bending moment can be calculated by adding all of the bending moments to the left or right of any discrete point along the beam.</p><p>A point force will produce a vertical line on a SFD.</p><p>A UDL will always produce a line with a slope an a SFD, and a curve on a BMD.</p>', ...
        '',...
        plotString1, ...
        plotString2, ...
        plotString3, ...
        plotString4);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
