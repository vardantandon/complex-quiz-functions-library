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

file=fopen('FBD-level5.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100

%CREATING IMAGES    
    
l=200;

X=195;

%plotting the beam
y1=0;
y2=0;
x1=0;
x2=l;

figure(1)

plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

% Adding image ID
ID=strcat(num2str(i));

text(X-15, -1.4, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');
axis ([-0.5 l -1.5 1.8])


IDString=strcat('Reaction Forces and Free Body Diagram. Level 5.Question ID #', ID);

axis([-0 200 -1.5 1.5])

title('Reaction Forces & Free Body Diagram','FontSize',20, 'FontWeight','bold')

axis off

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(1,1.3,l_unit,'FontSize',12, 'FontWeight','bold')

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

x1=randi([0,3]);
x2=randi([(x1+3),6]);

X1=x1*10;
X2=x2*10;
X5=X1;
X6=X2;

rectangle('Position',[X1,0.03,(X2-X1),0.13],'FaceColor','r','edgecolor','r')

% plot([X1,X2],[0.08,0.08],'Color','red','linewidth',14);

%Plotting 2nd distributed load

x3=randi([12,17]);
x4=randi([(x3+3),20]);

X3=x3*10;
X4=x4*10;

rectangle('Position',[X3,0.03,(X4-X3),0.13],'FaceColor','r','edgecolor','r')

% plot([X3,X4],[0.08,0.08],'Color','red','linewidth',14);

%Plotting point load
 
p=randi([7,8]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling distributed loads

m1=5*(x2-x1);
m2=10*(x4-x3);

mid1=(X1+X2)/2;
mid2=(X3+X4)/2;

m1_label=strcat(num2str(m1),'kg');
m2_label=strcat(num2str(m2),'kg');

text(mid1-5,0.09,m1_label,'fontsize',12,'fontweight','bold');
text(mid2-5,0.09,m2_label,'fontsize',12,'fontweight','bold');

%Labelling point load

w=randi([5,10]);
W=w;
a=w;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

% Indicating level

rectangle('Position',[X-5*X/20+5 1.3, X/20 0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-4*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-3*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5, 'FaceColor','y');
rectangle('Position',[X-2*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5, 'FaceColor','y');
rectangle('Position',[X-X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5, 'FaceColor','y');

hold off

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
% 
% y1=0;
% y2=0;
% x1=0;
% x2=l;

plot([0,l],[0,0],'Color','black','linewidth',5);

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

% p=randi([7,13]);
% P=p*10;
arrow([P,0.75],[P,0],'LineWidth',1)

%Labelling point load

% w=randi([5,10]);
% W=w;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label)

position=strcat(num2str(P),unit);

text(P-5, -0.1, position)

%Plotting point load 1

plot([mid1,mid1],[0.1,0.8],'Linestyle',':','linewidth',1,'Color','black');
arrow([mid1,0.1],[mid1,0])

W=num2str(m1*10);

Unit='N';

Weight=strcat(W,Unit);

text(mid1-1,0.85,Weight)

%position of point load

position=strcat(num2str(mid1),unit);

text(mid1-5, -0.1, position)

% plotting beam UDL
plot([100,100],[0.1,0.8],'Linestyle',':','linewidth',1,'Color','black');
arrow([100,0.1],[100,0])
position=strcat(num2str(100),unit);
text(95, -0.1, position)
text(95,0.85,'2000N');

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

text(mid2-5, -0.1, position)

%Plotting position A

% text(0,0.1,'A')

% END IMAGE GENERATION

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');
%CALCULATING REACTION FORCES

%Correct
 
x=((2000*100)+(m1*10*mid1)+(a*P)+(m2*10*mid2))/200;
r2=round(100*x)/100;
y=(m1*10)+a+m2*10+2000-r2;
r1=round(100*y)/100;


%GENERATING XML

%Embedded components string generation
    
    numString_r1 = cloze_numerical(r1, 0.01*r1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(r2, 0.01*r2, 'Good job!', 'Incorrect');

 %Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br><p>A simply supported beam of length 200 cm is shown in the figure above. There are two supports, one at either end of the beam, hence reaction forces R1 and R2. There is a force of&nbsp;',num2str(a),' N acting at a point&nbsp;',num2str(P),' cm along the beam. There is a UDL of mass&nbsp;',num2str(m1),' kg between points&nbsp;',num2str(X5),'cm and&nbsp;',num2str(X6),' cm along the beam. There is a second UDL of mass&nbsp;',num2str(m2),' kg between points&nbsp;',num2str(x3*10),' cm and&nbsp;',num2str(x4*10),' cm along the beam.</p><p> The beam also has a weight of 10 N/cm.</p><p>By resolving forces and taking moments, determine the value of reaction forces, R1 and R2.</p><p>You may assume a value of g of 10.0 m/s<sup>2</sup>.</p>', ...
    '<p>Give your answer to 2 d.p.</p>', ...
        'R1:&nbsp;', numString_r1,'N', ...
        '<br>R2:&nbsp;', numString_r2,'N');
    
%     generalfeedbackString=strcat('When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively.<p> In this case, using the equation $$\\small\\sum$$ M<sub>z</sub>=0 and taking moments about A, gives [(', num2str(mid1/100), 'm x &nbsp;', num2str(m1*10), 'N) + (1m x 2000N) + (', num2str(P/100), 'm x &nbsp;', num2str(W), 'N) + (', num2str(mid2/100), 'm x &nbsp;', num2str(m2*10), 'N ) = 2m x R2].</p><p>In this case, using the equation $$\\small\\sum$$ F<sub>y</sub>=0 gives [R1 + R2 = &nbsp; ', num2str(m1*10), 'N + 2000N + &nbsp; ', num2str(W), 'N + &nbsp; ', num2str(m2*10), 'N].</p><p>These two equations can then be used to solve for R1 and R2.</p> The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
     
    generalfeedbackString=strcat('<p>For the purposes of calculating reaction forces and moments, one can use the Equivalent Free Body Diagram, where a uniformly distributed load (UDL) is considered to be a point load at its centre of mass, as per the image below:</p>',...       
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p>The beam can be treated like a UDL, meaning that there are effectively 3 UDLs and one point load to consider in this question, as well as the two reaction forces.</p>',...
        '<p>For each UDL <i>in turn</i>, calculate the load value and position (as per the previous questions).</p>',...
        '<p>When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively.</p>',...
        '<p>Use the convention that upward forces and anti-clockwise moments are positive, as shown in the diagram below.<p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:50%%; height:50;">',...
        '<p>In this case taking moments about the left hand corner of the beam, we have:</p>',...
        '<p>$$\\small\\sum$$ M<sub>z</sub>=0 $$\\rightarrow$$</p>',...
        '<p>(2m x R2) - (',num2str(mid1/100), 'm x&nbsp;',num2str(m1*10), 'N) - (',num2str(P/100), 'm x&nbsp;',num2str(a), 'N) - (1m x 2000N) - (',num2str(mid2/100), 'm x&nbsp;',num2str(m2*10), 'N) = 0</p>',...
        '<p>Hence:</p>',...
        '<p>R2 =&nbsp', num2str(r2),'N.</p>',...
        '<br><p>In this case resolving vertical forces, we have:</p>',...
        '<p>$$\\small\\sum$$ F<sub>y</sub>=0 $$\\rightarrow$$ R1 + R2 -&nbsp',num2str(m1*10),' -&nbsp',num2str(a),' -2000 -&nbsp',num2str(m2*10),' = 0.</p>',...
        '<p>Hence:</p>',...
        '<p>R1 =&nbsp', num2str(r1),'N.</p>',...
        '<p><br>The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
        
    
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p><i>Don''t forget to consider all 6 forces in this case (including the weight of the beam), when constructing the Equivalent Free Body Diagram.</p></i>',...
        plotString1,...
        plotString2,...
        plotString3);
    
    %Output
    fprintf(file, xmlCode);
    

    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);   

