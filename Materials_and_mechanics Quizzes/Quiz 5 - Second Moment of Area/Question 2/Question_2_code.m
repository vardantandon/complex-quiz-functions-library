%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - I beam level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


file=fopen('ibeam2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100

ID=strcat(num2str(i));

IDString=strcat('Second Moment of Area. Level 2.Question ID #', ID);   
    
%%%%%%%START PLOTTING I-BEAM%%%%%%%%%%%%%%%

W=randi([20,30]);
plot([0,W],[0,0],'Color','black','linewidth',5);

hold on

title('Second Moment of Area','FontSize',20, 'FontWeight','bold');

text(W+5, -20, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

l1=randi([10,15]);
plot([0,0],[0,l1],'Color','black','linewidth',5);

plot([W,W],[0,l1],'Color','black','linewidth',5);

w=randi([7,12]);
a=(W-w)/2;
b=a+w;
plot([0,a],[l1,l1],'Color','black','linewidth',5);
plot([b,W],[l1,l1],'Color','black','linewidth',5);

l2=randi([20,30]);
plot([a,a],[l1,(l1+l2)],'Color','black','linewidth',5);
plot([b,b],[l1,(l1+l2)],'Color','black','linewidth',5);

plot([0,a],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);
plot([b,W],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);

L=(2*l1)+l2;

l3=l1;

w1=W;

plot([0,0],[(l1+l2),L],'Color','black','linewidth',5);
plot([W,W],[(l1+l2),L],'Color','black','linewidth',5);

plot([0,W],[L,L],'Color','black','linewidth',5);

axis([-15 (W+10) -20 (L+10)])
axis off

%labelling the beam

arrow([(W/2),-5],[W,-5],'linewidth',2);
arrow([(W/2),-5],[0,-5],'linewidth',2);

arrow([-5,(L/2)],[-5,L],'linewidth',2);
arrow([-5,(L/2)],[-5,0],'linewidth',2);

arrow([(a-2.5),(L/2)],[(a-2.5),(l1+l2)],'linewidth',2);
arrow([(a-2.5),(L/2)],[(a-2.5),l1],'linewidth',2);

arrow([(W/2),(l1+2.5)],[a,(l1+2.5)],'linewidth',2);
arrow([(W/2),(l1+2.5)],[b,(l1+2.5)],'linewidth',2);


Wlabel=strcat(num2str(W),'mm');
Llabel=strcat(num2str(L),'mm');
wlabel=strcat(num2str(w),'mm');
llabel=strcat(num2str(l2),'mm');

text((W/2.5),-10,Wlabel,'fontsize',12,'fontweight','bold');
text(-12,(L/2),Llabel,'fontsize',12,'fontweight','bold');
text((W/2.5),(l1-2.5),wlabel,'fontsize',12,'fontweight','bold');
text((a-9),(L/2),llabel,'fontsize',12,'fontweight','bold');
text(W+1,l1/2,'a','fontsize',12,'fontweight','bold');
text(W+1,l1+l2+l1/2,'a','fontsize',12,'fontweight','bold');
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
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+4*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
text (c+0.1, e-d ,'Level 2','FontWeight', 'bold', 'fontsize',15)

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

y1=L-(l3/2);
y2=l1+(l2/2);
y3=(l1/2);

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
    numString_xcentre = cloze_numerical((round(x_cm*10)/10), 0.025*x_cm, 'Good job!', 'Incorrect');
    numString_ycentre = cloze_numerical((round(y_cm*10)/10),0.025*y_cm, 'Good job!', 'Incorrect');
    numString_x2MOM = cloze_numerical(round(Ix), 0.025*Ix, 'Good job!', 'Incorrect');
    numString_y2MOM = cloze_numerical(round(Iy), 0.025*Iy, 'Good job!', 'Incorrect');

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p><b>A)</b></p><p>Given an I-beam with dimensions as indicated in the image above,',...
    ' find the x and y coordinates of the centroid in mm, to 1.d.p.</p>',...
    '<p>Centroid = (', numString_xcentre,',', numString_ycentre,') mm.</p>',...
    '<p><b>B)</b></p><p>Calculate the second moments of area of the I-beam with respect to both x and y.</p>',...
    '<p>Give your answer to the nearest whole number and in mm<sup>4</sup>.',...
    '<p>I<sub>x</sub> = ', numString_x2MOM,' mm<sup>4</sup>.',...
    '<p>I<sub>y</sub> = ', numString_y2MOM,' mm<sup>4</sup>.');

    generalfeedbackString=strcat('<p><b>PART A</b></p><p>The shape is symmetrical in both x and y, so the centroid is right in the middle of the area.</p>',...
    '<p><b>PART B</b></p><p>First, consider this beam as one large rectangle with two equal rectangles subtracted from it. All three rectangles are symmetrical about the same x-axis, and therefore share the same neutral axis.</p>',...
    '<p>Therefore:</p><p>I<sub>x</sub> = (BD<sup>3</sup>/12) - 2(bd<sup>3</sup>/12)</p>',...
    '<p>I<sub>x</sub> = (',num2str(W),'x',num2str(L),'<sup>3</sup>/12) - 2(',num2str(a),'x',num2str(l2),'<sup>3</sup>/12)</p>',...
    '<p>Next, consider this beam as three rectangles added together. All three rectangles are symmetrical about the same y-axis, and therefore share the same neutral axis.</p>',...
    '<p>Therefore:</p><p>I<sub>y</sub> = I<sub>y1</sub> + I<sub>y2</sub> + I<sub>y3</sub></p><p>Using the formula for a rectangle for each section, this becomes:</p>',...
    '<p>I<sub>y</sub> = (',num2str(l2),'x',num2str(w),'<sup>3</sup>/12) + 2(',num2str(l1),'x',num2str(W),'<sup>3</sup>/12)</p>');
           
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
