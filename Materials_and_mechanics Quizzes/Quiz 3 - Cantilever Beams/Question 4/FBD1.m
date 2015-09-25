%Ploting a vertical line

a=plot([Le/15,Le/15],[-1,-0.1],'Color','black','linewidth',5);

hold on

plot([Le/15,Le/15],[1,0.1],'Color','black','linewidth',5);

%Plotting a beam

rectangle('Position',[x1,-0.1,x2,0.2],'LineWidth',1.5);

%Axis restrictions and title

axis([-Le/4 x2+10 -1.8 1.75]);

title('Free Body Diagram','FontSize',14, 'FontWeight','bold');

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

arrow([P2,0.4],[P2,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load

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

arrow([P4,0.4],[P4,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load

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

hold off


