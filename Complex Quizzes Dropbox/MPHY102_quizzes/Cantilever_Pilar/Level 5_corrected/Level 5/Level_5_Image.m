%Generates image for level 5 cantilever beam problems
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

axis([-L/5 x2+L/3 -1.8 1.75]);

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

arrow([L/30,-1.3],[L/30,-0.15],'LineWidth',2) %vertical reaction force at boundary

text(L/15-3,-1.25,'Ry','Fontsize',14,'FontWeight','bold') %Label vertical reaction force at boundary

arrow([L/30,-1.4],[-L/5,-1.4],'LineWidth',2) %horizontal reaction force at boundary

text(L/15-15,-1.6,'Rx','Fontsize',14,'FontWeight','bold') %Label vertical reaction force at boundary

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
rectangle('Position',[L-2*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');

text(a3-5,1.55,'Level 5','fontsize',14,'fontweight','bold'); %Level 4 label

%Showing x direction

arrow([0,-1.75],[L/5,-1.75],'linewidth',2);

text(L/5+L/40,-1.8,'x','Fontsize',14,'fontweight','bold');

%Indicating x=0 position

arrow([L/15,1.3],[L/15,1.05],'LineWidth',2) 

text(L/15-L/30,1.35,'x=0','Fontsize',12,'fontweight','bold');

%Plotting point load

p=randi([4,l-1]);
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

%Plotting angled point load

arrow([a2,0],[a2+L/5,-0.5],'LineWidth',3);

%Weight

w2=randi([10,20]);
W2=w2*10;
Weight_label_2=strcat(num2str(W2),'N');

text((a2+L/5)-L/30,-0.6,Weight_label_2,'fontsize',14,'fontweight','bold') %labelling weight of the load

%Indicating angle to the horizontal

plot([a2,a2+L/3],[0,0],'Linestyle','--','linewidth',2,'Color','black');

theta=randi([3,8]);
Theta=theta*10;

angle_label=strcat(num2str(Theta),'\circ');

text(a2+L/5,-0.2,angle_label,'fontsize',14,'fontweight','bold'); %labelling angle

%Plotting positions A, B, and C

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2+4,0.2,'B','fontsize',14,'fontweight','bold');
text(a2,0.2,'C','fontsize',14,'fontweight','bold');

imgname=strcat('level5a','.jpg');

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

axis([-L/5 x2+L/3 -1.8 1.75]);

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

arrow([L/30,-1.3],[L/30,-0.15],'LineWidth',2) %vertical reaction force at boundary

text(L/15-3,-1.25,'Ry','Fontsize',14,'FontWeight','bold') %Label vertical reaction force at boundary

arrow([L/30,-1.4],[-L/5,-1.4],'LineWidth',2) %horizontal reaction force at boundary

text(L/15-15,-1.6,'Rx','Fontsize',14,'FontWeight','bold') %Label vertical reaction force at boundary

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

%Plotting point load

arrow([Position,0.75],[Position,0.1],'LineWidth',3)

%Weight

text(Position-L/30,0.85,Weight_label,'fontsize',14,'fontweight','bold') %labelling weight of the pont load

%Indicating distance of point load from position x=0

arrow([b3,-0.2],[b1,-0.2],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3,-0.2],[b2,-0.2],'LineWidth',2); %Draws r.h.s. of arrow

text(b4,-0.3,Position_label,'fontsize',14,'fontweight','bold');

%Plotting equivalent forces for angled loads

%Vertical component

arrow([a2,0.85],[a2,0.2],'LineWidth',3);

Vertical=W2*sin(Theta);

Vertical_abs=round(abs(Vertical));

Vertical_label=strcat(num2str(Vertical_abs),'N');

text(a2-L/30,0.95,Vertical_label,'fontsize',14,'fontweight','bold');

%Horizontal component

arrow([a2+5,0],[a2+L/5,0],'LineWidth',3);

Horizontal=W2*cos(Theta);

Horizontal_abs=round(abs(Horizontal));

Horizontal_label=strcat(num2str(Horizontal_abs),'N');

text(a2+L/5-L/30,-0.2,Horizontal_label,'fontsize',14,'fontweight','bold');

hold off







