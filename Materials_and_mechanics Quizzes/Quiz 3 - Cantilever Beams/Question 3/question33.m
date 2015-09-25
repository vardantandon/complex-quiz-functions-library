%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0

file=fopen('cantilever3.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions

ID=strcat(num2str(i));

IDString=strcat('Cantilever Beams. Level 3.Question ID #', ID);    

        
% Start Image

%Generates image for level 3 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 15/09/14
%version 1.0
%version 2.0 --> Modified by Pilar Garcia Souto as (1) the SF should start
%at value R instead at zero in the feedback; (2) the answer to first
%multiple choice for SF should be "Either a horizontal or vertical line".


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

% text(a3-5,1.55,'Level 3','fontsize',14,'fontweight','bold'); %Level 3 label

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

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2-5,0.4,'B','fontsize',14,'fontweight','bold');
text(b2_2,0.4,'C','fontsize',14,'fontweight','bold');
text(a2,0.2,'D','fontsize',14,'fontweight','bold');

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%Plotting the equivalent free body diagram

%Plotting the beam
figure(2)
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

arrow([Position,0.2],[Position,0.1],'LineWidth',3)
plot([Position,Position],[0.75,0.1],'linestyle','--','color','black')

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

hold off

%Plot string generation
plotString2 = generateImageString(gcf, 'image2');

%Plotting the SFD

R=round(W);

%By taking moments about A

M=round((E1_in_m+E2_in_m)*W/2);

SFA=R;
SFB=R;
SFC=0;
SFD=0;


% SF=plot([0,0],[0,R],'linewidth',4,'Color','red'); %commented by Pilar  as this line should not be there
% hold on %commented by Pilar as this line should not be there

SF=plot([0,E1_in_m],[R,R],'linewidth',3,'Color','red');
hold on
plot([E1_in_m,E2_in_m],[R,0],'linewidth',3,'Color','red');
plot([E2_in_m,L_in_m],[0,0],'linewidth',3,'Color','red');

%Axes and titles
axis tight 
grid on

% axis([0 L_in_m+0.1 0 R+R/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

%Plotting the bending moment diagram

BMA=round(-M);
BMB=round(-(abs(M-R*E1_in_m)));
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
    
    numString_r = cloze_numerical(R, 0.025*R, 'Good job!', 'Incorrect');
    numString_m = cloze_numerical(M, 0.025*M, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(SFA, 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(SFB, 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(SFC, 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD = cloze_numerical(SFD, 0.025*SFD, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good Job!','A combination of horizontal and vertical lines', 'Incorrect','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good Job!', 'A curve','Incorrect');
    numString_SFD_C_D = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good Job!','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(BMA, 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(BMB, 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(BMC, 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD= cloze_numerical(BMD, 0.025*BMD, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Good job!');
    numString_BMD_C_D = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good Job!', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Incorrect', 'A curve' ,'Incorrect');

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a Cantilever beam as shown in the image above.</p>',...
    '<p>The wall generates a reaction force, R at positon A (x=0) and an anticlockwise moment, M.</p>', ...
    '<p>There is a single uniformly distributed load acting between positions B and C as shown.</p>',...
    '<p>Using the convention that upward forces (vertical), forces to the right (horizontal), and anti-clockwise moments are positive, and the information given:</p>',...
    '<p><b>A)</b></p><p>Calculate the magnitude of the reaction force R and the moment M to the nearest whole number.',...
    '<p></p><p>R:&nbsp', numString_r,'N</p>', ...
    '<p>M:&nbsp', numString_m, 'Nm</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b></p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x=0cm (Point A):&nbsp', numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(Position_E1-a1)),'cm (Point B):&nbsp', numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(round(Position_E2-a1)),'cm (Point C):&nbsp', numString_SFC, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(L),'cm (Point D):&nbsp', numString_SFD, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) A and B:</p><p>' , numString_SFD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_SFD_B_C, ...
    '<p>3) C and D:</p><p>' , numString_SFD_C_D, ...
    '<br><b>C)</b></p><p>Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at point A:&nbsp', numString_BMA, 'Nm</p>', ...
    '<p>Bending moment at point B:&nbsp', numString_BMB, 'Nm</p>', ...
    '<p>Bending moment at point C:&nbsp', numString_BMC, 'Nm</p>', ...
    '<p>Bending moment at point D:&nbsp', numString_BMC, 'Nm</p>', ...
     '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) A and B:</p><p>' , numString_BMD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_BMD_B_C, ...
    '<p>2) C and D:</p><p>' , numString_BMD_C_D); ...

    generalfeedbackString=strcat('<p><b>PART A</b></p><p>Below is the equivalent free body diagram for this system:</p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
        '<p>The UDL is simplified to being a point load of equivalent force, acting at the midpoint of the UDL.</p>',...
        '<p>For total forces to be balancd in the y direction, R is simply the inverse of the point load:</p>', ...
        '<p>R - &nbsp',num2str(W),' = 0</p>',...
        '<p>Therefore, R = &nbsp',num2str(R),'N.</p>',...
        '<p>The moment created by the wall must balance the moment created by the point load:</p>', ...
        '<p>M - (',num2str(P/100),'m x &nbsp',num2str(W),'N) = 0</p>', ...
        '<p>Therefore, M = &nbsp',num2str(M),'Nm.</p>',...
        '<p><b>PART B</b></p>In this case the SFD can be defined by the following co-ordinates:', ...
        '<p>(0,',num2str(SFA),'), (',num2str(round(Position_E1-a1)/100),',',num2str(SFB),'), (',num2str(round(Position_E2-a1)/100),',',num2str(SFC),'), (',num2str(L/100),',',num2str(SFD),').</p>', ...
        '<p>The SFD diagram in this case therefore looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p></p><b>PART C</b><p>For cantilever beams, the beam is always ''hogging'', and therefore has a negative bending moment by convention.',...
        '<p>Therefore the BM at point A is &nbsp',num2str(BMA),'Nm. (This is also the maximum BM in this case).',...
        '<p>At point B, considering forces to the right, the bending moment = &nbsp',num2str(BMA),'Nm + (',num2str(round(Position_E1-a1)/100),'m x &nbsp', num2str(R),'N) = &nbsp',num2str(BMB),'Nm.',... 
        '<p>(As there are no forces to consider to the right of point C, the bending moments at point C and to the right of point C are all zero.)</p>', ...
        '<p>The BMD then forms a curve to join the x-axis. Therefore the BMD looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">', ...
        '<p>Remember, the BMD is also the integral of the SFD.</p>'); ...

       
            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b><p>Remember to produce an equivalent free body diagram first, and then apply the following equations:</p><p>$$\\small\\sum$$ M<sub>z</sub>=0</p><p>$$\\small\\sum$$ F<sub>y</sub>=0</p><p>$$\\small\\sum$$ F<sub>x</sub>=0</p><p>When producing SFDs and BMDs for cantilever beams, neither plot will start at the origin, but both will end on the x-axis.</p><p>The bending moment can be calculated by adding all of the bending moments to the left or right of any discrete point along the beam.</p><p>A UDL will always produce a curve on a BMD.</p>', ...
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
