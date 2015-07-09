%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Simply supported level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


%This MATLAB script creates an XML file, containing multiple Cloze
%questions which can be uploaded to Moodle.

%This is for the Level 1, simply supported beam question type, i.e. 1 point
%load and two reaction forces at either end of the beam.

%This script incorporates adding an image to the Moodle question

ssb1=fopen('ssb1_reaction_forces.xml','w'); %Writes .xml file

fprintf(ssb1,'%s','<?xml version="1.0" encoding="UTF-8"?>'); %fprint writes to the specified file
fprintf(ssb1,'\n%s','<quiz>');

global i

for i = 1:1:100 %Loop used to create multiple questions
    
%START IMAGE GENERATION

l = randi([20,200]); %generates a beam of length between 20 and 200 cm

%plotting the beam
y1=0;
y2=0;
x1=0;
x2=l;

a = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([0 l -1.5 1.5])

axis off

title('Simply Supported Beam')

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(1,1.4,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

hold off

%Plotting point load

w=randi([8,15]);

p=randi([round(l/4),round(3*l/4)]);

arrow([p,0.75],[p,0])

W=num2str(w);

Unit='N';

Weight=strcat(W,Unit);

text(p-1,0.85,Weight)

%position of point load

position=strcat(num2str(p),unit);

text(p-1.5, -0.1, position)

%Plotting position A

text(0,0.1,'A')

%saving plot as an image 

beamplot=strcat('beamplot',num2str(i),'.png');

saveas(a,beamplot,'png')

%%%%END Creating image for the question%%%%

%%%%START Calculating reaction forces%%%%

r2=(w*p)/l;

r1=(w-r2);

%END IMAGE GENERATION

%START WRITING XML CODE FOR CLOZE QUESTION

fprintf(ssb1,'<!-- question %d -->',i);
fprintf(ssb1,'\n%s','<question type="cloze">');
fprintf(ssb1,'\n%s','<name>');
fprintf(ssb1,'\n%s','<text>Simply supported beams. Finding reaction forces. Level 1</text>');
fprintf(ssb1,'\n%s','</name>');
fprintf(ssb1,'\n%s','<questiontext format="html">');

%Adding image 
fprintf(ssb1,'\n%s','<text><![CDATA[<p><img style="width: 626px; height: 495px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(ssb1,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/simplysupported/beamplot%d.png" alt="Beamplot" width="28" height="30"/></p>',i);

fprintf(ssb1,'\n <p style="text-align: left;">A simply supported beam of length %d cm is shown in the figure above. There are two reaction forces, R1 and R2, one at either end of the beam. There is an external force of %d N acting at a point %d cm from point A.</p>',l,w,p );
fprintf(ssb1,'\n%s', '<p style="text-align: left;">By resolving forces and taking moments about A, determine the magnitude of reaction forces, R1 and R2.</p>');
fprintf(ssb1,'\n%s', '<p style="text-align: left;">Write your answer correct to 2 d.p.</p>');
fprintf(ssb1,'\n <p style="text-align: center;">R1 = {1:NUMERICAL:=%6.2f:0.01#Good job!',r1);
fprintf(ssb1,'%s','~%0%*#Sorry. Try again.} N </p>');
fprintf(ssb1,'\n <p style="text-align: center;">R2 = {1:NUMERICAL:=%6.2f:0.01#Good job!',r2);
fprintf(ssb1,'%s','~%0%*#Sorry. Try again.} N </p>');
fprintf(ssb1,'%s',']]></text>');

fprintf(ssb1,'\n%s','</questiontext>');
fprintf(ssb1,'\n%s','<generalfeedback format="html">');
fprintf(ssb1,'\n%s','<text><![CDATA[<p>Remember that when resolving forces, the sum of the upward forces must be equal to the sum of the downward forces.</p><p>For a system in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p>]]></text>');
fprintf(ssb1,'\n%s','</generalfeedback>');
fprintf(ssb1,'\n%s','<penalty>0</penalty>');
fprintf(ssb1,'\n%s','<hidden>0</hidden>');
fprintf(ssb1,'\n%s','</question>');

%END WRITING XML CODE FOR CLOZE QUESTION
end

fprintf(ssb1,'\n%s','</quiz>');

