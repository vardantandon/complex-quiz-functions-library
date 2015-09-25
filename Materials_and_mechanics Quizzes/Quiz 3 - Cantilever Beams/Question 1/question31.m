%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0

file=fopen('cantilever1.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions

ID=strcat(num2str(i));

IDString=strcat('Cantilever Beams. Level 1.Question ID #', ID);    

% Start Image

%Generates image for level 1 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 15/09/14
%version 1.0
%version 2.0. Modifications done by Pilar Garcia Souto (1) the SF should
%start at the value R, instead o. Needed to modify the graph.

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

title('Cantilever Beam','FontSize',20, 'FontWeight','bold');

text(L-20, -1.7, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

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

arrow([a3,-1],[a1,-1],'LineWidth',2); %Draws l.h.s. of arrow
arrow([a3,-1],[a2,-1],'LineWidth',2); %Draws r.h.s. of arrow

plot([a2,a2],[-0.1,-1],'LineStyle','--','LineWidth',2,'Color','black');

L_in_m=L/100; %length in meters

Length_label=strcat(num2str(L_in_m),'m');

a4=a1+(a1+a2)/3;

text(a4,-1.1,Length_label,'fontsize',14,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-3*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

% text(a3-14,1.55,'Level 1','fontsize',14,'fontweight','bold'); %Level 1 label

%Showing x direction

arrow([0,-1.5],[L/5,-1.5],'linewidth',2);

text(L/5+L/40,-1.5,'x','Fontsize',14,'fontweight','bold');

%Indicating x=0 position

arrow([L/15,1.3],[L/15,1.05],'LineWidth',2) 

text(L/15-L/30,1.35,'x=0','Fontsize',12,'fontweight','bold');

%Plotting point load

p=randi([4,l-3]);
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

%Indicating positions A, B and C

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2+4,0.2,'B','fontsize',14,'fontweight','bold');
text(a2,0.2,'C','fontsize',14,'fontweight','bold');

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%Plotting the SFD

R=W;

%By taking moments about A

M=(W*P_in_m);

%SF=plot([0,0],[0,R],'linewidth',3,'Color','red'); %commented by Pilar as the SF should start directly at R
%hold on %commented by Pilar

SF= plot([0,P_in_m],[R,R],'linewidth',2,'Color','red');

hold on

grid on

plot([P_in_m,P_in_m],[R,0],'linewidth',2,'Color','red');

plot([P_in_m,L_in_m],[0,0],'linewidth',2,'Color','red');

%Axes and titles

axis tight

% axis([0 L_in_m+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');


hold off

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');


%Plotting the bending moment diagram

BM=plot([0,P_in_m],[-M,0],'linewidth',2,'Color','red');

hold on

plot([P_in_m,L_in_m],[0,0],'linewidth',2,'Color','red');

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

%End image


%Calculating the bending moments
%Calculating shear force

SFA=round(R);
SFB=0;
SFC=0;

BMA=round(-M);
BMB=0;
BMC=0;

%Embedded components string generation
    
    numString_r = cloze_numerical(R, 0.025*R, 'Good job!', 'Incorrect');
    numString_m = cloze_numerical(M, 0.025*M, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(SFA, 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(SFB, 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(SFC, 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines', 'Good Job!','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good Job!','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(BMA, 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(BMB, 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(BMC, 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line','Good Job!', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Incorrect');
   
%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a cantilever beam as shown above with length L.</p>',...
    '<p>The wall generates a support, R, at positon A (x=0) and an anticlockwise moment, M.</p>',...
    '<p>There is a single external point force acting on the beam at position B as shown in the diagram.</p>',...
    '<p>Using the convention that upward forces and anti-clockwise moments are positive, and the information given:',...
    '<p><b>A)</b><p>Calculate the magnitude of the reaction force R and the moment M to the nearest whole number.',...
    '<p></p><p>R:&nbsp', numString_r,'N</p>', ...
    '<p>M:&nbsp', numString_m, 'Nm</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b><p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x=0cm (point A):&nbsp', numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(P),'cm (point B):&nbsp', numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(L),'cm (point C):&nbsp', numString_SFC, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) A and B:</p><p>' , numString_SFD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_SFD_B_C, ...
    '<br><b>C)</b><p>Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at point A:&nbsp', numString_BMA, 'Nm</p>', ...
    '<p>Bending moment at point B:&nbsp', numString_BMB, 'Nm</p>', ...
    '<p>Bending moment at point C:&nbsp', numString_BMC, 'Nm</p>', ...
    '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) A and B:</p><p>' , numString_BMD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_BMD_B_C); ...

    generalfeedbackString=strcat('<p><b>PART A</b></p><p>For total forces to be balancd in the y direction, R is simply the inverse of the point force:</p>', ...
        '<p>R - &nbsp',num2str(W),' = 0</p>',...
        '<p>Therefore, R = &nbsp',num2str(W),'N.</p>',...
        '<p>The moment created by the wall must balance the moment created by the point force:</p>', ...
        '<p>M - (',num2str(P/100),'m x &nbsp',num2str(W),'N) = 0</p>', ...
        '<p>Therefore, M = &nbsp',num2str(M),'Nm.</p>',...
        '<p><b>PART B</b></p>In this case the SFD can be defined by the following co-ordinates:', ...
        '<p>(0,',num2str(SFA),'), (',num2str(P/100),',',num2str(SFA),'), (',num2str(P/100),',',num2str(0),'), (',num2str(L/100),',',num2str(0),').</p>', ...
        '<p>The SFD diagram in this case therefore looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p></p><p><b>PART C</b></p><p>For cantilever beams, the beam is always ''hogging'', and therefore has a negative bending moment by convention.',...
        '<p>Therefore the BM at point A is&nbsp',num2str(BMA),'Nm. (This is also the maximum bending moment).',...
        '<p>As there are no forces to consider to the right of point B, the bending moments at point B and to the right of point B are all zero.</p>', ...
        '<p>Alternatively, considering forces to the left of point B, the BM at this point = &nbsp-',num2str(M),'Nm + (', num2str(P/100),'m x&nbsp', num2str(R),'N) = &nbsp',num2str(BMB),'Nm.',...
        '<p>Also, considering forces to the left of point C, the BM at this point = &nbsp-',num2str(M),'Nm + (', num2str(L/100),'m x&nbsp', num2str(R),'N) - (', num2str(L/100-P/100),'m x&nbsp', num2str(W),'N)= &nbsp',num2str(BMC),'Nm.',...
        '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">', ...
        '<p>Remember, the BMD is also the integral of the SFD.</p>'); ...

       
            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b><p>Remember for a system to be in equlibirium the following conditions must be satisfied:</p><p>$$\\small\\sum$$ M<sub>z</sub>=0</p><p>$$\\small\\sum$$ F<sub>y</sub>=0</p><p>$$\\small\\sum$$ F<sub>x</sub>=0</p><p>When producing SFDs and BMDs for cantilever beams, neither plot will start at the origin, but both will end on the x-axis.</p>', ...
        '',...
        plotString1, ...
        '', ...
        plotString3, ...
        plotString4);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);

