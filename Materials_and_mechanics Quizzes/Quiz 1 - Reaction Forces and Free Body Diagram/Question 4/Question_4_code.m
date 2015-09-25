%Generates *.xml scripts for Moodle Embedded answers [cloze] 
%question name - Simply supported level 4
%Created by Stecia-Marie Fletcher for the project ,'Intoducing e-learning
%environments to the Biomedical Engineering Programme', supervised by Dr. Pilar 
%Garcia Souto
%UCL Department: Medical Physics and Bioengineering
%Date: July 2014
%version 1.0

%This MATLAB script creates an XML file, containing multiple Cloze
%questions which can be uploaded to Moodle.

%This is for the Level 4, simply supported beam question type, i.e. 2
%distributed loads and two reaction forces at either end of the beam.

%This script incorporates adding an image to the Moodle question

file=fopen('sssb4_reaction_forces.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100
    
%START IMAGE GENERATION

l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

X=l-5;
figure(1)
%plotting the beam
Y1=0;
Y2=0;
X1=0;
X2=l;

plot([X1,X2],[Y1,Y2],'Color','black','linewidth',5);

hold on

% Adding image ID
ID=strcat(num2str(i));

text(X-15, -1.4, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

IDString=strcat('Reaction Forces and Free Body Diagram . Level 4.Question ID #', ID);

axis([0 l -1.5 1.5])

axis off

title('Reaction Forces & Free Body Diagram','FontSize',20, 'FontWeight','bold')

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(1,1.3,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

%Plotting distributed loads
 
%plotting load #1
Y1 = 0.17;

X1 = randi([round(l/20),round(3*l/20)]); 
X2 = randi([round(6*l/20),round(8*l/20)]); 

rectangle('Position',[X1,0.025,(X2-X1),Y1],'FaceColor','r','edgecolor','r')
axis([0 l -1.5 1.5])

%plotting load #2

X3 = randi([round(11*l/20),round(13*l/20)]); 
X4 = randi([round(15*l/20),round(17*l/20)]);

rectangle('Position',[X3,0.025,(X4-X3),Y1],'FaceColor','r','edgecolor','r')

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

l2 = X4-X3;

if l2<50
    m2 = randi([1,15]);
elseif (50<=l2)&&(l2<100)
        m2 = randi([10,25]);
elseif (100<=l2)&&(l2<150)
    m2 = randi([15,30]);
else m2 = randi([20,30]);
end

%Showing the masses on the figure

Unit = 'kg';
m_Unit = strcat(num2str(m),Unit);
m2_Unit = strcat(num2str(m2),Unit);

%Showing m
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

%Showing m2
mid2 = (l2/2)+X3;
if l2<=45
    text(mid2-0.8,0.12,m2_Unit);
elseif (l2>45)&&(l2<=90)
    text(mid2-1.5,0.12,m2_Unit);
elseif (l2>90)&&(l2<=160)
    text(mid2-2.5,0.12,m2_Unit);
else
    text(mid2-3,0.12,m2_Unit);
end
    
%Indicating the positions of loads

%Load #1

% arrow([X1,0.3],[X1,0.2]);
% arrow([X2,0.3],[X2,0.2]);
plot([X1,X1],[0.2,0.5],'Linestyle',':','linewidth',1,'Color','black');
plot([X2,X2],[0.2,0.5],'Linestyle',':','linewidth',1,'Color','black');


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

%Load #2

% arrow([X3,-0.3],[X3,0]);
% arrow([X4,-0.3],[X4,0]);
plot([X3,X3],[0,-0.3],'Linestyle',':','linewidth',1,'Color','black');
plot([X4,X4],[0,-0.3],'Linestyle',':','linewidth',1,'Color','black');


X3_label = strcat(num2str(X3),unit);
X4_label = strcat(num2str(X4),unit);

if l<=45
    text(X3-0.8,-0.35,X3_label);
    text(X4-0.8,-0.35,X4_label);
elseif (l>45)&&(l<=90)
    text(X3-1.5,-0.35,X3_label);
    text(X4-1.5,-0.35,X4_label);
elseif (l>90)&&(l<=160)
    text(X3-2.5,-0.35,X3_label);
    text(X4-2.5,-0.35,X4_label);
else
    text(X3-3,-0.35,X3_label);
    text(X4-3,-0.35,X4_label);
end

%Plotting position A

if l<=45
text(-2,0.1,'A')
else
    text(0.0,0.1,'A')
end


% Indicating level

rectangle('Position',[X-5*X/20+5 1.3, X/20 0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-4*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-3*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5, 'FaceColor','y');
rectangle('Position',[X-2*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5, 'FaceColor','y');
rectangle('Position',[X-X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

axis ([-0.5 l -1.5 1.8])

axis off

hold off 


%END IMAGE GENERATION

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

% Plotting FBD

%plotting the beam

y1=0;
y2=0;
x1=0;
x2=l;

a = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([0 l -1.5 1.5])

axis off

% title('Free Body Diagram','FontSize',20, 'FontWeight','bold')

%indicating the length of the beam on the plot

unit='cm';

l_unit=strcat(num2str(l), unit);

text(l-4,0.1,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

% Indicating level


%Plotting point load 1

plot([mid,mid],[0.1,0.8],'Linestyle',':','linewidth',1,'Color','black');
arrow([mid,0.1],[mid,0])

W=num2str(m*10);

Unit='N';

Weight=strcat(W,Unit);

text(mid-1,0.85,Weight)

%position of point load

position=strcat(num2str(mid),unit);

text(mid-1.5, -0.1, position)

%Plotting point load 2

plot([mid2,mid2],[0.1,0.8],'Linestyle',':','linewidth',1,'Color','black');
arrow([mid2,0.1],[mid2,0])
hold off

W=num2str(m2*10);

Unit='N';

Weight=strcat(W,Unit);

text(mid2-1,0.85,Weight)

%position of point load

position=strcat(num2str(mid2),unit);

text(mid2-1.5, -0.1, position)

%Plotting position A

text(0,0.1,'A')

% END IMAGE GENERATION

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

%%%%START Calculating reaction forces%%%% -------CHANGE---------

p=(X1+X2)/2;

p2=(X3+X4)/2;

r2=round(((((m*10)*p)+((m2*10)*p2))/l)*100)/100;

r1=round(((m*10)+(m2*10)-r2)*100)/100;



 %Embedded components string generation
    
    numString_r1 = cloze_numerical(r1, 0.01*r1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(r2, 0.01*r2, 'Good job!', 'Incorrect');

 %Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br><p>A simply supported beam of length&nbsp;',num2str(l),' cm is shown in the figure above. There are two supports, one at either end of the beam, hence reactions forces R1 and R2. There are 2 uniformly distributed loads (UDLs) as shown. All distances are measured relative to A.</p><p>By resolving forces and taking moments, determine the value of reaction forces, R1 and R2.</p><p>You may assume a value of g of 10 m/s<sup>2</sup>.</p>', ...
    '<p>Give your answer to 2 d.p.</p>', ...
        'R1:&nbsp;', numString_r1,'N', ...
        '<br>R2:&nbsp;', numString_r2,'N');
    
%     generalfeedbackString=strcat('When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively. A uniformly distributed loads (UDL) can be considered to be a point load at its centre of mass. There are two UDLs to consider in this case.<p> In this case, using the equation $$\\small\\sum$$ M<sub>z</sub>=0 and taking moments about A, gives [(', num2str(p/100), 'm x &nbsp;', num2str(m*10), 'N) + (', num2str(p2/100), 'm x &nbsp;', num2str(m2*10), 'N)] = &nbsp;', num2str(l/100), 'm x R2].</p><p>In this case, using the equation $$\\small\\sum$$ F<sub>y</sub>=0 gives [R1 + R2 = &nbsp; ', num2str(m*10), 'N + &nbsp; ', num2str(m2*10), 'N].</p><p>These two equations can then be used to solve for R1 and R2.</p> The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
    
    generalfeedbackString=strcat('<p>For the purposes of calculating reaction forces and moments, one can use the Equivalent Free Body Diagram, where a uniformly distributed load (UDL) is considered to be a point load at its centre of mass, as per the image below:</p>',...       
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p>For each UDL <i>in turn</i>, calculate the load value and position (as per the previous question).</p>',...
        '<p>When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively.</p>',...
        '<p>Use the convention that upward forces and anti-clockwise moments are positive, as shown in the diagram below.<p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:50%%; height:50;">',...
        '<p>In this case taking moments about A, we have:</p>',...
        '<p>$$\\small\\sum$$ M<sub>z</sub>=0 $$\\rightarrow$$ (', num2str(l/100), 'm x R2) - (', num2str(p/100), 'm x&nbsp;', num2str(m*10), 'N) - (', num2str(p2/100), 'm x&nbsp;', num2str(m2*10), 'N) = 0</p>',...
        '<p>Hence:</p>',...
        '<p>R2 =&nbsp', num2str(r2),'N.</p>',...
        '<br><p>In this case resolving vertical forces, we have:</p>',...
        '<p>$$\\small\\sum$$ F<sub>y</sub>=0 $$\\rightarrow$$ R1 + R2 -&nbsp', num2str(m*10),' -&nbsp', num2str(m2*10),' = 0.</p>',...
        '<p>Hence:</p>',...
        '<p>R1 =&nbsp', num2str(r1),'N.</p>',...
        '<p><br>The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
        
    
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>For a system to be in equilibirum, total forces in both x and y directions must be balanced.</p><p>Also, for a system to be in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p><p>For the purposes of calculating reaction forces and moments, a uniformly distributed load (UDL) can be considered to be a point load at its centre of mass, when constructing an Equivalent Free Body Diagram.</p><p><i>Don''t forget to consider both UDLs in this case.</i></p>',...
        plotString1,...
        plotString2,...
        plotString3);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
