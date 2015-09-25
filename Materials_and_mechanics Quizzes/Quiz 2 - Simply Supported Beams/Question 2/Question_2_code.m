%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 2
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


file=fopen('combined2.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions
    
    
% Start Image#1

l=randi([15,20]);
L=l*10;

axis([0 L -1.5 1.5])


%Plotting the beam

y1=0;
y2=0;
x1=0;
x2=L;
figure(1)
plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

ID=strcat(num2str(i));

IDString=strcat('Simply Supported Beams. Level 2.Question ID #', ID);

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

%Plotting 1st point load

p=randi([1,l-6]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling 1st point load

w=randi([5,15]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')



%Plotting 2nd point load

p2=randi([l-5,l-3]);
P2=p2*10;
arrow([P2,0.5],[P2,0],'LineWidth',3);

%Labelling 2nd point load

w2=randi([5,15]);
W2=w2*10;
W2_label=strcat(num2str(W2),'N');

text(P2-5,0.6,W2_label,'fontsize',12,'fontweight','bold')

%Labelling distances

d_label=strcat(num2str(P),'cm');

plot([P2,P2],[0,-0.5],'LineStyle','--','Color','black','Linewidth',1.5);

d2_label=strcat(num2str(P2),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',3);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',3);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

arrow([P2/2,-0.5],[0,-0.5],'LineWidth',3);
arrow([P2/2,-0.5],[P2,-0.5],'LineWidth',3);

text(P2/3,-0.6,d2_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([(P+L)/2,-0.1],[L,-0.1],'LineWidth',3);
    arrow([(P+L)/2,-0.1],[P,-0.1],'LineWidth',3);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
      arrow([(P2+L)/2,-0.5],[L,-0.5],'LineWidth',3);
    arrow([(P2+L)/2,-0.5],[P2,-0.5],'LineWidth',3);
    
  LP2=L-P2;
    
    text(P2+(LP2/3),-0.6,strcat(num2str(LP2),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(L/4+L/40,-1.2,'x','Fontsize',12,'fontweight','bold');

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%End image

Lm=L/100;
Pm=P/100;
P2m=P2/100;

% Calculating reaction forces

R2=round(((W*P)+(W2*P2))/L);

R1=round(W+W2-R2);

%Calculating shear force

SFA=round(R1);
SFB=round(R1-W);
SFC=round(R1-W-W2);
SFD=0;

% Plotting the SFD
figure(2)
plot([0,0],[0,SFA],'linewidth',3,'Color','red');
hold on
plot([0,Pm],[SFA,SFA],'linewidth',3,'Color','red');
plot([Pm,Pm],[SFA,SFB],'linewidth',3,'Color','red');
plot([Pm,P2m],[SFB,SFB],'linewidth',3,'Color','red');
plot([P2m,P2m],[SFB, SFC],'linewidth',3,'Color','red');
plot([P2m,Lm],[SFC,SFC],'linewidth',3,'Color','red');
plot([Lm,Lm],[SFC,0],'linewidth',3,'Color','red');
plot([0,Lm],[0,0], 'linewidth',0.1,'color','black');
if R1>W
    plot([Pm,Pm],[0,SFB],'linestyle','--','color','black')
else
    plot([P2m,P2m],[0,SFB],'linestyle','--','color','black')
end
    grid ON

axis tight

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

plotString2 = generateImageString(gcf, 'image2');

%Calculating the bending moments

BMA=0;
BMB=round(abs(R1*Pm));
BMC=round(abs((R1*P2m)-(W*(P2m-Pm))));
BMD=0;

% Plotting the BMD
figure(3)
plot([0,Pm],[0,BMB],'linewidth',3,'Color','red');
hold on
plot([Pm,P2m],[BMB,BMC],'linewidth',3,'Color','red');
plot([P2m,Lm],[BMC,0],'linewidth',3,'Color','red');
    plot([Pm,Pm],[0,BMB],'linestyle','--','color','black')
    plot([P2m,P2m],[0,BMC],'linestyle','--','color','black')

grid ON

axis tight

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending moment (Nm)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

% Plot string generation

plotString3 = generateImageString(gcf, 'image3');

% To calculate BMD equations:
% 
% Midsection:

m1=(BMC-BMB)/(P2m-Pm);
c1=BMB-(m1*Pm);

% Third section:

m2=(0-BMC)/(Lm-P2m);
c2=-1*m2*Lm;

if R1<W
    MAXBM=BMB;
    MAXBMLOCATION='at Point B';
else
    MAXBM=BMC;
    MAXBMLOCATION='at Point C';
end
if R1==W
    MAXBMLOCATION='between Points B and C';
end
    grid ON

%Embedded components string generation
    
    numString_r1 = cloze_numerical(R1, 0.025*R1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(R2, 0.025*R2, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(SFA, 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(SFB, 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC = cloze_numerical(SFC, 0.025*SFC, 'Good job!', 'Incorrect');
    numString_SFD = cloze_numerical(SFD, 0.025*SFD, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines', 'Good job!','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Good job!', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_SFD_C_D = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Good job!', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(BMA, 0.025*BMA, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(BMB, 0.025*BMB, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(BMC, 0.025*BMC, 'Good job!', 'Incorrect');
    numString_BMD= cloze_numerical(BMD, 0.025*BMD, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');
    numString_BMD_C_D = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');


% 
 %Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p>Consider a simply supported beam as shown above with length L.</p><p>There are two supports at either end of the beam,which generate reaction forces R1 and R2, at positions x=0 and x=L, respectively.</p>', ...
    '<p>There are two external point forces acting on the beam as shown in the diagram.</p>', ...
    '<p>Using the convention that upward forces and anti-clockwise moments are positive, and the information given:</p><br>', ...
    '<p><b>A)</b><p>Calculate the value of the reaction forces R1 and R2 to the nearest whole number.</p>', ...
    '<p>R1:&nbsp',numString_r1,'N</p>', ...
    '<p>R2:&nbsp',numString_r2,'N</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b><p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x = 0cm (Point A):&nbsp',numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P),' cm (Point B):&nbsp',numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P2m*100),' cm (Point C):&nbsp',numString_SFC, 'N</p>', ...
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
    '<p>3) Points C and D:</p><p>',numString_BMD_C_D);


generalfeedbackString=strcat('<b><p>Part A)</b><p><p>Review the material from the previous quiz (Reaction Forces and Free Body Diagram) if you''re having trouble with this section.</p>', ...
        '<p><b>Part B)</b></p><p>To produce the SFD (going from left to right), plot the sum of net vertical forces against position along the beam. The SFD should always start and end at zero for a simply supported beam.</p>', ...
        'In this case the SFD can be defined by the following co-ordinates:', ...
        '<p>(0,0), (0,',num2str(SFA),'), (',num2str(Pm),',',num2str(SFA),'), (',num2str(Pm),',',num2str(SFB),'), (',num2str(P2m),',',num2str(SFB),'), (',num2str(P2m),',',num2str(SFC),'), (',num2str(Lm),',',num2str(SFC),'), (',num2str(Lm),', 0).</p>', ...
        '<p>The SFD diagram in this case looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
        '<p><br></p><b>Part C)</b></p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p>',...
        '<p>Considering forces to the left of the point of interest:</p>',...
        '<p>BM at point A = 0 Nm.</p>',...
        '<p>BM at point B = (R1 x distance to R1) = (',num2str(R1),'N x&nbsp',num2str(Pm),'m) =&nbsp',num2str(BMB),' Nm.</p>', ...
        '<p>BM at point C = (R1 x distance to R1) - (Point Force at B x distance to B) = (',num2str(R1),'N x&nbsp',num2str(P2m),'m) - (',num2str(W),'N x&nbsp',num2str(P2m-Pm),'m) =&nbsp',num2str(BMC),' Nm.</p>', ...
        '<p>BM at point D = (R1 x distance to R1) - (Point Force at B x distance to B) - (Point Force at C x distance to C) = (',num2str(R1),'N x&nbsp',num2str(Lm),'m) - (',num2str(W),'N x&nbsp',num2str(Lm-Pm),'m) - (',num2str(W2),'N x&nbsp',num2str(Lm-P2m),'m)= 0 Nm.</p>', ...
        '<p>As the beam is ''sagging'' in this case, it is therefore showing a positive BM, and all BMs will be positive in value by convention.<p>',...
        '<p>The BMD is the integral of the SFD. Therefore a point load going upwards will generate a straight line sloping upwards on the BMD, and a point load going downwards will produce a straight line sloping downwards on the BMD.</p>', ...
        '<p>Taking this into account, the BMD looks like this in this case:</p>',...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p><br></p><p>Alternatively you can find the equations for the BMD by integrating the SFD:</p>',...
        '<p>Between points A and B:',...
        '<p>y=&nbsp',num2str(R1),'x',...
        '<p>Between points B and C:', ...
        '<p>y=&nbsp',num2str(round(m1)),'x +&nbsp',num2str(round(c1)),'',...
        '<p>Between points C and D:', ...
        '<p>y=&nbsp',num2str(round(m2)),'x +&nbsp',num2str(round(c2)),'',...
        '<p>The maximum BM occurs when the SFD crosses the x-axis, i.e.&nbsp',MAXBMLOCATION,' in this case, where the BM is&nbsp',num2str(MAXBM),' Nm (as calculated above).</p>'); 
       
            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>Review the material from the previous quiz (Reaction Forces and Free Body Diagram) if you''re having trouble with part A).</p><p>To produce the SFD (going from left to right), plot the sum of net vertical forces against distance along the beam. The SFD should always start and end at zero for a simply supported beam.</p><p>Remember - a point load or reaction force will always produce a vertical line on a SFD.</p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p><i><p>A reaction force or point force will always produce a vertical line on a SFD.</p><p>Don''t forget that in this question there are two reaction forces and two point loads to consider.</i></p>', ...
        plotString1, ...
        plotString2, ...
        plotString3);  
        
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);


