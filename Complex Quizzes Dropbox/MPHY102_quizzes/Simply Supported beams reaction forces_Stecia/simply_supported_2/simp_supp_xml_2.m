%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Simply supported level 2
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0


%This MATLAB script creates an XML file, containing multiple Cloze
%questions which can be uploaded to Moodle.

%This is for the Level 2, simply supported beam question type, i.e. 2 point
%loads and two reaction forces at either end of the beam.

%This script incorporates adding an image to the Moodle question

ssb2=fopen('ssb2_reaction_forces.xml','w'); %Writes .xml file

fprintf(ssb2,'%s','<?xml version="1.0" encoding="UTF-8"?>'); %fprint writes to the specified file
fprintf(ssb2,'\n%s','<quiz>');

global j

for j = 1:1:100
    
%START IMAGE GENERATION

l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

%plotting the beam
y1=0;
y2=0;
x1=0;
x2=l;

b = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

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

%Plotting point loads

w1=randi([8,15]);

p1=randi([round(l/8),round(l/2)]);

arrow([p1,0.75],[p1,0])

W1=num2str(w1);

Unit='N';

Weight1=strcat(W1,Unit);

text(p1-1,0.85,Weight1)

%2

w2=randi([8,15]);

p2=randi([round(l/2),round(7*l/8)]);

arrow([p2,0.75],[p2,0])

W2=num2str(w2);

Unit='N';

Weight2=strcat(W2,Unit);

text(p2-1,0.85,Weight2)

%position of point loads

position1=strcat(num2str(p1),unit);

text(p1-1.5, -0.1, position1)

%2

position2=strcat(num2str(p2),unit);

text(p2-1.5, -0.1, position2)

%Plotting position A

text(0,0.1,'A')

%This marks the end of the plotting process for this question. [Hopefully
%we an use this in a GUI]

beamplot = strcat('2_beamplot',num2str(j),'.png');

saveas(b,beamplot,'png')

%END IMAGE GENERATION

%%%%START Calculating reaction forces%%%% -------CHANGE---------

r2=((p1*w1)+(p2*w2))/l;

r1=(w1+w2-r2);

%START WRITING XML CODE FOR CLOZE QUESTION

fprintf(ssb2,'<!-- question %d -->',j);
fprintf(ssb2,'\n%s','<question type="cloze">');
fprintf(ssb2,'\n%s','<name>');
fprintf(ssb2,'\n%s','<text>Simply supported beams. Finding reaction forces. Level 2</text>');
fprintf(ssb2,'\n%s','</name>');
fprintf(ssb2,'\n%s','<questiontext format="html">');

%Adding image 
fprintf(ssb2,'\n%s','<text><![CDATA[<p><img style="width: 626px; height: 495px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(ssb2,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/simplysupported2/2_beamplot%d.png" alt="Beamplot" width="28" height="30"/></p>',j);

fprintf(ssb2,'\n <p style="text-align: left;">A simply supported beam of length %d cm is shown in the figure above. There are two reaction forces, R1 and R2, one at either end of the beam. There are two external force of %d N and %d N, acting at distances %d cm and %d cm respectively from A.</p>',l,w1,w2,p1,p2 );
fprintf(ssb2,'\n%s', '<p style="text-align: left;">By resolving forces and taking moments about A, determine the magnitude of reaction forces, R1 and R2.</p>');
fprintf(ssb2,'\n%s', '<p style="text-align: left;">Write your answer correct to 2 d.p.</p>');
fprintf(ssb2,'\n <p style="text-align: center;">R1 = {1:NUMERICAL:=%6.2f:0.01#Good job!',r1);
fprintf(ssb2,'%s','~%0%*#Sorry. Try again.} N </p>');
fprintf(ssb2,'\n <p style="text-align: center;">R2 = {1:NUMERICAL:=%6.2f:0.01#Good job!',r2);
fprintf(ssb2,'%s','~%0%*#Sorry. Try again.} N </p>');
fprintf(ssb2,'%s',']]></text>');

fprintf(ssb2,'\n%s','</questiontext>');
fprintf(ssb2,'\n%s','<generalfeedback format="html">');
fprintf(ssb2,'\n%s','<text><![CDATA[<p>Remember that when resolving forces, the sum of the upward forces must be equal to the sum of the downward forces.</p><p>For a system in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p>]]></text>');
fprintf(ssb2,'\n%s','</generalfeedback>');
fprintf(ssb2,'\n%s','<penalty>0</penalty>');
fprintf(ssb2,'\n%s','<hidden>0</hidden>');
fprintf(ssb2,'\n%s','</question>');

%END WRITING XML CODE FOR CLOZE QUESTION
end

fprintf(ssb2,'\n%s','</quiz>');

