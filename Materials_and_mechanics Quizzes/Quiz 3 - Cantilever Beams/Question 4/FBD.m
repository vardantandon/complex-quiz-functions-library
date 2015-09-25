
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


%Plotting 1st distributed load

e1=randi([2,round(l/4)]);
E1=e1*10; 
yr=0.12;
hr=0.2;

Position_E1=a1+E1; %Position of ist end of distributed load

length_load=randi([4,round(l/4)]);
Length_Load=length_load*10;

Mid_UDL_1=Position_E1+0.5*(Length_Load); %mid point of UDL

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

Mid_UDL_2=Position_E3+0.5*(Length_Load_2); %mid-point UDL 2

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

% plot([Position_E2,Position_E2],[0.1,-0.5],'Linestyle','--','linewidth',2,'Color','black');

b1_2=a1; %Starting point of measured position
b2_2=Position_E2; %End point of measured position

b3_2=b1_2+(b1_2+b2_2)/2; %Midpoint 

arrow([b3_2,-0.5],[b1_2,-0.5],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3_2,-0.5],[b2_2,-0.5],'LineWidth',2); %Draws r.h.s. of arrow

E2_in_m=(E1+Length_Load)/100; %Measured position of second load in m 

% E2_label=strcat(num2str(E2_in_m),'m');

b4_2=b1_2+(b1_2+b2_2)/3;

text(b4_2,-0.6,E2_label,'fontsize',14,'fontweight','bold');

%Indication of positions of ends of the 2nd distibuted load w.r.t. x=0

%For E3

% plot([Position_E3,Position_E3],[0.1,-0.8],'Linestyle','--','linewidth',2,'Color','black');

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

arrow([Position_E1,0.4],[Position_E1,0.1],'LineWidth',2); %plots a point load at the start of the ist distributed load

%2nd point load

Position2=Position_E3+(Length_Load_2)/3; %2nd point load at midpoint of 2nd udl

arrow([Position2,0.8],[Position2,0.1],'LineWidth',2);

plot([Position2,Position2],[0.1,-1.1],'Linestyle','--','linewidth',2,'Color','black');

arrow([d3_2,-1.1],[d1_2,-1.1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([b3_2,-1.1],[Position2,-1.1],'LineWidth',2); %Draws r.h.s. of arrow

P2_in_m=(Position2-a1)/100; %Measured position of second load in m 

P2_label=strcat(num2str(P2_in_m),'m');

d4_2=d1_2+(d1_2+d2_2)/3;

text(d4_2,-1.2,P2_label,'fontsize',14,'fontweight','bold');

%point load weights
% 
% w3=randi([10,20]);
% 
% w4=randi([10,20]);
% 
% W3=w3*10;
% 
% W4=w4*10;

U1_label=strcat(num2str(U1),'N');
U2_label=strcat(num2str(U2),'N');

text(Position_E1-Le/30,0.5,U1_label,'fontsize',14,'fontweight','bold');
text(Position2-Le/30,0.9,U2_label,'fontsize',14,'fontweight','bold');


hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');