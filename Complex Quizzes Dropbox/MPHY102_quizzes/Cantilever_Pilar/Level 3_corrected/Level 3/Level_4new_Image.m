%Generates image for level 3 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 17/09/14
%version 1.0

l=randi([15,20]);
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

axis([-L/4 x2+10 -1.8 1.75]);

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

plot([a2,a2],[-0.1,-1.5],'Linestyle','--','linewidth',2,'Color','black');

arrow([a3,-1.5],[a1,-1.5],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1.5],[a2,-1.5],'LineWidth',2); %Draws r.h.s. of arrow

L_in_m=L/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.6,Length_label,'fontsize',14,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

text(a3-5,1.55,'Level 3','fontsize',14,'fontweight','bold'); %Level 3 label

%Showing x direction

arrow([0,-1.75],[L/5,-1.75],'linewidth',2);

text(L/5+L/40,-1.75,'x','Fontsize',14,'fontweight','bold');

%Indicating x=0 position

arrow([L/15,1.3],[L/15,1.05],'LineWidth',2) 

text(L/15-L/30,1.35,'x=0','Fontsize',12,'fontweight','bold');

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

length_load_2=randi([4,round(l/4)]);
Length_Load_2=length_load*10;

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

plot([L/15,L/15],[-1,-1.5],'Linestyle','--','linewidth',2,'Color','black');
plot([Position_E4,Position_E4],[0.1,-1.1],'Linestyle','--','linewidth',2,'Color','black');

d1_2=a1; %Starting point of measured position
d2_2=Position_E4; %End point of measured position

d3_2=(d1_2+d2_2)/2; %Midpoint 

arrow([d3_2,-1.1],[d1_2,-1.1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3_2,-1.1],[d2_2,-1.1],'LineWidth',2); %Draws r.h.s. of arrow

E4_in_m=(E3+Length_Load_2)/100; %Measured position of second load in m 

E4_label=strcat(num2str(E4_in_m),'m');

d4_2=d1_2+(d1_2+d2_2)/3;

text(d4_2,-1.2,E4_label,'fontsize',14,'fontweight','bold');

%Plotting positions A, B, C, D, E and F

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2-5,0.4,'B','fontsize',14,'fontweight','bold');
text(b2_2,0.4,'C','fontsize',14,'fontweight','bold');
text(d2-5,0.4,'D','fontsize',14,'fontweight','bold');
text(d2_2,0.4,'E','fontsize',14,'fontweight','bold');
text(a2,0.2,'F','fontsize',14,'fontweight','bold');

imgname=strcat('level3a','.jpg');

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

a3=(a1+a2)/2; %Midpoint of measured beam

plot([a2,a2],[-0.1,-1],'Linestyle','--','linewidth',2,'Color','black');

arrow([a3,-1],[a1,-1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1],[a2,-1],'LineWidth',2); %Draws r.h.s. of arrow

L_in_m=L/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.1,Length_label,'fontsize',14,'fontweight','bold');

%Plotting  1st equivalent point load

Position=(Position_E1+Position_E2)/2; %Position of point load

P=Position-a1; %measured position of point load

P_in_m=P/100; %measured position in m

arrow([Position,0.75],[Position,0.1],'LineWidth',3)

text(Position-L/30,0.85,Weight_label,'fontsize',14,'fontweight','bold') %labelling weight of the point load

%Plotting 2nd equivalent point load

Position2=(Position_E3+Position_E4)/2; %Position of point load

P2=Position2-a1; %measured position of point load

P2_in_m=P2/100; %measured position in m

arrow([Position2,0.75],[Position2,0.1],'LineWidth',3)

text(Position2-L/30,0.85,Weight_label_2,'fontsize',14,'fontweight','bold') %labelling weight of the point load

%Indicating distance of  1st point load from position x=0

c1=a1; %Starting point of measured position
c2=Position; %End point of measured position

c3=c1+(c1+c2)/2; %Midpoint 

