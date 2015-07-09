%Generates image for level 3 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 17/09/14
%version 1.0

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

imgname2=strcat('level3b','.jpg');

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

SF=plot([0,0],[0,R],'linewidth',4,'Color','red');

hold on

plot([0,E1_in_m],[R,R],'linewidth',3,'Color','red');
plot([E1_in_m,E2_in_m],[R,0],'linewidth',3,'Color','red');
plot([E2_in_m,L_in_m],[0,0],'linewidth',3,'Color','red');

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

bendingmoment=strcat('bendingmoment_level3','.jpg');

saveas(BM,bendingmoment);

hold off







