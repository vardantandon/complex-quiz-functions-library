%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Simply supported level 3
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

%This MATLAB script creates an XML file, containing multiple Cloze
%questions which can be uploaded to Moodle.

%This is for the Level 3, simply supported beam question type, i.e. 1
%distributed load and two reaction forces at either end of the beam.

%This script incorporates adding an image to the Moodle question

ssb3=fopen('ssb3_reaction_forces.xml','w'); %Writes .xml file

fprintf(ssb3,'%s','<?xml version="1.0" encoding="UTF-8"?>'); %fprint writes to the specified file
fprintf(ssb3,'\n%s','<quiz>');


for k = 1:1:100
    
%START IMAGE GENERATION

l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

%plotting the beam
Y1=0;
Y2=0;
X1=0;
X2=l;

a = plot([X1,X2],[Y1,Y2],'Color','black','linewidth',5);

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

%Plotting distributed load

%Only 1 load in this case
   
%plotting load #1
%try instead x1 between 0 and l and x2 between x1 and l ?
Y1 = 0.12;
Y2 = 0.12;

X1 = randi([0,round(3*l/4)]); 
X2 = randi([round(X1+(l/10)),l]); 

plot([X1,X2],[Y1,Y2],'linewidth',15,'Color','red')
axis([0 l -1.5 1.5])

hold on

%adding weight values
%Chose masses in kgs - can change depending on what is needed.
%Masses in lbs instead?
%Force or weight instead of mass?
l1 = X2-X1;

if l1<50
    m = randi([1,15]);
elseif (50<=l1)&&(l1<100)
        m = randi([10,25]);
elseif (100<=l1)&&(l1<150)
    m = randi([15,30]);
else m = randi([20,30]);
end

%Showing the masses on the figure

Unit = 'kg';
m_Unit = strcat(num2str(m),Unit);

%Showing m1
mid = (l1/2)+X1;
if l<=45
    text(mid-0.8,0.12,m_Unit);
elseif (l>45)&&(l<=90)
    text(mid-1.5,0.12,m_Unit);
elseif (l>90)&&(l<=160)
    text(mid-2.5,0.12,m_Unit);
else
    text(mid-3,0.12,m_Unit);
end
    
%Indicating the positions of loads

arrow([X1,0.5],[X1,0.2]);
arrow([X2,0.5],[X2,0.2]);

X1_label = strcat(num2str(X1),unit);
X2_label = strcat(num2str(X2),unit);

if l<=45
    text(X1-0.8,0.55,X1_label);
    text(X2-0.8,0.55,X2_label);
elseif (l>45)&&(l<=90)
    text(X1-1.5,0.55,X1_label);
    text(X2-1.5,0.55,X2_label);
elseif (l>90)&&(l<=160)
    text(X1-2.5,0.55,X1_label);
    text(X2-2.5,0.55,X2_label);
else
    text(X1-3,0.55,X1_label);
    text(X2-3,0.55,X2_label);
end

%Plotting position A

text(-5,0.1,'A')

hold off

%This marks the end of the plotting process for this question. 

beamplot = strcat('3_beamplot',num2str(k),'.png');

saveas(a,beamplot,'png')

%END IMAGE GENERATION

%%%%START Calculating reaction forces%%%% -------CHANGE---------

p=(X1+X2)/2;

r2=((m*10)*p)/l;

r1=(m*10)-r2;

%START WRITING XML CODE FOR CLOZE QUESTION

fprintf(ssb3,'<!-- question %d -->',k);
fprintf(ssb3,'\n%s','<question type="cloze">');
fprintf(ssb3,'\n%s','<name>');
fprintf(ssb3,'\n%s','<text>Simply supported beams. Finding reaction forces. Level 3</text>');
fprintf(ssb3,'\n%s','</name>');
fprintf(ssb3,'\n%s','<questiontext format="html">');

%Adding image 
fprintf(ssb3,'\n%s','<text><![CDATA[<p><img style="width: 626px; height: 495px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(ssb3,'src="http://www.ucl.ac.uk/~wmapsfl/moodle/simplysupported3/3_beamplot%d.png" alt="Beamplot" width="28" height="30"/></p>',k);

fprintf(ssb3,'\n <p style="text-align: left;">A simply supported beam of length %d cm is shown in the figure above. There are two reaction forces, R1 and R2, one at either end of the beam. There is a distributed load of mass %d kg from %d cm to %d cm.</p>',l,m,X1,X2 );
fprintf(ssb3,'\n%s', '<p style="text-align: left;">By resolving forces and taking moments about A, determine the magnitude of reaction forces, R1 and R2.</p>');
fprintf(ssb3,'\n%s', '<p style="text-align: left;">Write your answer correct to 2 d.p.</p>');
fprintf(ssb3,'\n <p style="text-align: center;">R1 = {1:NUMERICAL:=%6.2f:0.01#Good job!',r1);
fprintf(ssb3,'%s','~%0%*#Sorry. Try again.} N </p>');
fprintf(ssb3,'\n <p style="text-align: center;">R2 = {1:NUMERICAL:=%6.2f:0.01#Good job!',r2);
fprintf(ssb3,'%s','~%0%*#Sorry. Try again.} N </p>');
fprintf(ssb3,'%s',']]></text>');

fprintf(ssb3,'\n%s','</questiontext>');
fprintf(ssb3,'\n%s','<generalfeedback format="html">');
fprintf(ssb3,'\n%s','<text><![CDATA[<p>Remember that when resolving forces, the sum of the upward forces must be equal to the sum of the downward forces.</p><p>For a system in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p>');
fprintf(ssb3,'%s','<p>Recall that when dealing with distributed loads, you can assume that the total force is acting at the midpoint of the load.]]></text>');
fprintf(ssb3,'\n%s','</generalfeedback>');
fprintf(ssb3,'\n%s','<penalty>0</penalty>');
fprintf(ssb3,'\n%s','<hidden>0</hidden>');
fprintf(ssb3,'\n%s','</question>');

%END WRITING XML CODE FOR CLOZE QUESTION
end

fprintf(ssb3,'\n%s','</quiz>');