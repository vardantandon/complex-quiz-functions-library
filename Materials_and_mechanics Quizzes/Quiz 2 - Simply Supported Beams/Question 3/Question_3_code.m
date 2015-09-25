%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

file=fopen('combined3.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
% Start Image

l=randi([10,20]);
L=l*10;

%Plotting the beam

y1=0;
y2=0;
x1=0;
x2=L;

figure(1)
plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

ID=strcat(num2str(i));

title('Simply Supported Beam','FontSize',20, 'FontWeight','bold');

text(L-20, -1.2, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

axis([-10 L+10 -1.5 1.5]);

axis off

%Indicating the beam length on the plot

L_unit=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%Plotting distributed load

p1=randi([3,round(l/3)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([3,round(l/2.5)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling distributed load

w=randi([15,50]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P1+(WR/3),0.15,W_label,'fontsize',12,'fontweight','bold');

%Labelling distances

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');
d3_label=strcat(num2str(L-P1-WR),'cm');

arrow([P1/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P1/2,-0.1],[P1,-0.1],'LineWidth',2);

arrow([P1+(WR/2),-0.1],[P1,-0.1],'LineWidth',2);
arrow([P1+(WR/2),-0.1],[P1+WR,-0.1],'LineWidth',2);

arrow([(P1+WR+L)/2,-0.1],[P1+WR,-0.1],'LineWidth',2);
arrow([(P1+WR+L)/2,-0.1],[L,-0.1],'LineWidth',2);

text(P1/3,-0.2,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.2,d2_label,'fontsize',12,'fontweight','bold');

text(P1+WR+(L-P1-WR)/3,-0.2,d3_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

%Plot string generation

plotString1 = generateImageString(gcf, 'image1');

hold off

%Drawing equivalent free body diagram with point loads

%Plotting the beam

y1b=0;
y2b=0;
x1b=0;
x2b=L;

figure(2)
plot([x1b,x2b],[y1b,y2b],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

% title('Equivalent Free Body Diagram','FontSize',12, 'FontWeight','bold');

axis off

%Indicating the beam length on the plot

L_unit_b=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit_b,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%Plotting point load

P=P1+WR/2;
arrow([P,0.1],[P,0],'LineWidth',3)
plot([P,P],[0.75,0.1],'linestyle','--','color','black')
%Labelling point load

W_label_b=strcat(num2str(W),'N');

text(P-5,0.85,W_label_b,'fontsize',12,'fontweight','bold')

%Labelling distances

d_label=strcat(num2str(P),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',3);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',3);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',3);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',3);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(LP),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

%Plot string generation

plotString2 = generateImageString(gcf, 'image2');

hold off

%End image

% Calculations

%Calculating reaction forces

R2=round((W*P)/L);
R2nr=(W*P)/L;
R1=round(W-R2);
R1nr=(W-R2);

%Calculating shear force

SFA=R1;
SFAnr=R1nr;
SFB=R1;
SFBnr=R1nr;
SFC=-1*R2;
SFCnr=-1*R2;
SFD=0;

%Calculating the bending moments

%Converting cm to m

Lm=L/100;
P1m=P1/100;
WRm=WR/100;
P2=P1m+WRm;
UDL_Mid=P1m+(WRm/2);

BMA=0;
BMB=round((R1)*P1m);
BMBnr=(R1nr)*P1m;
BMC=round((R2)*(Lm-P2));
BMCnr=(R2nr)*(Lm-P2);
BMD=0;

%Calculations for X1 (location of maximum bending moment)

m=(SFC-SFB)/WRm;
mnr=(SFCnr-SFBnr)/WRm;
c=SFB-(m*P1m);
cnr=SFBnr-(mnr*P1m);
X1m=(-1*c)/m;
X1mnr=(-1*cnr)/mnr;
X1=round(X1m*100);
X1nr=X1mnr*100;

% Plot SFD
figure(3)
plot([0,0],[0,SFA],'linewidth',3,'Color','red');
hold on
plot([0,P1m],[SFB,SFB],'linewidth',3,'Color','red');
plot([P1m,P2],[SFB,SFC],'linewidth',3,'Color','red');
plot([P2,Lm],[SFC,SFC],'linewidth',3,'Color','red');
plot([Lm,Lm],[SFC,SFD],'linewidth',3,'Color','red');
plot([0,Lm],[0,0], 'linewidth',0.1,'color','black');
plot([P1m,P1m],[0,SFB],'linestyle','--','color','black')
plot([P2,P2],[0,SFC],'linestyle','--','color','black')

grid ON

axis tight

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation

plotString3 = generateImageString(gcf, 'image3');

% Plot BMD

%Calculating Maximum Bending moment

% To calculate constant of integration AA

A = BMB - ((m*P1m^2/2) + (c*P1m));
Anr = BMBnr - ((mnr*P1m^2/2) + (cnr*P1m));

% Defining x-axis vector over which to plot UDL

X= P1m:0.01:P2;

% Defining the equation for the bending moment over the UDL

Y = mnr.*(X.^2)/2 + cnr.*X +Anr;
% Calculations for value of maximum bending moment

BM_Max = m.*(X1m.^2)/2 + c.*X1m +A;
figure(4)
plot([0,P1m],[0,BMB],'linewidth',3,'Color','red');
hold on
plot([P2,Lm],[BMC,0],'linewidth',3,'Color','red');
% plot(X1m,BM_Max,'linewidth',3,'Color','red')
plot(X, Y,'linewidth',3,'Color','red')
 plot([P1m,P1m],[0,BMB],'linestyle','--','color','black')
    plot([P2,P2],[0,BMC],'linestyle','--','color','black')
%     plot([X1m,X1m],[0,BM_Max],'linestyle','--','color','black')
grid ON

axis tight

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending moment (Nm)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation

plotString4 = generateImageString(gcf, 'image4');

% To calculate equation for BMD to right of UDL

m2=BMC/(P2-Lm);
c2=-1*m2*Lm;

%Embedded components string generation
    
    numString_r1 = cloze_numerical(round(R1), 0.025*R1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(round(R2), 0.025*R2, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(round(SFA), 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(round(SFB), 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(round(SFC), 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD = cloze_numerical(round(SFD), 0.025*SFD, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good job!','A combination of horizontal and vertical lines', 'Incorrect','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');
    numString_SFD_C_D = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Good job!', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(round(BMA), 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(round(BMB), 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(round(BMC), 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD= cloze_numerical(round(BMD), 0.025*BMD, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Good job!');
    numString_BMD_C_D = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');
    numString_max_BM_location = cloze_numerical(round(X1), 0.025*X1, 'Good job!', 'Incorrect');
    numString_max_BM_value = cloze_numerical(round(BM_Max), 0.025*BM_Max, 'Good job!', 'Incorrect');

% 
 %Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a simply supported beam as shown above with length L.</p><p>There are two supports at either end of the beam, which generate reaction forces R1 and R2, at positions x = 0 and x = L, respectively.</p>', ...
    '<p>There is a Uniformly Distributed Load (UDL) acting on the beam as shown in the diagram.</p>',...
    '<p>Using the convention that upward forces and anti-clockwise moments are positive, and the information given:</p><br>', ...
    '<p><b>A)</b><p>Calculate the value of the reaction forces R1 and R2 to the nearest whole number.</p>', ...
    '<p>R1:&nbsp',numString_r1,'N</p>', ...
    '<p>R2:&nbsp',numString_r2,'N</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b><p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x = 0cm (Point A):&nbsp',numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P1m*100),' cm (Point B):&nbsp',numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P2*100),' cm (Point C):&nbsp',numString_SFC, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(L),' cm (Point D):&nbsp',numString_SFD, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) Points A and B:</p><p>',numString_SFD_A_B, ...
    '<p>2) Points B and C:</p><p>',numString_SFD_B_C, ...
    '<p>3) Points C and D:</p><p>',numString_SFD_C_D, ...
    '<br><b>C)</b><p>Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at Point A:&nbsp',numString_BMA,'Nm</p>', ...
    '<p>Bending moment at Point B:&nbsp',numString_BMB,'Nm</p>', ...
    '<p>Bending moment at Point C:&nbsp',numString_BMC,'Nm</p>', ...
    '<p>Bending moment at Point D:&nbsp',numString_BMD,'Nm</p>', ...
    '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) Points A and B:</p><p>',numString_BMD_A_B, ...
    '<p>2) Points B and C:</p><p>',numString_BMD_B_C, ...
    '<p>3) Points C and D:</p><p>',numString_BMD_C_D, ...
    '<br><b>D)</b><p>Where does the maximum bending moment occur?<p></p>(To the nearest whole number)&nbsp',numString_max_BM_location,'cm</p>', ...
    '<br><b>E)</b><p>What is the maximum bending moment?<p></p>(To the nearest whole number)&nbsp',numString_max_BM_value,'Nm</p>'); ...

if A>0
    Z='+';
else
    Z='';
end

R=W*((X1/100)-P1m)/WRm;
S=((X1/100)-P1m)/2;
S=round(S*100)/100;

    generalfeedbackString=strcat('<b><p>Part A)</b><p>Review the material from the previous quiz (Reaction Forces and Free Body Diagram) if you''re having trouble with this section.</p>', ...
        '<p> Below is the Equivalent Free Body Diagram using only point loads for this question:', ...
        '<br><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">', ...    
        '<p><br></p><b>Part B)</b></p>To produce the SFD (going from left to right), plot the sum of net vertical forces against distance along the beam. The SFD should always start and end at zero for a simply supported beam.</p>', ...
        'In this case the SFD can be defined by the following co-ordinates:', ...
        '<p>(0,0), (0,',num2str(round(SFA)),'), (',num2str(P1m),',',num2str(round(SFB)),'), (',num2str(P2),',',num2str(round(SFC)),'), (',num2str(Lm),',',num2str(round(SFC)),'), (',num2str(Lm),', 0).</p>', ...
        '<p>The SFD diagram in this case looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p><br></p><b>Part C)</b></p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p>',...
        '<p>Considering forces to the left of the point of interest:</p>',...
        '<p>BM at point A = 0 Nm.</p>',...
        '<p>BM at point B = (R1 x distance to R1) = (',num2str(R1),'N x&nbsp',num2str(P1m),'m) =&nbsp',num2str(BMB),' Nm.</p>', ...
        '<p>BM at point C = (R1 x distance to R1) - (Weight of UDL x distance to midpoint of UDL) = (',num2str(R1),'N x&nbsp',num2str(P2),'m) - (',num2str(W),'N x&nbsp',num2str((WRm)/2),'m) =&nbsp',num2str(BMC),' Nm.</p>', ...
        '<p>BM at point D = (R1 x distance to R1) - (Weight of UDL x distance to midpoint of UDL) = (',num2str(R1),'N x&nbsp',num2str(Lm),'m) - (',num2str(W),'N x&nbsp',num2str(Lm-P2+((WRm)/2)),'m) = 0 Nm.</p>', ...
        '<p>As the beam is ''sagging'' in this case, it is therefore showing a positive BM, and all BMs will be positive in value by convention.<p>',...
        '<p>The BMD is the integral of the SFD. Therefore a point load going upwards will generate a straight line sloping upwards on the BMD, and a point load going downwards will produce a straight line sloping downwards on the BMD.</p>', ...
        '<p>Taking this into account, the BMD looks like this in this case:</p>',...
        '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">',...
        '<p><br></p><p>Alternatively you can find the equations for the BMD by integrating the SFD:</p>',...
        '<p>Between points A and B:</p>',...
        '<p>y =&nbsp',num2str(R1),'x</p>',...
        '<p>Between points B and C:</p>', ...
        '<p>y =&nbsp',num2str(round(m/2)),'x<sup>2</sup> +&nbsp',num2str(round(c)),'x &nbsp',Z,'',num2str(round(A)),'</p>',... 
        '<p>Between points C and D:</p>', ...
        '<p>y =&nbsp',num2str(round(m2)),'x +&nbsp',num2str(round(c2)),'</p>',...
        '<p><br></p><b>Part D)</b></p><p>The maximum BM occurs when the SFD crosses the x-axis.</p>',...
        '<p>The SFD in this region (between Points B and C) is a straight line which goes through the points&nbsp(',num2str(P1m),',',num2str(round(SFB)),') and (',num2str(P2),',',num2str(round(SFC)),'), ',...
        'and therefore has the equation y =&nbsp',num2str(round(m)),' x +&nbsp',num2str(round(c)),'.</p>',...
        '<p>Setting the left side of this equation to zero, and solving for x, gives a value of&nbsp',num2str(X1),'cm for the location of the maximum BM.</p>',...
        '<p><br></p><b>Part E)</b></p>  <p>The maximum bending moment can easily be calculated as follows:</p>',...
        '<p>(R1 x distance to R1) - ((Weight of UDL to left of maximum bending moment) x (Distance to midpoint of UDL to left of maximum bending moment)) =',...
        '&nbsp(',num2str(R1),'N x&nbsp',num2str(X1/100),'m) - (',num2str(round(R)),'N x&nbsp',num2str(S),'m) =&nbsp',num2str(round(BM_Max)),'Nm.</p>',...
        '<p>Alternatively, you can substitute the value of x =&nbsp',num2str((X1/100)),'m into y =&nbsp',num2str(round(m/2)),'x<sup>2</sup> +&nbsp',num2str(round(c)),'x &nbsp',Z,'',num2str(round(A)),', to give you the same answer.</p>'); 

       
    
       
            
   IDString=strcat('Simply Supported Beams. Level 3.Question ID #', ID); 
    
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>To produce the SFD (going from left to right), plot the sum of net vertical forces against distance along the beam. The SFD should always start and end at zero for a simply supported beam.</p><p>Remember - a point load or reaction force will always produce a vertical line on a SFD.</p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p><i><p> A UDL will always produce a straight line with a slope on a SFD, and a curve on a BMD.</p><p>The maximum bending moment occurs when the SFD crosses the x-axis.</i></p>', ...
        plotString1, ...
        plotString2, ...
        plotString3, ...
        plotString4);
    
     %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