arrow([c3,-0.2],[c1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([c3,-0.2],[c2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

Position_label=strcat(num2str(P_in_m),'m');

c4=c1+(c1+c2)/4;

text(c4,-0.3,Position_label,'fontsize',14,'fontweight','bold');

%Indicating distance of 2nd point load from position x=0

f1=a1; %Starting point of measured position
f2=Position2; %End point of measured position

f3=f1+(f1+f2)/2; %Midpoint 

plot([f2,f2],[-0.1,-0.5],'Linestyle','--','linewidth',2,'Color','black');

arrow([f3,-0.5],[f1,-0.5],'LineWidth',2); %Draws l.h.s. of arrow
arrow([f3,-0.5],[f2,-0.5],'LineWidth',2); %Draws r.h.s. of arrow

Position2_label=strcat(num2str(P2_in_m),'m');

f4=f1+(f1+f2)/4;

text(f4,-0.6,Position2_label,'fontsize',14,'fontweight','bold');

imgname2=strcat('level3b','.jpg');

saveas(b,imgname2);

hold off

%Plotting the SFD

R=W+W2;

%By taking moments about A

M=(E1_in_m+E2_in_m)*W/2+(E3_in_m+E4_in_m)*W2/2;

SFA=R;
SFB=R;
SFC=R-W;
SFD=SFC;
SFE=0;
SFF=0;

SF=plot([0,0],[0,R],'linewidth',4,'Color','red');

hold on

plot([0,E1_in_m],[R,R],'linewidth',3,'Color','red');
plot([E1_in_m,E2_in_m],[R,SFC],'linewidth',3,'Color','red');
plot([E2_in_m,E3_in_m],[SFC,SFD],'linewidth',3,'Color','red');
plot([E3_in_m,E4_in_m],[SFD,SFE],'linewidth',3,'Color','red');
plot([E4_in_m,L_in_m],[0,0],'linewidth',3,'Color','red');

%Axes and titles

axis([0 L_in_m+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

shearforce=strcat('shearforce_level3','.jpg');

saveas(SF,shearforce);

hold off

%Plotting the bending moment diagram

BMA=-M;
BMB=-W*(E2_in_m-E1_in_m)/2-W2*((E3_in_m+E4_in_m)/2-E1_in_m);
BMC=-W2*((E3_in_m+E4_in_m)/2-E2_in_m);
BMD=-W2*(E4_in_m-E3_in_m)/2;
BME=0;
BMF=0;

%1st segment

BM=plot([0,E1_in_m],[BMA,BMB],'linewidth',3,'Color','red');

hold on

%2nd segment

mbc=(SFC-SFB)/(E2_in_m-E1_in_m);
cbc=-1*(mbc*E2_in_m);

xbc=(E1_in_m:0.01:E2_in_m);

%When x=E1, y=BMB
abc=BMB-(mbc*E1_in_m^2/2+cbc*E1_in_m);

ybc=mbc.*(xbc.^2)/2 + cbc.*xbc +abc;

plot(xbc,ybc,'linewidth',3,'Color','red');

%3rd segment

plot([E2_in_m,E3_in_m],[BMC,BMD],'linewidth',3,'Color','red');

%4th segment

mde=(SFE-SFD)/(E4_in_m-E3_in_m);
cde=-1*(mde*E4_in_m);

xde=(E3_in_m:0.01:E4_in_m);

%When x=E3, y=BMD
ade=BMD-(mde*E3_in_m^2/2+cde*E3_in_m);

yde=mde.*(xde.^2)/2 + cde.*xde +ade;

plot(xde,yde,'linewidth',3,'Color','red');

%5th segment

plot([E4_in_m,L_in_m],[BME,BMF],'linewidth',3,'Color','red');

%Axes and titles

axis([0 L_in_m -M 0]);

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending Moment (N.m)','Fontsize',12,'FontWeight','bold');

xlabel('Displacement (m)','Fontsize',12,'FontWeight','bold');

bendingmoment=strcat('bendingmoment_level1','.jpg');

saveas(BM,bendingmoment);

hold off







