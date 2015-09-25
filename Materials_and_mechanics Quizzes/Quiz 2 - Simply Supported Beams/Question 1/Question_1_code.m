%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Combined Level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

file=fopen('combined1.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions
    
% Start Image

l=randi([10,20]);
L=l*10;

%Plotting the beam

figure(1)
y1=0;
y2=0;
x1=0;
x2=L;

axis([0 l -1.5 1.5])


plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

% Adding image ID

ID=strcat(num2str(i));

IDString=strcat('Simply Supported Beams. Level 1.Question ID #', ID);

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

%Plotting point load

p=randi([3,l-3]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load

w=randi([5,15]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

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
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

%Showing x direction

arrow([0,-1.2],[L/4,-1.2],'linewidth',2);

text(0,-1.1,'x','Fontsize',12,'fontweight','bold');

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%End image

%Calculating reaction forces

R2=((W*P)/L);
R2=round(R2);
R1=(W-R2);
R1=round(R1);
%Calculating shear force

SFA=R1;
SFB=(R1-W);
SFB=round(SFB);

%Calculating the bending moments

%Converting cm to m

Lm=L/100;
Pm=P/100;

B=(R1*Pm);
B=round(B);

%Plotting the SFD
figure(1)
plot([0,0],[0,R1],'linewidth',3,'Color','red');
hold on
plot([0,P/100],[R1,R1],'linewidth',3,'Color','red');
plot([P/100,P/100],[R1,-R2],'linewidth',3,'Color','red');
plot([P/100,L/100],[-R2,-R2],'linewidth',3,'Color','red');
plot([L/100,L/100],[-R2,0],'linewidth',3,'Color','red');
plot([0,L/100],[0,0], 'linewidth',0.1,'color','black');

grid ON

axis tight

title('Shear Force Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Shear Force (N)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

plotString2 = generateImageString(gcf, 'image2');

figure(3)
% Plotting the BMD

plot([0,P/100],[0,B],'linewidth',3,'Color','red');
hold on
plot([P/100,L/100],[B,0],'linewidth',3,'Color','red');
plot([P/100,P/100],[0,B],'linestyle','--','color','black')
A = R2*L/100; 

grid ON

axis tight

title('Bending Moment Diagram','FontSize',14, 'FontWeight','bold');

ylabel('Bending moment (Nm)','Fontsize',12,'FontWeight','bold');

xlabel('Position (m)','Fontsize',12,'FontWeight','bold');

hold off

% Plot string generation

plotString3 = generateImageString(gcf, 'image3');

 %Embedded components string generation
    
    numString_r1 = cloze_numerical(R1, 0.025*R1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(R2, 0.025*R2, 'Good job!', 'Incorrect');
    numString_SFA = cloze_numerical(SFA, 0.025*SFA, 'Good job!', 'Incorrect');
    numString_SFB = cloze_numerical(SFB, 0.025*SFB, 'Good job!', 'Incorrect');
    numString_SFC= cloze_numerical(0, 0.5, 'Good job!', 'Incorrect');
    numString_SFD_A_B = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines', 'Good job!','A line with a slope', 'Incorrect', 'A curve','Incorrect');
    numString_SFD_B_C = cloze_mcq('vertical', 2, 'Either a horizontal or vertical line', 'Incorrect','A combination of horizontal and vertical lines','Good job!', 'A line with a slope','Incorrect', 'A curve','Incorrect');
    numString_BMA = cloze_numerical(0, 0.5, 'Good job!', 'Incorrect');
    numString_BMB= cloze_numerical(B, 0.025*B, 'Good job!', 'Incorrect');
    numString_BMC= cloze_numerical(0, 0.5, 'Good job!', 'Incorrect');
    numString_BMD_A_B = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line', 'Incorrect', 'A combination of horizontal and vertical lines', 'Incorrect', 'A line with a slope','Good job!', 'A curve' ,'Incorrect');
    numString_BMD_B_C = cloze_mcq('vertical', 3, 'Either a horizontal or vertical line','Incorrect', 'A combination of horizontal and vertical lines','Incorrect', 'A line with a slope','Good job!', 'A curve','Incorrect');


% 
 %Question string joining
    questionString = strcat('<img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<p>Consider a simply supported beam as shown above with length&nbsp',num2str(L),' cm.</p>', ...
    '<p>There are two supports at either end of the beam, which generate reaction forces R1 and R2, at positions x = 0 cm and x =',num2str(L),' cm, respectively.</p>', ...
    '<p>There is an external point force acting on the beam as shown in the diagram.</p>', ...
    '<p>Using the convention that upward forces and anti-clockwise moments are positive, and the information given:', ...
    '<br><p><b>A)</b><p>Calculate the value of the reaction forces R1 and R2 to the nearest whole number.</p>', ...
    '<p>R1:&nbsp',numString_r1,'N</p>', ...
    '<p>R2:&nbsp',numString_r2,'N</p>', ...
    '<p>(NB - please carry through and use any rounded values in all subsequent calculations where necessary)</p>',...
    '<br><b>B)</b><p>Calculate and draw the Shear Force Diagram (SFD) on paper and identify the following values (to the nearest whole number):</p>', ...
    '<p>Shear force just to the right of x = 0cm (Point A):&nbsp',numString_SFA, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(P),' cm (Point B):&nbsp',numString_SFB, 'N</p>', ...
    '<p>Shear force just to the right of x =&nbsp',num2str(L),' cm (Point C):&nbsp',numString_SFC, 'N</p>', ...
    '<br>From the options below indicate how the following points are connected in the SFD:', ...
    '<p>1) Points A and B:</p><p>',numString_SFD_A_B, ...
    '<p>2) Points B and C:</p><p>',numString_SFD_B_C, ...
    '<br><b>C)</b><p>Calculate and draw the Bending Moment Diagram (BMD) on paper and identify the following values (to the nearest whole number):', ...
    '<p>Bending moment at Point A:&nbsp',numString_BMA,'Nm</p>', ...
    '<p>Bending moment at Point B:&nbsp',numString_BMB,'Nm</p>', ...
    '<p>Bending moment at Point C:&nbsp',numString_BMC,'Nm</p>', ...
    '<br>From the options below indicate how the following points are connected in the BMD:', ...
    '<p>1) Points A and B:</p><p>',numString_BMD_A_B, ...
    '<p>2) Points B and C:</p><p>',numString_BMD_B_C);
    
    generalfeedbackString=strcat('<b><p>Part A)</b><p><p>Review the material from the previous quiz (Reaction Forces and Free Body Diagram) if you''re having trouble with this section.</p>', ...
        '<p><b>Part B)</b></p><p>To produce the SFD (going from left to right), plot the sum of net vertical forces against position along the beam. The SFD should always start and end at zero for a simply supported beam.</p>', ...
        'In this case the SFD can be defined by the following co-ordinates:', ...
        '<p>(0,0), (0,',num2str(R1),'), (',num2str(P/100),',',num2str(R1),'), (',num2str(P/100),',',num2str(-R2),'), (',num2str(L/100),',',num2str(-R2),'), (',num2str(L/100),', 0).</p>', ...
        '<p>The SFD in this case looks like this:</p>', ...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
        '<p><br></p><b>Part C)</b></p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p>',...
        '<p>Because of this, the BM at the start and end of the beam is zero.</p>',...
        '<p>(To clarify this point: at the start and end of the beam, the beam is not subjected to two or more opposing forces, and therefore no bending will occur.)</p>',...
        '<p>Considering forces to the left of the point of interest:</p>',...
        '<p>BM at point A = 0 Nm.</p>',...
        '<p>BM at point B = (R1 x distance to R1) = (',num2str(R1),'N x&nbsp',num2str(P/100),'m) =&nbsp',num2str(B),' Nm.</p>', ...
        '<p>BM at point C = (R1 x distance to R1) - (Force at point B x distance to point B) = (',num2str(R1),'N x&nbsp',num2str(L/100),'m) - (',num2str(W),'N x&nbsp',num2str((L-P)/100),'m) = 0 Nm.</p>', ...
        '<p>As the beam is ''sagging'' in this case, it is therefore showing a positive BM, and all BMs will be positive in value by convention.<p>',...
        '<p>The BMD is the integral of the SFD. Therefore a point load going upwards will generate a straight line sloping upwards on the BMD, and a point load going downwards will produce a straight line sloping downwards on the BMD.</p>', ...
        '<p>Taking this into account, the BMD looks like this in this case:</p>',...
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p><br></p><p>Alternatively you can find the equations for the BMD by integrating the SFD:</p>',...
        '<p>Between points A and B:',...
        '<p>y=&nbsp',num2str(R1),'x',...
        '<p>Between points B and C:', ...
        '<p>y=&nbsp',num2str(-R2),'x +&nbsp',num2str(round(A)),'',...
        '<p>The maximum BM occurs when the SFD crosses the x-axis, i.e. at point B in this case, where the BM is&nbsp',num2str(B),' Nm (as calculated above).</p>'); 
       
       
            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>Review the material from the previous quiz (Reaction Forces and Free Body Diagram) if you''re having trouble with part A).</p><p>To produce the SFD (going from left to right), plot the sum of net vertical forces against distance along the beam. The SFD should always start and end at zero for a simply supported beam.</p><p>Remember - a point load or reaction force will always produce a vertical line on a SFD.</p><p>To calculate the bending moment (BM) at any given position along the beam, one needs to consider the loads only to the left or right of the position of the beam under consideration.</p>',...
        plotString1, ...
        plotString2, ...
        plotString3);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
