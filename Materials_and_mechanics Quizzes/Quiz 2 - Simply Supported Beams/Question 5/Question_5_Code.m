%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 5
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%Modified by Pilar - 21st Jan 2015

%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

file=fopen('combined5.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100%START OF MAIN LOOP
    
ID=strcat(num2str(i));

IDString=strcat('Simply Supported Beams. Level 5.Question ID #', ID);    

% Start Image    
    
l=20;
L=l*10;

%Plotting the beam

y1=0;
y2=0;
x1=0;
x2=L;

figure(1)

plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

title('Simply Supported Beam','FontSize',20, 'FontWeight','bold');

text(L-20, -1.2, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');


axis off

%Indicating the beam length on the plot

L_unit=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%plotting 1st distributed load

p1=randi([2,round(l/6)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([15,round(l-p1-2)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling 1st distributed load

w=randi([15,50]);
W1=w*10;
W1_label=strcat(num2str(W1),'N');

text(P1+(WR/3),0.15,W1_label,'fontsize',12,'fontweight','bold');

%Plotting point load

p=randi([16,(P1+WR)/10]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load

w=randi([8,20]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

%labelling distances

d_label=strcat(num2str(P),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',2);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',2);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',2);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
end 

plot([P1,P1],[0,-0.5],'LineStyle','--','Linewidth',1.5,'Color','black');
plot([P1+WR,P1+WR],[0,-0.5],'LineStyle','--','Linewidth',1.5,'Color','black');

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');

arrow([P1/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([P1/2,-0.5],[P1,-0.5],'LineWidth',2);

arrow([P1+(WR/2),-0.5],[P1,-0.5],'LineWidth',2);
arrow([P1+(WR/2),-0.5],[P1+WR,-0.5],'LineWidth',2);

text(P1/3,-0.6,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.6,d2_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');


%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%Drawing equivalent free body diagram

%Plotting the beam

y1b=0;
y2b=0;
x1b=0;
x2b=L;

figure(2)

plot([x1b,x2b],[y1b,y2b],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

% title('Free Body Diagram','FontSize',12, 'FontWeight','bold');

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

arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load


text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

%labelling distances

% if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',2);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

% else
%     
%     arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',2);
%     arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',2);
%     
%   LP=L-P;
%     
%     text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
%     
% end 

%Plotting distributed point load

Pb=P1+WR/2;
arrow([Pb,0.75],[Pb,0],'LineWidth',3)

%Labelling  1st point load

text(Pb-5,0.85,W1_label,'fontsize',12,'fontweight','bold')

plot([Pb,Pb],[0,-0.5],'LineStyle','--','LineWidth',1.5,'Color','black');

db_label=strcat(num2str(Pb),'cm');
db2_label=strcat(num2str(L-Pb),'cm');

% if P>=L/2
%     
%     arrow([Pb/2,-0.5],[0,-0.5],'LineWidth',2);
% arrow([Pb/2,-0.5],[Pb,-0.5],'LineWidth',2);
% 
% text(Pb/3,-0.6,db_label,'fontsize',12,'fontweight','bold');

% else 
%     
 arrow([(Pb+L)/2,-0.5],[L,-0.5],'LineWidth',2);
    arrow([(Pb+L)/2,-0.5],[Pb,-0.5],'LineWidth',2);
    
  LP2=L-Pb;
    
    text(Pb+(LP2/3),-0.6,db2_label,'fontsize',12,'fontweight','bold');
%     
% end

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

hold off

%Plot string generation
plotString2 = generateImageString(gcf, 'image2');

%Calculating reaction forces

R2=round(((W*P)+(W1*Pb))/L);

R1=round(W+W1-R2);

%Converting cm to m

Lm=L/100;
P1m=P1/100;
WRm=WR/100;
Pm=P/100;
Pbm=Pb/100;

%Other Calculations -Dr. Pilar Garcia Souto 

%==================


UDL = W1/WRm; % Value of the UDL in N/m

%Points of interest = PoI
PoI=[0,P1m,Pm,P1m+WRm,Lm];

%Shear force values
SFA=R1;
SFB=R1;
SFC= round(SFB - (UDL*(Pm-P1m)) -W);
SFD= -R2;
SFE=0;

%Location when SF=0, i.e. when the Bending Moment is at its maximum
Max_BM_position = -1;
SF_pre_drop = SFB - UDL*(Pm-P1m); %Pilar changed SFC into SFB! TEST
if(SFB>0 && SF_pre_drop<=0) %CASE 1: The SF crosses zero during the left side of the UDL
    %check the position at which crosses using equation of the line
    % y=(R1+UDL*P1m) - UDL*x  %PILAR CHANGED THIS LINE
    Max_BM_position = P1m+ R1/UDL;
    
elseif (SF_pre_drop>0 && SFC<=0) %CASE 2: The SF crosses zero during the drop cause by the point load located within the UDL 
    Max_BM_position =Pm;
    
elseif (SFC>0 && SFD<=0)%CASE 3: The SF crosses zero during the right side of the UDL
    %Check the position at which it crosses using equation of the line
    % y=SF(2) - UDL*x
    Max_BM_position = Pm+ SFC/UDL;
end

Max_BM_position_cm=round(Max_BM_position*100);

%Calculate the BM values at the points of interest
BMA=0;
BMB= round(abs(-R1*P1m));
BMC= round(abs(-R1*Pm +UDL*(Pm-P1m)*(Pm-P1m)/2));
BMD= round(R2*(Lm-P1m-WRm));
BME=0;

%Calculate the Maximum BM, i.e. at position "Max_BM_position"
Max_BM=-1;
if(Pm>=Max_BM_position)
    Max_BM = round(abs(-R1*Max_BM_position +UDL*(Max_BM_position-P1m)*(Max_BM_position-P1m)/2));
else
    Max_BM = round(abs(-R1*Max_BM_position +UDL*(Max_BM_position-P1m)*(Max_BM_position-P1m)/2 + W*(Max_BM_position -Pm)));
end

%Done
%Need to be careful with the number of decimals used and the error derived
%by using approximation numbers

% PLOT SFD

figure(3)
plot([0,0],[0,SFA],'linewidth',3,'Color','red');
hold on
plot([0,P1m],[SFA,SFB],'linewidth',3,'Color','red');
plot([P1m,Pm],[SFB,SFC+W],'linewidth',3,'Color','red');
plot([Pm,Pm],[SFC+W,SFC],'linewidth',3,'Color','red');
plot([Pm,P1m+WRm],[SFC, SFD],'linewidth',3,'Color','red');
plot([P1m+WRm,Lm],[SFD,SFD],'linewidth',3,'Color','red');
plot([Lm,Lm],[SFD,0],'linewidth',3,'Color','red');
plot([0,Lm],[0,0], 'linewidth',0.1,'color','black');
plot([P1m,P1m],[0,SFB],'linestyle','--','color','black')
if (P1m+WRm)~=Pm
plot([P1m+WRm,P1m+WRm],[0,SFD],'linestyle','--','color','black')
end
if SFC>0
  plot([Pm,Pm],[0,SFC],'linestyle','--','color','black')
end  
if (SFC+W)<0 && P1m~=Pm
      plot([Pm,Pm],[0,(SFC+W)],'linestyle','--','color','black')
end
grid ON

axis tight

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation

plotString3 = generateImageString(gcf, 'image3');

% PLOT BMD

% Calculations for BMD plots
% 
% UDL#1

m1=(SFC+W-SFB)/(Pm-P1m);
c1=SFB-(m1*P1m);
a1=BMB-(m1.*P1m.^2*0.5)-(P1m*c1);
UDL1_X=P1m:0.01:Pm;
UDL1_Y=(m1*0.5*UDL1_X.^2)+(UDL1_X*c1)+a1;

% UDL#2

m2=(SFD-SFC)/(P1m+WRm-Pm);
c2=SFC-(m2*Pm);
a2=BMC-(m2.*Pm.^2*0.5)-(Pm*c2);
UDL2_X=Pm:0.01:P1m+WRm;
UDL2_Y=(m2*0.5*UDL2_X.^2)+(UDL2_X*c2)+a2;

% Plotting the BMD
figure(4)
plot([0,P1m],[0,BMB],'linewidth',3,'Color','red');
hold on
plot(UDL1_X,UDL1_Y, 'linewidth',3,'Color','red');
plot(UDL2_X,UDL2_Y, 'linewidth',3,'Color','red');
plot([P1m+WRm,Lm],[BMD,0],'linewidth',3,'Color','red');
plot([P1m,P1m],[0,BMB],'linestyle','--','color','black')
plot([Pm,Pm],[0,BMC],'linestyle','--','color','black')
plot([P1m+WRm,P1m+WRm],[0,BMD],'linestyle','--','color','black')
grid ON

axis tight

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending moment (Nm)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

% Plot string generation

plotString4 = generateImageString(gcf, 'image4');

% equation for fourth BMD line

m3=(BME-BMD)/(Lm-(P1m+WRm));
c3=BME-(m3*Lm);

% if  Max_BM_position==Pm;
%     location='at Point C.'
%     MAXBMVALUE='the BM at Point C as calculated above';
% end
% if  Max_BM_position<Pm
%     location='between Points B and C.'
%     MAXBMVALUE='';
% end
% if  Max_BM_position>Pm
%     location='between Points C and D.'
%     MAXBMVALUE='';
% end
%Embedded components string generation
    
    numString_r1 = cloze_numerical(R1, 0.025*R1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(R2, 0.025*R2, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(SFA, 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(SFB, 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(SFC, 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD = cloze_numerical(SFD, 0.025*SFD, 'Good job!', 'Incorrect');
    numString_SFE = cloze_numerical(0, 0.5, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 1, 'Either a horizontal or vertical line', 'Good Job!','A combination of horizontal and vertical lines', 'Incorrect','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope and a vertical line ','Good job!', 'A curve','Incorrect');
    numString_SFD_C_D = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good Job!', 'A curve','Incorrect');
    numString_SFD_D_E = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines', 'Good Job!','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(BMA, 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(BMB, 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(BMC, 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD= cloze_numerical(BMD, 0.025*BMD, 'Good job!', 'Incorrect');
    numString_BME= cloze_numerical(BME, 0.025*BME, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Good job!');
    numString_BMD_C_D = cloze_mcq('vertical', 4, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Incorrect', 'A curve','Good job');
    numString_BMD_D_E = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');
    numString_max_BM_location = cloze_numerical(round(Max_BM_position_cm), 0.025*Max_BM_position_cm, 'Good job!', 'Incorrect');
    numString_max_BM_value = cloze_numerical(round(Max_BM), 0.025*Max_BM, 'Good job!', 'Incorrect');

%Question string joining
     questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a simply supported beam as shown above with length L.</p><p> There are two supports at either end of the beam, which generate reaction forces R1 and R2, at positions x = 0 and x = L respectively.</p>', ...
    '<p>A Uniformly Distributed Load (UDL) and a point force are acting on the beam, as shown in the diagram.</p>',...
    '<p>Using the convention that upward forces and anti-clockwise moments are positive, and the information given:</p><br>', ...
    '<p><b>A)</b><p>Calculate the value of the reaction forces R1 and R2 to the nearest whole number.</p>', ...
    '<p>R1:&nbsp',numString_r1,'N</p>', ...
    '<p>R2:&nbsp',numString_r2,'N</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b><p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x = 0cm (Point A):&nbsp',numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P1),' cm (Point B):&nbsp',numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P),' cm (Point C):&nbsp',numString_SFC, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P1+WR),' cm (Point D):&nbsp',numString_SFD, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(L),' cm (Point E):&nbsp',numString_SFE, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) Points A and B:</p><p>',numString_SFD_A_B, ...
    '<p>2) Points B and C:</p><p>',numString_SFD_B_C, ...
    '<p>3) Points C and D:</p><p>',numString_SFD_C_D, ...
    '<p>4) Points D and E:</p><p>',numString_SFD_D_E, ...
    '<br><b>C)</b><p>Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at Point A:&nbsp',numString_BMA,'Nm</p>', ...
    '<p>Bending moment at Point B:&nbsp',numString_BMB,'Nm</p>', ...
    '<p>Bending moment at Point C:&nbsp',numString_BMC,'Nm</p>', ...
    '<p>Bending moment at Point D:&nbsp',numString_BMD,'Nm</p>', ...
    '<p>Bending moment at Point E:&nbsp',numString_BME,'Nm</p>', ...
    '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) Points A and B:</p><p>',numString_BMD_A_B, ...
    '<p>2) Points B and C:</p><p>',numString_BMD_B_C, ...
    '<p>3) Points C and D:</p><p>',numString_BMD_C_D, ...
    '<p>4) Points D and E:</p><p>',numString_BMD_D_E, ...
    '<br><b>D)</b><p>Where does the maximum bending moment occur? <p></p>(To the nearest whole number) &nbsp', numString_max_BM_location, 'cm</p>', ...
    '<br><b>E)</b><p>What is the maximum bending moment? <p></p>(To the nearest whole number) &nbsp', numString_max_BM_value, 'Nm</p>'); ...

if a1>0
    Z1='+';
else
    Z1='';
end


if a2>0
    Z2='+';
else
    Z2='';
end


m4=(SFC+W-SFB)/(Pm-P1m);
c4=SFB-(m4*P1m);

     generalfeedbackString=strcat('<b><p>Part A)</b><p>Review the material from the previous quiz (Reaction Forces and Free Body Diagram) if you''re having trouble with this section.</p>', ...
        '<p> Below is the Equivalent Free Body Diagram using only point loads for this question:', ...
        '<br><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">', ...    
        '<p><br></p><b>Part B)</b></p>To produce the SFD (going from left to right), plot the sum of net vertical forces against distance along the beam. The SFD should always start and end at zero for a simply supported beam.</p>', ...
        'In this case the SFD can be defined by the following co-ordinates:', ...
        '<p>(0,0), (0,',num2str(SFA),'), (',num2str(P1m),',',num2str(SFB),'), (',num2str(Pm),',',num2str(SFC+W),'), (',num2str(Pm),',',num2str(SFC),'), (',num2str(P1m+WRm),',',num2str(SFD),'), (',num2str(Lm),',',num2str(SFD),'), (',num2str(Lm),', 0).</p>', ...
        '<p>The SFD diagram in this case looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p><br></p><b>Part C)</b></p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p>',...
        '<p>Considering forces to the left of the point of interest:</p>',...
        '<p>BM at point A = 0 Nm.</p>',...
        '<p>BM at point B = (R1 x distance to R1) = (',num2str(R1),'N x&nbsp',num2str(P1m),'m) =&nbsp',num2str(BMB),' Nm.</p>', ...
        '<p>BM at point C = (R1 x distance to R1) - (Weight of UDL to the left of point C x distance to midpoint of UDL to left of point C) = (',num2str(R1),'N x&nbsp',num2str(Pm),'m) - (',num2str(((Pm-P1m)/WRm)*W1),'N x&nbsp',num2str(((Pm-P1m)/2)),'m) =&nbsp',num2str(BMC),' Nm.</p>', ...
        '<p>BM at point D = (R1 x distance to R1) - (Weight of UDL x distance to midpoint of UDL) - (Point Force x distance to Point Force) = (',num2str(R1),'N x&nbsp',num2str(P1m+WRm),'m) - (',num2str(W1),'N x&nbsp',num2str((WRm)/2),'m) - (',num2str(W),'N x&nbsp',num2str(P1m+WRm-Pm),'m)=&nbsp',num2str(BMD),' Nm.</p>', ...
        '<p>BM at point E = (R1 x distance to R1) - (Weight of UDL x distance to midpoint of UDL) - (Point Force x distance to Point Force) = (',num2str(R1),'N x&nbsp',num2str(Lm),'m) - (',num2str(W1),'N x&nbsp',num2str(Lm-(P1m+WRm)+((WRm)/2)),'m) - (',num2str(W),'N x&nbsp',num2str(Lm-Pm),'m) =&nbsp',num2str(BME),' Nm.</p>', ...
        '<p>As the beam is ''sagging'' in this case, it is therefore showing a positive BM, and all BMs will be positive in value by convention.<p>',...
        '<p>Taking this into account, the BMD looks like this in this case:</p>',...
        '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">',...
        '<p><br></p><p>Alternatively you can find the equations for the BMD by integrating each branch of the SFD.</p>',... 
        '<p>The equation for the BMD between points A and B is:</p>', ...
        '<p>y = &nbsp', num2str(R1),'x', ... 
        '<p>The equation for the BMD between points B and C is:</p>', ...
        '<p>y = &nbsp', num2str(round(0.5*m1)),'x<sup>2</sup> + &nbsp',num2str(round(c1)),'x&nbsp',Z1,'',num2str(round(a1)),... 
        '<p>The equation for the BMD between points C and D is:</p>', ...
        '<p>y = &nbsp', num2str(round(0.5*m2)),'x<sup>2</sup> + &nbsp',num2str(round(c2)),'x&nbsp',Z2,'',num2str(round(a2)),... 
        '<p>The equation for the BMD between points D and E is:</p>', ...
        '<p>y = &nbsp', num2str(round(m3)),'x + &nbsp', num2str(round(c3)),...
        '<p><br></p><b>Part D)</b></p><p>The maximum BM occurs when the SFD crosses the x-axis.</p>',...
        '<p>The SFD in this region is a straight line between Points B and C, which passes through (',num2str(P1m),',',num2str(SFB),') and (',num2str(Pm),',',num2str(SFC+W),')',...
        ' and therefore has the equation y =&nbsp',num2str(round(m4)),'x +&nbsp',num2str(round(c4)),'.</p>',...
        '<p>Setting the left side of this equation to zero, and solving for x, gives a value of&nbsp',num2str(Max_BM_position_cm/100),'m for the location of the maximum BM.</p>',...
        '<p><br></p><b>Part E)</b></p><p>The maximum bending moment can easily be calculated by substituting the value of x =&nbsp',num2str(Max_BM_position_cm/100),'m into the equation for the BMD between points B and C (as given above).</p>',...
        '<p>Alternatively you can individually consider the bending moments to the left of x =&nbsp',num2str(Max_BM_position_cm/100),'m as follows:</p>',...
        '<p>(R1 x distance to R1) - (Weight of UDL to the left of maximum BM x distance to midpoint of UDL to the left of maximum BM) = </p>',...
        '<p>(',num2str(R1),'N x&nbsp',num2str(Max_BM_position_cm/100),'m) - (',num2str((((Max_BM_position_cm/100)-P1m)/WRm)*W1),'N x&nbsp',num2str(((Max_BM_position_cm/100)-P1m)/2),'m) =&nbsp',num2str(Max_BM),' Nm.</p>');
  

       
            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>To produce the SFD (going from left to right), plot the sum of net vertical forces against distance along the beam. The SFD should always start and end at zero for a simply supported beam. A UDL will always produce a straight line with a slope on a SFD.</p><p>The BMD can be calculated by adding all of the individual moments to the left or right of any discrete point along the beam. A UDL will always produce a curve on a BMD. The maximum bending moment occurs when the SFD crosses the x-axis.</p>', ...
        plotString1, ...
        plotString2, ...
        plotString3, ...
        plotString4);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);

