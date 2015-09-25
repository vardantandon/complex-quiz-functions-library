 % START IMAGE
    
% Generates image for level 2 Simple Truss problems
% question name - Simple Trusses practice
% Created by Azalea Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% Modified by Pilar - 10th March 2015
% UCL Department: Medical Physics and Bioengineering
% Date:29/1/15

for i = 1:1:1 %Loop used to create multiple questions

%  Assigning values to the variables

angle1=10+randi([1 100]);
angle2=90-angle1;
F=50+randi([1 100]); 

% CALCULATIONS

% from trigonometry
Ah = 1./tand(angle1);
hC = 1./tand(angle2);
% taking moments 
Rc = (F.*Ah)./(Ah+hC);
Ra = F-Rc;
% forces
F1 = -F/((sind(angle2)./tand(angle1))+cosd(angle2));
F2 = F1*(sind(angle2)./sind(angle1));
F3 = -F1*cosd(angle1);


title('Warren Truss','FontSize',20, 'FontWeight','bold');

hold on
text(2.08, -0.5, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

ID=strcat(num2str(i));

IDString=strcat('Warren Truss. Level 1.Question ID #', ID);  


% drawing the truss triangle
x = [0 1.5 2];
y = [0 1 0];
T = plot (x,y,'-o', 'Linewidth', 2, 'color', 'black');
line ([0 2], [0 0],'Linewidth', 2, 'color', 'black')
text (-0.18,0, 'A', 'fontsize', 20)
text (1.6,1.05, 'B', 'fontsize', 20)
text (2.08,0, 'C', 'fontsize', 20)
text (0.25,0.1, '\theta','fontsize', 20,'FontWeight','bold');
text (1.78,0.13, '\phi', 'fontsize', 20, 'FontWeight','bold');
title('Warren Truss','FontSize',20, 'FontWeight','bold')

%Indicating level (c = x start location, d= diameter, e= y plane location)
c=-0.5; 
d=0.15;
e=1.5;
rectangle('Position',[c,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
text (c+0.1, e-d/2 ,'Level 1','FontWeight', 'bold', 'fontsize',15)
text (1.38, 1.3, '\downarrow','color', 'red', 'fontsize',50)
    
text (1.3,1.5, strcat('F = ',num2str(F),' N'), 'fontsize', 18)


% Plotting the left support

x = [-0.08 0 0.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([-0.15 0.15], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')

% Plotting the right support

x = [1.92 2 2.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([1.92 2.08], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')
line ([1.80 2.20], [-0.25 -0.25],'Linewidth', 1.5, 'color', 'black')
rectangle('Position',[1.91,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[2.04,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);

% Axes requirements
axis ([-0.5 2.5 -0.4 1.8])

axis off

hold off

daspect ([1,1,1])
  
% 
% 
%     % END IMAGE

end