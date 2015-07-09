%Generates *.xml scripts for Moodle Drag and Drop
%question name - Free Body Diagram
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


% Asks students to complete a free body diagram for a simply supported beam with reaction forces at either end, 2 UDLs and a point load.
% This script does not complete the creation of this question. A lot was done manually, within moodle (mainly image generation done here).

FBD200=fopen('FBD200.xml','w');

fprintf(FBD200,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(FBD200,'\n%s','<quiz>');

for i=1:1:30

%CREATING IMAGES    
    
l=200;

%plotting the beam
y1=0;
y2=0;
x1=0;
x2=l;

a = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-0 200 -1.5 1.5])

title('Simply Supported Beam','FontSize',12,'FontWeight', 'bold')

axis off

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(1,1.4,l_unit,'FontSize',12, 'FontWeight','bold')

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0],'LineWidth',3)

text(0,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([l,-0.75],[l,0],'LineWidth',3)

text(l,-0.85,'R2')



%scaling

for q=0:10:90
    plot([q,q],[-0.1,0],'Color','black','linewidth',3);
end

for q=110:10:l
    plot([q,q],[-0.1,0],'Color','black','linewidth',3);
end

for q=100
    plot([q,q],[-0.2,0],'Color','black','linewidth',3);
    text(93,-0.30,'100cm','fontsize',12,'fontweight','bold');
end

%Plotting 1st distributed load

x1=randi([0,4]);
x2=randi([(x1+1),9]);

X1=x1*10;
X2=x2*10;

plot([X1,X2],[0.08,0.08],'Color','red','linewidth',11);

%Plotting 2nd distributed load

x3=randi([11,15]);
x4=randi([(x3+1),20]);

X3=x3*10;
X4=x4*10;

plot([X3,X4],[0.08,0.08],'Color','red','linewidth',11);

%Plotting point load
 
p=randi([7,13]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling distributed loads

m1=5*(x2-x1);
m2=10*(x4-x3);

mid1=(X1+X2)/2;
mid2=(X3+X4)/2;

m1_label=strcat(num2str(m1),'kg');
m2_label=strcat(num2str(m2),'kg');

text(mid1-5,0.2,m1_label,'fontsize',12,'fontweight','bold');
text(mid2-5,0.2,m2_label,'fontsize',12,'fontweight','bold');

%Labelling point load

w=randi([5,10]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

hold off

imga=strcat('FBD200a_',num2str(i),'.jpg');

saveas(a,imga)

%2nd image

b = plot([0,200],[0,0],'Color','black','linewidth',5);

hold on

axis([-0 200 -2 1.1])

axis off

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0],'linewidth',3)

text(0,-0.85,'R1','fontsize',12,'fontweight','bold')

arrow([l,-0.75],[l,0],'linewidth',3)

text(l,-0.85,'R2','fontsize',12,'fontweight','bold')

%plotting arrows

%Point load

arrow([P,0.8],[P,0],'linewidth',3)

%Distributed loads

arrow([mid1,0.8],[mid1,0],'linewidth',3);
arrow([mid2,0.8],[mid2,0],'linewidth',3);

%Acconting for weight of the beam

B=20*15;

arrow([100,0],[100,-0.8],'linewidth',3)

%Drawing arrows to indicate distance from R1

arrow([mid1/2,0.1],[mid1,0.1],'linewidth',2);
arrow([mid1/2,0.1],[0,0.1],'linewidth',2);

arrow([50,-0.1],[100,-0.1],'linewidth',2);
arrow([50,-0.1],[0,-0.1],'linewidth',2);

arrow([P/2,0.6],[P,0.6],'linewidth',2);
arrow([P/2,0.6],[0,0.6],'linewidth',2);

arrow([mid2/2,-0.55],[mid2,-0.55],'linewidth',2);
arrow([mid2/2,-0.55],[0,-0.55],'linewidth',2);

plot([mid2,mid2],[0,-0.55],'linewidth',1,'linestyle','--','Color','black');

%Providing a space for recation forces calculation

text(80,-1.5,'R1 =','fontsize',12,'fontweight','bold');
text(80,-1.8,'R2 =','fontsize',12,'fontweight','bold');

imgb=strcat('FBD200b_',num2str(i),'.jpg');

saveas(b,imgb)

hold off

%CALCULATING REACTION FORCES

%Correct
 
r2=(2000*100+m1*10*mid1+W*P+m2*10*mid2)/200;
r1=m1*10+W+m2*10+2000-r2;

%Incorrect

r2_wrong=(2000*100+m1*mid1+W*P+m2*mid2)/200;
r1_wrong=m1+W+m2+2000-r2_wrong;

%GENERATING XML

fprintf(FBD200,'\n<!--question:%d-->',i);
fprintf(FBD200,'\n%s','<question type="ddimageortext">');
fprintf(FBD200,'\n%s','<name>');
fprintf(FBD200,'\n<text>FBD200 %d</text>',i);
fprintf(FBD200,'\n%s','</name>');
fprintf(FBD200,'\n%s','<questiontext format="html">');
fprintf(FBD200,'\n%s','<text><![CDATA[<p style="text-align: center;">');
%Adding the image
fprintf(FBD200,'%s','<img style="width: 442px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(FBD200,' src="http://www.ucl.ac.uk/~wmapsfl/moodle/FBD200/FBD200a_%d.jpg"',i);
fprintf(FBD200,'%s',' alt="beamplot" height="294" /></p>');
%%%%%%%%
fprintf(FBD200,'\n%s','<p style="text-align: center;"> </p>');
fprintf(FBD200,'\n%s','<p style="text-align: center;">Below is an incomplete Free Body Diagram.</p>');
fprintf(FBD200,'\n%s','<p style="text-align: center;">Use the information given in the image above and the knowledge that the beam weighs 10N/cm to complete the Free Body Diagram.</p>');
fprintf(FBD200,'\n%s','<p style="text-align: center;">You should indicate both the values of the loads and the distance from the starting point of the beam.</p>');
fprintf(FBD200,'\n%s','<p style="text-align: center;">Use the completed Free Body Diagram to determine the magnitude of the reaction forces, R1 and R2.</p>');
fprintf(FBD200,'\n%s','<p style="text-align: center;">(For the purposes of this question, you may assume g=10 ms<sup>-2</sup>.</p>]]></text>');
fprintf(FBD200,'\n%s','</questiontext>');
fprintf(FBD200,'\n%s','<generalfeedback format="html">');
fprintf(FBD200,'\n%s','<text><![CDATA[<p>When drawing Free Body Diagrams, Uniformly Distributed Loads (UDLs) are represented as a point load at the midpoint of the UDL.</p>');
fprintf(FBD200,'\n%s','<p>Do not forget to convert mass in kilograms to weight in Newtons before attempting the question.</p>]]></text>');
fprintf(FBD200,'\n%s','</generalfeedback>');
fprintf(FBD200,'\n%s','<defaultgrade>10</defaultgrade>');
fprintf(FBD200,'\n%s','<penalty>0</penalty>');
fprintf(FBD200,'\n%s','<hidden>0</hidden>');
fprintf(FBD200,'\n%s','<shuffleanswers/>');
fprintf(FBD200,'\n%s','<correctfeedback format="html">');
fprintf(FBD200,'\n%s','<text><![CDATA[<p>Excellent! You got them all correct.</p>]]></text>');
fprintf(FBD200,'\n%s','</correctfeedback>');
fprintf(FBD200,'\n%s','<partiallycorrectfeedback format="html">');
fprintf(FBD200,'\n%s','<text><![CDATA[<p>Sorry. You missed some of those. Try again.</p>]]></text>');
fprintf(FBD200,'\n%s','</partiallycorrectfeedback>');
fprintf(FBD200,'\n%s','<incorrectfeedback format="html">');
fprintf(FBD200,'\n%s','<text><![CDATA[<p>I''m sorry. That answer was incorrect. Please try again.</p>]]></text>');
fprintf(FBD200,'\n%s','</incorrectfeedback>');
fprintf(FBD200,'\n%s','<shownumcorrect/>');

%Insert something for second image here
fprintf(FBD200,'\n%s','<file name="FBD200b_600x400.jpg" encoding="base64">/</file>');

w2=m2*10;
w1=m1*10;
WW=W*10;

fprintf(FBD200,'\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>1</no>');

%w1=m1*10;

fprintf(FBD200,'\n<text>%dN</text>',w1);
fprintf(FBD200,'\n%s','<draggroup>1</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>2</no>');
fprintf(FBD200,'\n<text>%dN</text>',m1);
fprintf(FBD200,'\n%s','<draggroup>1</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>3</no>');
fprintf(FBD200,'\n<text>%dN</text>',W);
fprintf(FBD200,'\n%s','<draggroup>1</draggroup>');
fprintf(FBD200,'\n%s','</drag>');



fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>4</no>');

%WW=W*10;

fprintf(FBD200,'\n<text>%dN</text>',WW);
fprintf(FBD200,'\n%s','<draggroup>1</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>5</no>');

%w2=m2*10;

fprintf(FBD200,'\n<text>%dN</text>',w2);
fprintf(FBD200,'\n%s','<draggroup>1</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>6</no>');
fprintf(FBD200,'\n<text>%dN</text>',m2);
fprintf(FBD200,'\n%s','<draggroup>1</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>7</no>');
fprintf(FBD200,'\n<text>%dN</text>',200);
fprintf(FBD200,'\n%s','<draggroup>2</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>8</no>');
fprintf(FBD200,'\n<text>%dN</text>',2000);
fprintf(FBD200,'\n%s','<draggroup>2</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

for k=1:1:40
    
    no=k+8;
    value=k*5;
    
    fprintf(FBD200,'\n\n%s','<drag>');
    fprintf(FBD200,'\n<no>%d</no>',no);
    fprintf(FBD200,'\n<text>%dcm',value);
    fprintf(FBD200,'%s','</text>');
    fprintf(FBD200,'\n%s','<draggroup>3</draggroup>');
    fprintf(FBD200,'\n%s','</drag>');
end

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>49</no>');
fprintf(FBD200,'\n<text>%4.0fN</text>',r1);
fprintf(FBD200,'\n%s','<draggroup>4</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>50</no>');
fprintf(FBD200,'\n<text>%4.0fN</text>',r2);
fprintf(FBD200,'\n%s','<draggroup>4</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>51</no>');
fprintf(FBD200,'\n<text>%4.0fN</text>',r1_wrong);
fprintf(FBD200,'\n%s','<draggroup>4</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drag>');
fprintf(FBD200,'\n%s','<no>52</no>');
fprintf(FBD200,'\n<text>%4.0fN</text>',r2_wrong);
fprintf(FBD200,'\n%s','<draggroup>4</draggroup>');
fprintf(FBD200,'\n%s','</drag>');

fprintf(FBD200,'\n\n%s','<drop>');
fprintf(FBD200,'\n%s','<text></text>');
fprintf(FBD200,'\n%s','<no>1</no>');
fprintf(FBD200,'\n%s','<choice>1</choice>');
fprintf(FBD200,'\n%s','<xleft>138</xleft>');
fprintf(FBD200,'\n%s','<ytop>32</ytop>');
fprintf(FBD200,'\n%s','</drop>');

fprintf(FBD200,'\n\n%s','<drop>');
fprintf(FBD200,'\n%s','<text></text>');
fprintf(FBD200,'\n%s','<no>2</no>');
fprintf(FBD200,'\n%s','<choice>3</choice>');
fprintf(FBD200,'\n%s','<xleft>297</xleft>');
fprintf(FBD200,'\n%s','<ytop>32</ytop>');
fprintf(FBD200,'\n%s','</drop>');

fprintf(FBD200,'\n\n%s','<drop>');
fprintf(FBD200,'\n%s','<text></text>');
fprintf(FBD200,'\n%s','<no>3</no>');
fprintf(FBD200,'\n%s','<choice>5</choice>');
fprintf(FBD200,'\n%s','<xleft>351</xleft>');
fprintf(FBD200,'\n%s','<ytop>32</ytop>');
fprintf(FBD200,'\n%s','</drop>');

fprintf(FBD200,'\n\n%s','<drop>');
fprintf(FBD200,'\n%s','<text></text>');
fprintf(FBD200,'\n%s','<no>4</no>');
fprintf(FBD200,'\n%s','<choice>8</choice>');
fprintf(FBD200,'\n%s','<xleft>255</xleft>');
fprintf(FBD200,'\n%s','<ytop>232</ytop>');
fprintf(FBD200,'\n%s','</drop>');

fprintf(FBD200,'\n\n%s','<hint format="html">');
fprintf(FBD200,'\n%s','<text></text>');
fprintf(FBD200,'\n%s','<clearwrong/>');
fprintf(FBD200,'\n%s','</hint>');

fprintf(FBD200,'\n%s','</question>');

end
fprintf(FBD200,'\n%s','</quiz>');