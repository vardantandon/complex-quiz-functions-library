file=fopen('ssb2_reaction_forceskg.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:50 %Loop used to create multiple questions

% Calculations

l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

w1=randi([8,15]);

w1N = w1*10;

p1=randi([round(l/8),round(l/2)]);

w2=randi([8,15]);

w2N = w2*10;

p2=randi([round(l/2),round(7*l/8)]);

r2=round((((p1*w1N)+(p2*w2N))/l)*100)/100;

r1=round((w1N+w2N-r2)*100)/100;

X = l-5;

% plotting the beam

y1=0;
y2=0;
x1=0;
x2=l;

b = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

% Adding image ID

ID=strcat(num2str(i));
text(X-15, -1.4, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');


IDString=strcat('Reaction Forces and Free Body Diagram - Kg. Level 2.Question ID #', ID);

axis([0 l -1.5 1.5])

axis off

title('Reaction Forces & Free Body Diagram','FontSize',20, 'FontWeight','bold')

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(0,1.3,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

% Indicating level

rectangle('Position',[X-5*X/20+5 1.3, X/20 0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-4*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5, 'FaceColor','y');
rectangle('Position',[X-3*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[X-2*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[X-X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

hold off

%Plotting point loads



arrow([p1,0.75],[p1,0])

W1=num2str(w1);

Unit='kg';

Weight1=strcat(W1,Unit);

text(p1-1,0.85,Weight1)

%2



arrow([p2,0.75],[p2,0])

W2=num2str(w2);

Unit='kg';

Weight2=strcat(W2,Unit);

text(p2-1,0.85,Weight2)

%position of point loads

position1=strcat(num2str(p1),unit);

text(p1-1.5, -0.1, position1)

%2

position2=strcat(num2str(p2),unit);

text(p2-1.5, -0.1, position2)

%Plotting position A
axis ([-0.5 l -1.5 1.8])

text(0,0.1,'A')

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

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
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br><p>A simply supported beam of length&nbsp;',num2str(l),' cm is shown in the figure above. There are two supports, one at either end of the beam, hence reactions forces R1 and R2. There are two masses of&nbsp;', num2str(w1),' kg and&nbsp;',num2str(w2),' kg, acting at distances&nbsp;',num2str(p1),' cm and&nbsp;',num2str(p2),' cm, respectively from A.</p><p>By resolving forces and taking moments, determine the value of reaction forces, R1 and R2.</p><p>You may assume a value of g of 10 m/s<sup>2</sup>.</p>', ...
    '<p>Give your answers to 2 d.p.</p>', ...
        'R1:&nbsp;',numString_r1,'N', ...
        '<br>R2:&nbsp;',numString_r2,'N');
    
   
    generalfeedbackString=strcat('When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively.</p>',...
        '<p>Use the convention that upward forces and anti-clockwise moments are positive, as shown in the diagram below.<p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:50%%; height:50;">',...
        '<p>In this case taking moments about A, we have:</p>',...
        '<p>$$\\small\\sum$$ M<sub>z</sub>=0 $$\\rightarrow$$ (', num2str(l/100), 'm x R2) - (', num2str(p1/100), 'm x&nbsp;', num2str(w1N), 'N) - (', num2str(p2/100), 'm x&nbsp;', num2str(w2N), 'N) = 0</p>',...
        '<p>Hence:</p>',...
        '<p>R2 =&nbsp', num2str(r2),'N.</p>',...
        '<br><p>In this case resolving vertical forces, we have:</p>',...
        '<p>$$\\small\\sum$$ F<sub>y</sub>=0 $$\\rightarrow$$ R1 + R2 -&nbsp', num2str(w1N),' -&nbsp', num2str(w2N),' = 0.</p>',...
        '<p>Hence:</p>',...
        '<p>R1 =&nbsp', num2str(r1),'N.</p>',...
        '<p><br>The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
        
    
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>For a system to be in equilibirum, total forces in both x and y directions must be balanced.</p><p>Also, for a system to be in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p><p><i>Remember that there are four forces to consider here.</i></p>',...
        plotString1,...
        plotString2);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
