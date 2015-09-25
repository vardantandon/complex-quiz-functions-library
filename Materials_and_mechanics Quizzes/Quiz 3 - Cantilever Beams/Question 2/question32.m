%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Cantilver level 2
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: 18/09/14
%version 1.0

file=fopen('cantilever2.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions

ID=strcat(num2str(i));

IDString=strcat('Cantilever Beams. Level 2.Question ID #', ID);    

    
% Start Image

%Generates image for level 2 cantilever beam problems
%Created by Stecia-Marie Fletcher for the continuation of the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto for the purposes of the module, Mechanics and Materials
%UCL Department: Medical Physics and Bioengineering
%Date: 15/09/14
%version 1.0
%Modified by Pilar Garcia Souto, (1) as the inclined force at the end of the
%beam was not properly separated into components (matlab assumes angle in
%radiands while Stecia used it in degrees); (2) The SF diagram should start
%at R instead at zero, so image had to be modified.

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
rectangle('Position',[L-3*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.5,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

% text(a3-5,1.55,'Level 2','fontsize',14,'fontweight','bold'); %Level 2 label

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


Theta=10*randi([3,8]);
Theta_rad = Theta * pi /180;

angle_label=strcat(num2str(Theta),'\circ');

text(a2+L/5,-0.2,angle_label,'fontsize',14,'fontweight','bold'); %labelling angle

%Plotting positions A, B, and C

text(a1+1,0.2,'A','fontsize',14,'fontweight','bold');
text(b2+4,0.2,'B','fontsize',14,'fontweight','bold');
text(a2,0.2,'C','fontsize',14,'fontweight','bold');

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%Plotting the equivalent free body diagram

%Plotting the beam

x1=0;
x2=L+L/15;

%Ploting a vertical line

figure (2)

plot([L/15,L/15],[-1,-0.1],'Color','black','linewidth',5);

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

arrow([a2,0.3],[a2,0.2],'LineWidth',3);
plot([a2,a2],[0.85,0.2],'linestyle','--','color','black')

Vertical=W2*sin(Theta_rad);

Vertical_abs=round(abs(Vertical));

Vertical_label=strcat(num2str(Vertical_abs),'N');

text(a2-L/30,0.95,Vertical_label,'fontsize',14,'fontweight','bold');

%Horizontal component

arrow([a2-1+L/5,0],[a2+L/5,0],'LineWidth',3);
plot([a2+5,a2+L/5],[0,0],'linestyle','--','color','black')

Horizontal=W2*cos(Theta_rad);

Horizontal_abs=round(abs(Horizontal));

Horizontal_label=strcat(num2str(Horizontal_abs),'N');

text(a2+L/5-L/30,-0.2,Horizontal_label,'fontsize',14,'fontweight','bold');

hold off

%Plot string generation
plotString2 = generateImageString(gcf, 'image2');

%Calculations

%Reaction Forces

W2x=Horizontal_abs;
W2y=Vertical_abs;

Ry=round(W+W2y);
Rx=round(W2x);

M=round(W*P_in_m+W2y*L_in_m);

%Consider only y axis from here onwards

%Shear force
SFA=Ry;
SFB=round(Ry-W);
SFC=0;

%Plotting the SFD

%SF=plot([0,0],[0,SFA],'linewidth',3,'Color','red'); %Commented by Pilar as
%the SF should start at the value of R
%hold on
figure(3)
SF=plot([0,P_in_m],[SFA,SFA],'linewidth',3,'Color','red');

hold on

plot([P_in_m,P_in_m],[SFA,SFB],'linewidth',3,'Color','red');

plot([P_in_m,L_in_m],[SFB,SFB],'linewidth',3,'Color','red');

plot([L_in_m,L_in_m],[SFB,SFC],'linewidth',3,'Color','red');

%Axes and titles

axis tight
grid on
% axis([0 L_in_m+0.1 0 Ry+Ry/5]);

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

%Bending Moment

BMA=-M;
BMB=round(-W2y*(L_in_m-P_in_m));
BMC=0;

%Plotting BMD

BM=plot([0,P_in_m],[BMA,BMB],'linewidth',3,'Color','red');

hold on

plot([P_in_m,L_in_m],[BMB,BMC],'linewidth',3,'Color','red');

%Axes and titles

axis tight
grid on
% axis([0 L_in_m+0.1 -M 0]);

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending Moment (Nm)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString4 = generateImageString(gcf, 'image4');

%Embedded components string generation
    
    numString_rx = cloze_numerical(Rx, 0.025*Rx, 'Good job!', 'Incorrect');
    numString_ry = cloze_numerical(Ry, 0.025*Ry, 'Good job!', 'Incorrect');
    numString_m = cloze_numerical(M, 0.025*M, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(SFA, 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(SFB, 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(SFC, 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines', 'Good Job!','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Good Job!', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(BMA, 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(BMB, 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(BMC, 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');
   
%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a Cantilever beam as shown in the image above.</p>',...
    '<p>The wall generates reaction forces, R<sub>x</sub> and R<sub>y</sub> at positon A (x=0) and an anticlockwise moment, M.</p>', ...
    '<p>There is an external point force acting vertically on the beam at position B as shown in the diagram, and another force acting at position C at an angle to the horizontal plane as shown.</p>',...
    '<p>Using the convention that upward forces (vertical), forces to the right (horizontal), and anti-clockwise moments are positive, and the information given:</p>',...
    '<p><b>A)</b><p> Calculate the magnitude of the reaction forces R<sub>x</sub> and R<sub>y</sub>, and the moment M to the nearest whole number.',...
    '<p></p><p>R<sub>x</sub>:&nbsp', numString_rx,'N</p>', ...
    '<p></p><p>R<sub>y</sub>:&nbsp', numString_ry,'N</p>', ...
    '<p>M:&nbsp', numString_m, 'Nm</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b><p> Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x=0cm (Point A):&nbsp', numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(P),'cm (Point B):&nbsp', numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x=', num2str(L),'cm (Point C):&nbsp', numString_SFC, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) A and B:</p><p>' , numString_SFD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_SFD_B_C, ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>C)</b><p> Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at point A:&nbsp', numString_BMA, 'Nm</p>', ...
    '<p>Bending moment at point B:&nbsp', numString_BMB, 'Nm</p>', ...
    '<p>Bending moment at point C:&nbsp', numString_BMC, 'Nm</p>', ...
    '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) A and B:</p><p>' , numString_BMD_A_B, ...
    '<p>2) B and C:</p><p>' , numString_BMD_B_C); ...

    generalfeedbackString=strcat('<p><b>PART A</b></p><p>The angular force needs to be resolved into horizontal and vertical components, as shown below in the equivalent free body diagram for this system:</p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
        '<p>(N.B. R<sub>x</sub> and the horizontal load do not generate a BM as they do not have a perpendicular distance from the long axis of the beam)</p>',...
        '<p>This will then allow you to use the principles from the previous question to find forces R<sub>x</sub> and R<sub>y</sub>, and the moment M:</p>', ...
        '<p>R<sub>x</sub> -&nbsp',num2str(Horizontal_abs),' = 0. Therefore, R<sub>x</sub> = &nbsp',num2str(Rx),' N.</p>',...
        '<p>R<sub>y</sub> -&nbsp',num2str(W),' -&nbsp',num2str(Vertical_abs),' = 0. Therefore, R<sub>y</sub> = &nbsp',num2str(Ry),' N.</p>',...
        '<p>M - (', num2str(P/100),' x&nbsp', num2str(W),') - (', num2str(L/100),' x&nbsp', num2str(W2y),') = 0. Therefore, M =&nbsp',num2str(M),' Nm.</p>',...
        '<p><p><b>PART B</b></p>In this case the SFD can be defined by the following co-ordinates:</p>', ...
        '<p>(0,',num2str(SFA),'), (',num2str(P/100),',',num2str(SFB+W),'), (',num2str(P/100),',',num2str(SFB),'), (',num2str(L/100),',',num2str(SFB),'), (',num2str(L/100),',',num2str(SFC),').</p>', ...
        '<p>The SFD diagram in this case therefore looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p></p><p><b>PART C</b></p><p>For cantilever beams, the beam is always ''hogging'', and therefore has a negative bending moment by convention.',...
        '<p>Therefore the BM at point A is&nbsp',num2str(BMA),'Nm. (This is also the maximum BMD in this case).',...
        '<p>At point B, considering forces to the right, the bending moment = &nbsp-',num2str((L/100)-(P/100)),'m x &nbsp',num2str(W2y),'N = &nbsp',num2str(BMB),'Nm.', ...
        '<p>Alternatively, considering forces to the left of point B, the bending moment here can also be calculated as follows = &nbsp-',num2str(M),'Nm + (', num2str(P/100),'m x&nbsp', num2str(Ry),'N) = &nbsp',num2str(BMB),'Nm.',...
        '<p>As there are no forces to the right of point C, the BM at this point is simply zero.',...
        '<p>Alternatively, considering forces to the left of point C, the bending moment here can also be calculated as follows = &nbsp-',num2str(M),'Nm + (', num2str(L/100),'m x&nbsp', num2str(Ry),'N) - (', num2str(L/100-P/100),'m x&nbsp', num2str(W),'N)= &nbsp',num2str(BMC),'Nm.',...
        '<p>Therefore the BMD looks like this:', ...
        '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">', ...
        '<p>Remember, the BMD is also the integral of the SFD.</p>'); ...

       
            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b><p>Remember to resolve all forces into horizontal and vertical components and then apply the following equations:</p><p>$$\\small\\sum$$ M<sub>z</sub>=0</p><p>$$\\small\\sum$$ F<sub>y</sub>=0</p><p>$$\\small\\sum$$ F<sub>x</sub>=0</p><p>When producing SFDs and BMDs for cantilever beams, neither plot will start at the origin, but both will end on the x-axis.</p><p>The bending moment can be calculated by adding all of the bending moments to the left or right of any discrete point along the beam. </p>', ...
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

