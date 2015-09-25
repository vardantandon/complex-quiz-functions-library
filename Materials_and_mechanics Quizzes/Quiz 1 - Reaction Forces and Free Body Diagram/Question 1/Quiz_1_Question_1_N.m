%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Simply supported level 1
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0
% Updated July 2015 by Edward James. 

%This MATLAB script creates an XML file, containing multiple Cloze
%questions which can be uploaded to Moodle.

%This is for the Level 1, simply supported beam question type, i.e. 1 point
%load and two reaction forces at either end of the beam.


file=fopen('ssb1_reaction_forcesN.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:50
    %Loop used to create multiple questions
    
% Calculations

l = randi([20,200]); ... generates a beam of length between 20 and 200 cm

w = randi([8,15]); ... generates a point load between 8 and 15 N

p = randi([round(l/4),round(3*l/4)]); ... generates the position of the point load rounded to nearest integer between a quarter and three quarters of l

r2 = round((((w*p)/l)*100))/100; ... calculates R2 to 2.d.p.

r1 = round(((w-r2)*100))/100; ... calculates R1 to 2.d.p.
    
X = l-5;
    
%START IMAGE GENERATION

%plotting the beam

figure(1)

y1=0;
y2=0;
x1=0;
x2=l;

a = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

% Adding image ID

ID=strcat(num2str(i));

text(X-15, -1.4, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');


IDString=strcat('Reaction Forces and Free Body Diagram - N. Level 1.Question ID #', ID);

axis([0 l -1.5 1.5])

axis off

title('Reaction Forces & Free Body Diagram','FontSize',20, 'FontWeight','bold')

%indicating the length of the beam on the plot

L='Beam length =';

unit='cm';

l_unit=strcat(L,num2str(l), unit);

text(0,1.3,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

% Indicating level

rectangle('Position',[X-5*X/20+5 1.3, X/20 0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-4*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[X-3*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[X-2*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[X-X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

axis ([-0.5 l -1.5 1.8])


hold off

%Plotting point load

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
% END IMAGE GENERATION

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');
figure(2)
% To plot the positive reference system
th = linspace( pi/2, -pi/2, 100);
R = 1;  %or whatever radius you want
x = R*cos(th) + 5;
y = R*sin(th) + 4;
grid off
plot(x,y,'Color','black','linewidth',1); axis off;
hold on
arrow([min(x),max(y)],[min(x)-0.1,max(y)])
arrow([5.45,3.5],[5.45,4.5])
arrow([5,4],[5.9,4])
hold off
text(5.375,4.4,'+','fontsize',20,'fontweight','bold')
text(4.925,4.9,'+','fontsize',20,'fontweight','bold')
text(5.85,3.9,'+','fontsize',20,'fontweight','bold')

%Plot string generation
plotString2 = generateImageString(gcf, 'image2');


 %Embedded components string generation
    
    numString_r1 = cloze_numerical(r1, 0.01*r1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(r2, 0.01*r2, 'Good job!', 'Incorrect');

 %Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br><p>A simply supported beam of length&nbsp;', num2str(l), ' cm is shown in the figure above. There are two supports, one at either end of the beam, hence reactions forces R1 and R2. There is a point force of&nbsp;',num2str(w),' N acting at a distance&nbsp;',num2str(p),' cm from point A.</p>', ...
    '<p>Calculate the values of R1 and R2, giving your answers to 2 d.p.</p>', ...
        'R1:&nbsp;', numString_r1,'N', ...
        '<br>R2:&nbsp;', numString_r2,'N');
    
    generalfeedbackString=strcat('When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively.</p>',...
        '<p>Use the convention that upward forces and anti-clockwise moments are positive, as shown in the diagram below.<p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:50%%; height:50;">',...
        '<p>In this case taking moments about A, we have:</p>',...
        '<p>$$\\small\\sum$$ M<sub>z</sub>=0 $$\\rightarrow$$ (', num2str(l/100), 'm x R2) - (', num2str(p/100), 'm x&nbsp;', num2str(w), 'N) = 0</p>',...
        '<p>Hence:</p>',...
        '<p>R2 =&nbsp', num2str(r2),'N.</p>',...
        '<br><p>In this case resolving vertical forces, we have:</p>',...
        '<p>$$\\small\\sum$$ F<sub>y</sub>=0 $$\\rightarrow$$ R1 + R2 -&nbsp', num2str(w),' = 0.</p>',...
        '<p>Hence:</p>',...
        '<p>R1 =&nbsp', num2str(r1),'N.</p>',...
        '<p><br>The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
        
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>For a system to be in equilibirum, total forces in both x and y directions must be balanced.</p><p>Also, for a system to be in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p>',...
        plotString1,...
        plotString2);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
