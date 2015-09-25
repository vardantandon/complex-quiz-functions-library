file=fopen('ssb3_reaction_forcesN.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions
    
l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

X=l-5;

%plotting the beam
Y1=0;
Y2=0;
X1=0;
X2=l;

figure(1)
a = plot([X1,X2],[Y1,Y2],'Color','black','linewidth',5);

hold on

% Adding image ID

text(X-15, -1.4, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

ID=strcat(num2str(i));

IDString=strcat('Reaction Forces and Free Body Diagram. Level 3.Question ID #', ID);

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

%Plotting distributed load

%Only 1 load in this case
   
%plotting load #1
%try instead x1 between 0 and l and x2 between x1 and l ?
Y1 = 0.17;

X1 = randi([5,round(3*l/4)]); 
X2 = randi([round(X1+(l/10)),l]); 

rectangle('Position',[X1,0.025,(X2-X1),Y1],'FaceColor','r','edgecolor','r')
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

%Plotting position A

text(0,0.1,'A')

% Indicating level

rectangle('Position',[X-5*X/20+5 1.3, X/20 0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-4*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-3*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[X-2*X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[X-X/20+5,1.3, X/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
axis ([-0.5 l -1.5 1.8])


hold off

% Calculations 

p=(X1+X2)/2;

r2=round(((m*10)*p)/l*100)/100;

r1=round(((m*10)-r2)*100)/100;

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
figure(3)
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



%Plotting point load
plot([p,p],[0.1,0.8],'Linestyle',':','linewidth',1,'Color','black');
arrow([p,0.1],[p,0])
W=num2str(m*10);
hold off
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
plotString3 = generateImageString(gcf, 'image3');

 %Embedded components string generation
    
    numString_r1 = cloze_numerical(r1, 0.01*r1, 'Good job!', 'Incorrect');
    numString_r2 = cloze_numerical(r2, 0.01*r2, 'Good job!', 'Incorrect');

 %Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br><p>A simply supported beam of length&nbsp;',num2str(l),' cm is shown in the figure above. There are two supports, one at either end of the beam, hence reactions forces R1 and R2. There is a uniformly distributed load of mass&nbsp',num2str(m),' kg from&nbsp;',num2str(X1),' cm to&nbsp;',num2str(X2),' cm (measured from A).<p>By resolving forces and taking moments, determine the value of reaction forces, R1 and R2.</p><p>You may assume a value of g of 10 m/s<sup>2</sup>.</p>', ...
    '<p>Give your answers to 2 d.p.</p>', ...
        'R1:&nbsp;',numString_r1,'N', ...
        '<br>R2:&nbsp;',numString_r2,'N');
    
  generalfeedbackString=strcat('<p>For the purposes of calculating reaction forces and moments, one can use the Equivalent Free Body Diagram, where the uniformly distributed load (UDL) is considered to be a point load at its centre of mass, as per the image below:</p>',...       
        '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
        '<p>The load value is the weight of the UDL (which is simply the product of the mass of the UDL and g).</p>',...
        '<p>The load position is the midpoint of the UDL.</p>',...
        '<p>When a system is in equilibrium the total forces and the total moment need to be equal to zero; otherwise the system will be moving or rotating, respectively.</p>',...
        '<p>Use the convention that upward forces and anti-clockwise moments are positive, as shown in the diagram below.<p>',...
        '<img src="@@PLUGINFILE@@/image2.png" style="width:50%%; height:50;">',...
        '<p>In this case taking moments about A, we have:</p>',...
        '<p>$$\\small\\sum$$ M<sub>z</sub>=0 $$\\rightarrow$$ (', num2str(l/100), 'm x R2) - (', num2str(p/100), 'm x&nbsp;', num2str(m*10), 'N) = 0</p>',...
        '<p>Hence:</p>',...
        '<p>R2 =&nbsp', num2str(r2),'N.</p>',...
        '<br><p>In this case resolving vertical forces, we have:</p>',...
        '<p>$$\\small\\sum$$ F<sub>y</sub>=0 $$\\rightarrow$$ R1 + R2 -&nbsp', num2str(m*10),' = 0.</p>',...
        '<p>Hence:</p>',...
        '<p>R1 =&nbsp', num2str(r1),'N.</p>',...
        '<p><br>The equation $$\\small\\sum$$ F<sub>x</sub>=0 still holds true in this case, but is not used here as there are no forces with an x-component.</p>');
        
    
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>For a system to be in equilibirum, total forces in both x and y directions must be balanced.</p><p>Also, for a system to be in equilibrium, the sum of the clockwise moments must be equal to the sum of the anticlockwise moments.</p><p><i>For the purposes of calculating reaction forces and moments, a uniformly distributed load (UDL) can be considered to be a point load at its centre of mass, when constructing an Equivalent Free Body Diagram.</i></p>',...
        plotString1,...
        plotString2,...
        plotString3);
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);

