%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - I beam level 2
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

file=fopen('ibeam3-1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:50

ID=strcat(num2str(i));

IDString=strcat('Second Moment of Area. Level 3.Question ID 1#', ID); 

    
%%%%%%%START PLOTTING I-BEAM%%%%%%%%%%%%%%%
    
    %Plotting the beam

W=randi([20,30]);
m=plot([0,W],[0,0],'Color','black','linewidth',5);

hold on

title('Second Moment of Area','FontSize',20, 'FontWeight','bold');



l1=randi([10,15]);
plot([0,0],[0,l1],'Color','black','linewidth',5);

plot([W,W],[0,l1],'Color','black','linewidth',5);

w=randi([7,12]);
a=(W-w)/2;
b=a+w;
plot([0,a],[l1,l1],'Color','black','linewidth',5);
plot([b,W],[l1,l1],'Color','black','linewidth',5);

text(W+5, -20, strcat('Question ID 1#', ID),'fontsize',8,'fontweight','bold');

l2=randi([20,30]);
plot([a,a],[l1,(l1+l2)],'Color','black','linewidth',5);
plot([b,b],[l1,(l1+l2)],'Color','black','linewidth',5);

plot([0,a],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);
plot([b,W],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);

l3=randi([16,20]);

%random integer l3
%L=l1+l2+l3

w1=W;

L=l1+l2+l3;

plot([0,0],[(l1+l2),L],'Color','black','linewidth',5);
plot([W,W],[(l1+l2),L],'Color','black','linewidth',5);

plot([0,W],[L,L],'Color','black','linewidth',5);

axis([-15 (W+10) -20 (L+10)])
axis off

%labelling the beam

%Also label l1 and l3 on rhs of diagram

arrow([(W/2),-5],[W,-5],'linewidth',2);
arrow([(W/2),-5],[0,-5],'linewidth',2);

arrow([-5,(L/2)],[-5,L],'linewidth',2);
arrow([-5,(L/2)],[-5,0],'linewidth',2);

arrow([(a-2.5),(L/2)],[(a-2.5),(l1+l2)],'linewidth',2);
arrow([(a-2.5),(L/2)],[(a-2.5),l1],'linewidth',2);

arrow([(W/2),(l1+2.5)],[a,(l1+2.5)],'linewidth',2);
arrow([(W/2),(l1+2.5)],[b,(l1+2.5)],'linewidth',2);

arrow([(W+2.5),(l1+l2+l3/2)],[(W+2.5),(L)],'linewidth',2);
arrow([(W+2.5),(l1+l2+l3/2)],[(W+2.5),l1+l2],'linewidth',2);

Wlabel=strcat(num2str(W),'mm');
Llabel=strcat(num2str(L),'mm');
wlabel=strcat(num2str(w),'mm');
llabel=strcat(num2str(l2),'mm');
l1label=strcat(num2str(l1),'mm');

text((W/2.5),-10,Wlabel,'fontsize',12,'fontweight','bold');
text(-12,(L/2),Llabel,'fontsize',12,'fontweight','bold');
text((W/2.5),(l1-2.5),wlabel,'fontsize',12,'fontweight','bold');
text((a-9),(L/2),llabel,'fontsize',12,'fontweight','bold');
text((W+4),(l1+l2+l3/2),l1label,'fontsize',12,'fontweight','bold');

text(a/2,l1-3,'b','fontsize',12,'fontweight','bold');
text(b+a/2,l1-3,'b','fontsize',12,'fontweight','bold');
text(a/2,l1+l2+3,'b','fontsize',12,'fontweight','bold');
text(b+a/2,l1+l2+3,'b','fontsize',12,'fontweight','bold');

%Indicating level (c = x start location, d= diameter, e= y plane location)
c=-15; 
d=2;
e=-20;
rectangle('Position',[c,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+d,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+4*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
text (c+0.1, e-d ,'Level 3','FontWeight', 'bold', 'fontsize',15)

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

%%%%%%%%%%%%%END PLOTTING I-BEAM%%%%%%%%%%%%%

%%%%%%%%%%%%%START CALCULATING ANSWERS%%%%%%%%%%%%%

%Centroid

A1=l3*w1;
A2=l2*w;
A3=l1*W;

AT=A1+A2+A3;

% y1=L-(l3/2);
% y2=l1+(l2/2);   incorrect EJ
% y3=(l1/2);

y1=(l3/2);
y2=l3+(l2/2);
y3=l3+l2+(l1/2);

y_cm=((A1*y1)+(A2*y2)+(A3*y3))/AT;

x1=w1/2;
x2=a+(w/2);
x3=W/2;

x_cm=((A1*x1)+(A2*x2)+(A3*x3))/AT;

%Ix and Iy

%wrt x

d1_x=y1-y_cm;
d2_x=y2-y_cm;
d3_x=y3-y_cm;

%wrt y

d1_y=x1-x_cm;
d2_y=x2-x_cm;
d3_y=x3-x_cm;

I_NA_x_1=w1*(l3^3)/12;
I_NA_x_2=w*(l2^3)/12;
I_NA_x_3=W*(l1^3)/12; 

IX_1=I_NA_x_1+A1*(d1_x^2);
IX_2=I_NA_x_2+A2*(d2_x^2);
IX_3=I_NA_x_3+A3*(d3_x^2);

Ix=IX_1+IX_2+IX_3;

I_NA_y_1=l3*(w1^3)/12;
I_NA_y_2=l2*(w^3)/12;
I_NA_y_3=l1*(W^3)/12;

IY_1=I_NA_y_1+A1*(d1_y^2);
IY_2=I_NA_y_2+A2*(d2_y^2);
IY_3=I_NA_y_3+A3*(d3_y^2);

Iy=IY_1+IY_2+IY_3;

%%%%%%%%%%%%%END CALCULATING ANSWERS%%%%%%%%%%%%%

    numString_xcentre = cloze_numerical(round(x_cm*10)/10, 0.025*x_cm, 'Good job!', 'Incorrect');
    numString_ycentre = cloze_numerical(round(y_cm*10)/10,0.025*y_cm, 'Good job!', 'Incorrect');
    numString_x2MOM = cloze_numerical(round(Ix), 0.025*Ix, 'Good job!', 'Incorrect');
    numString_y2MOM = cloze_numerical(round(Iy), 0.025*Iy, 'Good job!', 'Incorrect');

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p><p><b>A)</b></p>Given an I-beam with dimensions as indicated in the image above,',...
    ' find the x and y coordinates of the centroid in mm, to 1.d.p.</p>',...
    '<p>Centroid = (', numString_xcentre,',', numString_ycentre,') mm.</p>',...
    '<p><p><b>B)</b></p>Calculate the second moments of area of the I-beam with respect to both x and y.</p>',...
    '<p>Give your answer to the nearest whole number and in mm<sup>4</sup>.',...
    '<p>I<sub>x</sub> = ', numString_x2MOM,' mm<sup>4</sup>.',...
    '<p>I<sub>y</sub> = ', numString_y2MOM,' mm<sup>4</sup>.');

    generalfeedbackString=strcat('',...
    '<p><b>PART A</b></p><p>As this beam is symmetrical about the y-axis, the centre of mass with respect to the x-axis is simply the midpoint on the x-plane.</p>',...
    '<p>As this beam is not symmetrical about the x-axis, the centre of mass with respect to the y-axis can be calculated as follows:</p><p>((Area<sub>1</sub> x centroid<sub>y1</sub>) + (Area<sub>2</sub> x centroid<sub>y2</sub>) + (Area<sub>3</sub> x centroid<sub>y3</sub>)) / Area<sub>total</sub>',...
    '<p>Where centroid<sub>y1</sub>, centroid<sub>y2</sub>, and centroid<sub>y3</sub> are the distances from the centre of each rectangle to the base of the I-beam, respectively.</p>',...
    '<p>This equation therefore becomes:</p>',...;
    '<p>((',num2str(A1),' x&nbsp',num2str(y1),') + (',num2str(A2),' x&nbsp',num2str(y2),') + (',num2str(A3),' x&nbsp',num2str(y3),') /&nbsp',num2str(AT),'</sub>)</p>',...
    '<p><b>PART B</b></p><p>As the beam is symmetrical about the y-axis, and therefore all of the three component rectangles share the same neutral axis in the y direction, use the following formula to calculate the second moment of area with respect to the y-axis (as per the principles of question 2 of this quiz):</p>',...
    '<p>I<sub>y</sub> = I<sub>y1</sub> + I<sub>y2</sub> + I<sub>y3</sub></p>',...
    '<p></p><p>As the shape is not symmetrical about the x-axis, you will need to use the parallel axis theorem to calculate the second moment of area with respect to x, as follows:</p>',...
    '<p>I<sub>Total</sub> = I<sub>XX1</sub>+ I<sub>XX2</sub>+ I<sub>XX3</sub> = $$\\small\\sum$$[I<sub>NAi</sub> + (A<sub>i</sub> x d<sub>i</sub><sup>2</sup>)].</p>',....
    '<p>Where:</p><p>I<sub>NAi</sub> = the second moment of area of the respective rectangle (when viewed in isolation).</p>',...
    '<p>A<sub>i</sub> = the area of the respective rectangle.</p>',...
    '<p>d<sub>i</sub> = the difference between the y-centroid of the respective rectangle and the y-centroid of the whole I-beam.</p>',...
    '<p>Therefore:</p>',...
    '<p>I<sub>XX1</sub> = [(',num2str(w1),'x',num2str(l3),'^3)/12) + (',num2str(A1),' x&nbsp',num2str(d1_x),'^2)]</p>',...
    '<p>I<sub>XX2</sub> = [(',num2str(w),'x',num2str(l2),'^3)/12) + (',num2str(A2),' x&nbsp',num2str(d2_x),'^2)]</p>',...
    '<p>I<sub>XX3</sub> = [(',num2str(W),'x',num2str(l1),'^3)/12) + (',num2str(A3),' x&nbsp',num2str(d3_x),'^2)]</p>',...
    '<p>I<sub>Total</sub> is then calculated by adding these three values together.</p>');
           
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>There are various options to answer this question, and depending on which one you choose, you might need to use the parallel axis theorem to calculate either I<sub>x</sub>, or I<sub>y</sub>, or both!</p><p>Consider this beam as three individual rectangles in order to solve this problem.</p>', ...
        plotString1, ...
        '', ...
        '', ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
