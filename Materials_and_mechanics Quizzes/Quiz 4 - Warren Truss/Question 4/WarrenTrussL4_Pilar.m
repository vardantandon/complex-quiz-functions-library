% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Warren Truss level 4
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% Re-done by Pilar Garcia - 6th March 2015 
% UCL Department: Medical Physics and Bioengineering
% Date:17/02/15

file=fopen('Truss-4.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions
% Assigning values to the variables
angle1=10+randi([1 70]);
angle2=10+randi([1 50]);


sign1 = randi([0 1])*2 - 1;%Added by Pilar. It allows for the sign to change. Gives 100 values from the set {-1, 1}.
sign2 = randi([0 1])*2 - 1;
sign3 = randi([0 1])*2 - 1;
sign4 = randi([0 1])*2 - 1;
sign5 = randi([0 1])*2 - 1;

%     if sign4==0 && sign5==0
%    sign4= randi([0 1])*2-1;
%     end


Fv1=(50+randi([1 1000])).*-1; 
Fv2=(50+randi([1 700])); 
Fv3=(50+randi([1 950]))*-1; 
Fh4=(50+randi([1 950])); 
Fh5=(50+randi([1 950]))*-1; 

% %Space allocation
% RaV = ones(1,100);
% RaH = ones(1,100);
% Re = ones(1,100);
% Fab = ones(1,100);
% Fbc = ones(1,100);
% Fac = ones(1,100);
% Fbd = ones(1,100);
% Fcd = ones(1,100);
% Fce = ones(1,100);
% Fde = ones(1,100);

   
    % START IMAGE
    
% Generates image for level 4 Warren Truss problems
% question name - Warren Truss level 4
% Created by Azalea Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
%Modified by Pilar - 6th March 2015
% UCL Department: Medical Physics and Bioengineering
% Date:15/2/15


% drawing the truss triangles
figure(1)
x = [0 1 2 3 4];
y = [0 1.5 0 1.5 0];
T = plot (x,y,'-o', 'Linewidth', 2, 'color', 'black');
line ([0 4], [0 0],'Linewidth', 2, 'color', 'black')
line ([1 3], [1.5 1.5],'Linewidth', 2, 'color', 'black')
text (-0.3,0, 'A', 'fontsize', 20)
text (0.7,1.5, 'B', 'fontsize', 20)
text (2.15,-0.2, 'C', 'fontsize', 20)
text (3.1,1.5, 'D', 'fontsize', 20)
text (4.15,0, 'E', 'fontsize', 20)
text (0.2,0.18, '\theta', 'fontsize', 20,'FontWeight','bold')
text (1.55,0.225, '\phi', 'fontsize', 20, 'FontWeight','bold') 
text (2.2,0.225, '\phi', 'fontsize', 20,'FontWeight','bold')%Pilar swapped phi and theta
text (3.6,0.18, '\theta', 'fontsize', 20, 'FontWeight','bold')%Pilar swapped phi and theta

title('Warren Truss','FontSize',20, 'FontWeight','bold');

ID=strcat(num2str(i));

text(4, -1, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

IDString=strcat('Warren Truss. Level 4.Question ID #', ID);  

%Indicating level (c = x start location, d= diameter, e= y plane location)
c=-1; 
d=0.25;
e=2.7;
rectangle('Position',[c,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+d,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
text (c+0.1, e-d/2 ,'Level 4','FontWeight', 'bold', 'fontsize',15)


if Fv1 <0
    text (0.75, 2.15, '\downarrow','color', 'black', 'fontsize',50)
else
    text (0.75, 2.15, '\uparrow','color', 'black', 'fontsize',50)     
end
text (0.9,2.5, strcat('F_{V1}= ',num2str(abs(Fv1)),' N'), 'fontsize', 18)

if Fv2 <0
    text (2.75, 2.15, '\downarrow','color', 'black', 'fontsize',50)
else
   text (2.75, 2.15, '\uparrow','color', 'black', 'fontsize',50)
end
text (2.9,2.5, strcat('F_{V2}= ',num2str(abs(Fv2)), ' N'), 'fontsize', 18)

if Fv3 <0
    text (1.77, -0.5, '\downarrow','color', 'black', 'fontsize',50)
else
   text (1.77, -0.5, '\uparrow','color', 'black', 'fontsize',50)
end
text (1.65,-1.1, strcat('F_{V3}= ',num2str(abs(Fv3)),' N'), 'fontsize', 18)

%---- Fh4 -----
if Fh4 > 0
    text (-0.2, 1.6, '\rightarrow','color', 'black', 'fontsize',50)
elseif Fh4 < 0
    text (-0.2, 1.6, '\leftarrow','color', 'black', 'fontsize',50)   
end
if Fh4 ~= 0
    text (-1.8,1.4, strcat('F_{H4}= ', num2str(abs(Fh4)), ' N'), 'fontsize', 18)
end

%---- Fh5 -----
if Fh5 > 0
    text (3.4, 1.6, '\rightarrow','color', 'black', 'fontsize',50)
elseif Fh5 < 0
    text (3.4, 1.6, '\leftarrow','color', 'black', 'fontsize',50)
end
if Fh5~= 0
    text (3.5,1.05, strcat('F_{H5}= ', num2str(abs(Fh5)), ' N'), 'fontsize', 18)
end



hold on

% Plotting the left support

x = [-0.09 0 0.09];
y = [-0.3 0 -0.3];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([-0.2 0.2], [-0.3 -0.3],'Linewidth', 1.5, 'color', 'black')

% Plotting the right support

x = [3.91 4 4.09];
y = [-0.25 0 -0.25];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([3.91 4.09], [-0.25 -0.25],'Linewidth', 1.5, 'color', 'black')
line ([3.80 4.20], [-0.3 -0.3],'Linewidth', 1.5, 'color', 'black')
rectangle('Position',[3.89,-0.3,0.07,0.07],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[4.05,-0.3,0.07,0.07],'Curvature',[1,1],'LineWidth',1.5);

% Axes requirements
axis ([-1 4.5 -0.4 3])
axis off

hold off

daspect ([1,1,1])

%Plot string generation
plotString1= generateImageString(gcf, 'image1');


figure(2)
% drawing picture to embed in answer
x = [0 1 2 3 4];
y = [0 1.5 0 1.5 0];
plot (x,y,'-o', 'Linewidth', 2, 'color', 'black');
hold on
line ([0 4], [0 0],'Linewidth', 2, 'color', 'black')
line ([1 3], [1.5 1.5],'Linewidth', 2, 'color', 'black')
text (-0.3,0, 'A', 'fontsize', 20)
text (0.7,1.5, 'B', 'fontsize', 20)
text (2.15,-0.2, 'C', 'fontsize', 20)
text (3.1,1.5, 'D', 'fontsize', 20)
text (4.15,0, 'E', 'fontsize', 20)
text (0.75,0.15, 'G', 'fontsize', 20)
text (3.05,0.15, 'H', 'fontsize', 20)
text (0.2,0.18, '\theta', 'fontsize', 20,'FontWeight','bold')
text (1.55,0.225, '\phi', 'fontsize', 20, 'FontWeight','bold') 
text (2.2,0.225, '\phi', 'fontsize', 20,'FontWeight','bold')%Pilar swapped phi and theta
text (3.6,0.18, '\theta', 'fontsize', 20, 'FontWeight','bold')%Pilar swapped phi and theta

text (0.75, 2.1, '\downarrow','color', 'black', 'fontsize',50)
text (0.9,2.5, 'F_{V1}', 'fontsize', 18)
text (2.75, 2.1, '\uparrow','color', 'black', 'fontsize',50)
text (2.9,2.5, 'F_{V2}', 'fontsize', 18)
text (1.77, -0.5, '\downarrow','color', 'black', 'fontsize',50)
text (1.65,-1.1, 'F_{V3}', 'fontsize', 18)
text (-0.2, -0.6, '\uparrow','color', 'red', 'fontsize',50)
text (3.8, -0.6, '\uparrow','color', 'red', 'fontsize',50)
text (-0.4,-1, 'R_{Ay}', 'fontsize', 18,'color', 'red')
text (-1.2,0.25, 'R_{Ax}', 'fontsize', 18,'color', 'red')
text (-1.2, 0.1, '\rightarrow','color', 'red', 'fontsize',50)
text (-0.1, 1.6, '\rightarrow','color', 'black', 'fontsize',50)
text (3.3, 1.6, '\leftarrow','color', 'black', 'fontsize',50)
text (-0.55,1.6, 'F_{H4}', 'fontsize', 18)
text (3.9,1.6, 'F_{H5}', 'fontsize', 18)

text (3.6,-1, 'R_{E}', 'fontsize', 18,'color', 'red')
plot([1,1],[0,1.5],'Linestyle','--','linewidth',1,'Color','red')
plot([3,3],[0,1.5],'Linestyle','--','linewidth',1,'Color','red')

text (0.8,0.75, 'h', 'color','red','fontsize', 15);
text (2.8,0.75, 'h', 'color','red','fontsize', 15);

text (-0.1,0.85, 'F_{AB}', 'fontsize', 18,'color', 'red')
text (1.25,1.2, 'F_{BC}', 'fontsize', 18,'color', 'red')
text (1,-0.25, 'F_{AC}', 'fontsize', 18,'color', 'red')
text (1.9,1.75, 'F_{BD}', 'fontsize', 18,'color', 'red')
text (1.85,0.75, 'F_{CD}', 'fontsize', 18,'color', 'red')
text (3,-0.25, 'F_{CE}', 'fontsize', 18,'color', 'red')
text (3.55,0.75, 'F_{DE}', 'fontsize', 18,'color', 'red')

% Plotting the left support

x = [-0.09 0 0.09];
y = [-0.3 0 -0.3];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([-0.2 0.2], [-0.3 -0.3],'Linewidth', 1.5, 'color', 'black')

% Plotting the right support

x = [3.91 4 4.09];
y = [-0.25 0 -0.25];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([3.91 4.09], [-0.25 -0.25],'Linewidth', 1.5, 'color', 'black')
line ([3.80 4.20], [-0.3 -0.3],'Linewidth', 1.5, 'color', 'black')
rectangle('Position',[3.89,-0.3,0.07,0.07],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[4.05,-0.3,0.07,0.07],'Curvature',[1,1],'LineWidth',1.5);

% Axes requirements
axis ([-0.5 4.5 -0.4 2.5])
axis off

hold off

daspect ([1,1,1])
%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

% CALCULATIONS

% taking moments and resolving forces
Re = (Fv1/tand(angle1)  + Fv3*(1/tand(angle1)+1/tand(angle2))  + Fv2*(1/tand(angle1)+2/tand(angle2)) -(Fh4+Fh5))  / (-2/tand(angle1)-2/tand(angle2)); %Pilar
RaV = -Fv1-Fv2-Fv3-Re;
RaH= -Fh4 - Fh5;

% resolving forces
Fab = -RaV/sind(angle1);                            % Joint A, F_AB. 
Fac = -RaH -Fab*cosd(angle1);                               % Joint A, F_AC. 

Fbc = (Fv1-Fab*cosd(90-angle1))/cosd(90-angle2);  % Joint B, F_BC
Fbd = -Fh4+ Fab*sind(90-angle1)-Fbc*sind(90-angle2);          % Joint B, F_BD.

Fde= -Re/sind(angle1);    % Joint E, F_DE. 
Fce = -Fde*cosd(angle1);    % Joint C, F_CE.


Fcd = (Fv2-Fde*cosd(90-angle1))/cosd(90-angle2);   % Joint D, F_CD. Correct!

% Type of force on each member, qs c)

%Embedded components string generation

% AB
F1=Fab;
if F1 > 0
       numString_F1 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
       F1A='positive';
       F1B='tension';
end
if F1 < 0
       numString_F1 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
       F1A='negative';
       F1B='compression';
end

% BC
F2=Fbc;
if F2 > 0
       numString_F2 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
       F2A='positive';
       F2B='tension';
end
if F2 < 0
       numString_F2 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
        F2A='negative';
       F2B='compression';
end

% AC
F3=Fac;
if F3 > 0
       numString_F3 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
          F3A='positive';
       F3B='tension';
end
if F3 < 0
       numString_F3 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
F3A='negative';
       F3B='compression';
end

% BD
F4=Fbd;
if F4 > 0
       numString_F4 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
          F4A='positive';
       F4B='tension';
end
if F4 < 0
       numString_F4 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
F4A='negative';
       F4B='compression';
end
    
% CD
F5=Fcd;
if F5 > 0
       numString_F5 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
      F5A='positive';
       F5B='tension';
end
if F5 < 0
       numString_F5 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
F5A='negative';
       F5B='compression';
end

% CE
F6=Fce;
if F6 > 0
       numString_F6 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
      F6A='positive';
       F6B='tension';
end
if F6 < 0
       numString_F6 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
F6A='negative';
       F6B='compression';
end

% DE
F7=Fde;
if F7 > 0
       numString_F7 = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
      F7A='positive';
       F7B='tension';
end
if F7 < 0
       numString_F7 = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
F7A='negative';
       F7B='compression';
end
    numString_rax = cloze_numerical(round(RaH),0.025*RaH, 'Good job!', 'Incorrect');
    numString_ray = cloze_numerical(round(RaV), 0.025*RaV, 'Good job!', 'Incorrect');
    numString_e = cloze_numerical(round(Re), 0.025*Re, 'Good job!', 'Incorrect');
    numString_AB = cloze_numerical(round(Fab), 0.025*Fab, 'Good job!', 'Incorrect');
    numString_BC = cloze_numerical(round(Fbc), 0.025*Fbc, 'Good job!', 'Incorrect');
    numString_AC= cloze_numerical(round(Fac), 0.025*Fac, 'Good job!', 'Incorrect');
    numString_BD= cloze_numerical(round(Fbd), 0.025*Fbd, 'Good job!', 'Incorrect');
    numString_CD= cloze_numerical(round(Fcd), 0.025*Fcd, 'Good job!', 'Incorrect');
    numString_CE= cloze_numerical(round(Fce), 0.025*Fce, 'Good job!', 'Incorrect');
    numString_DE= cloze_numerical(round(Fde), 0.025*Fde, 'Good job!', 'Incorrect');

    

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p></p>Consider the system of triangles in the truss problem as shown above, where $$\\small\\theta$$  = &nbsp',num2str(angle1),'<sup>o</sup> and $$\\small\\phi$$ = &nbsp',num2str(angle2), '<sup>o</sup>.<p>', ...
    '<p>The forces applied on the system are F<sub>V1</sub> = &nbsp', num2str(abs(Fv1)),'N, F<sub>V2</sub> = &nbsp', num2str(abs(Fv2)),'N, and F<sub>V3</sub> = &nbsp', num2str(abs(Fv3)),'N, and F<sub>H4</sub> = &nbsp', num2str(abs(Fh4)),'N, and F<sub>H5</sub> = &nbsp', num2str(abs(Fh5)),'N.</p>',...
    '<p>Use the convention that upward forces (vertical), forces to the right (horizontal), and anti-clockwise moments are positive, when answering this question.</p>',...
    '<p>Giving your answers to the nearest whole number, calculate:</p>', ...
    '<p><b>A)</b></p>The reaction forces.</p>', ...
    '<p></p><p></p><p>R<sub>A_x</sub>:&nbsp', numString_rax,'N</p>', ...
    '<p>R<sub>A_y</sub>:&nbsp', numString_ray,'N</p>', ...
    '<p>R<sub>E</sub>:&nbsp', numString_e,'N</p>', ...
    '<p></p>',...
    '<p><b>B)</b></p>The internal forces on each member.</p>', ...
    '<p>F<sub>AB</sub>:&nbsp', numString_AB,'N</p>', ......
    '<p>F<sub>AC</sub>:&nbsp', numString_AC,'N</p>', ......
    '<p>F<sub>DE</sub>:&nbsp', numString_DE,'N</p>', ......
    '<p>F<sub>CE</sub>:&nbsp', numString_CE,'N</p>', ......
    '<p>F<sub>CD</sub>:&nbsp', numString_CD,'N</p>', ......
    '<p>F<sub>BD</sub>:&nbsp', numString_BD,'N</p>', ......
    '<p>F<sub>BC</sub>:&nbsp', numString_BC,'N</p>', ......
    '<p><b>C)</b></p>Indicate if each member is tension or compression from the options below.</p>',...
    '<p>F<sub>AB</sub><p></p>', numString_F1,...
    '<p>F<sub>AC</sub><p></p>', numString_F3,...
    '<p>F<sub>DE</sub><p></p>', numString_F7,...
    '<p>F<sub>CE</sub><p></p>', numString_F6,...
    '<p>F<sub>CD</sub><p></p>', numString_F5,...
    '<p>F<sub>BD</sub><p></p>', numString_F4,...
    '<p>F<sub>BC</sub><p></p>', numString_F2); 


    generalfeedbackString=strcat('<br><img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">', .....
    '<p>Use the diagram above to help solve this problem. </p>',...
    '<p>Consider the whole truss as a single beam.', ...
    '<p>Find the reaction forces by taking moments about A or E, and then resolving forces horizontally and vertically.',...
    '<p>Consider each joint seperately to find the forces on each member and assume all elements are in tension (i.e. draw them in tension on your force diagram).</p>',...
    '<p>Find a joint where only one or two forces are unknown and repeat until all the forces are found.</p>',...
    '<p>Finally, a positive force means the element is in tension, otherwise it is in compression.</p>',...
    '<br><p>Here is the full worked solution for this question:</p>',....
    '<p><b>PART A</b></p><p>For horizontal forces to be balanced: R<sub>A_x</sub> + F<sub>H4</sub> - F<sub>H5</sub>  = 0.</p>',...
        '<p>Therefore: R<sub>A_x</sub> = &nbsp', num2str(round(RaH)), 'N.',...
        '<p>Using simple trigonometry, the distance AG = HE = (h/tan$$\\small\\theta$$), and the distance GC = CH = (h/tan$$\\small\\phi$$).</p>',...
        '<p>By taking moments about A, we can derive the following expression:</p>',...
        '<p>(R<sub>E</sub> x ((2xAG)+(2xGC)) + (F<sub>V2</sub> x (AG+(2xGC))) + (F<sub>H5</sub> x h) - (F<sub>V1</sub> x AG) - (F<sub>V3</sub> x (AG+GC)) - (F<sub>H4</sub> x h) = 0</p>',...
        '<p>We can then substitute in the distances AG and GC (as calculated above), the values of F<sub>V1</sub>, F<sub>V2</sub>, F<sub>V3</sub>, F<sub>H4</sub>, F<sub>H5</sub>, $$\\small\\theta$$ and $$\\small\\phi$$ as given in the question, and divide the whole expression by h.</p>',...
        '<p>This gives a value of R<sub>E</sub> = &nbsp', num2str(round(Re)), 'N.</p>',...
        '<p>For the whole system to be in equilibrium: R<sub>A_y</sub> + R<sub>E</sub> + F<sub>V2</sub> - F<sub>V1</sub> - F<sub>V3</sub> = 0.</p>',...
        '<p>Therefore: R<sub>A_y</sub> = &nbsp', num2str(round(RaV)), 'N.</p>',...
        '<p><b>PARTS B & C</b></p><p>Starting with joint A, and by looking at vertical forces, we can derive the following expression:</p>',...
        '<p>R<sub>A_y</sub> + (F<sub>AB</sub> x sin$$\\small\\theta$$) = 0</p>',...
        '<p>Therefore: F<sub>AB</sub> = &nbsp', num2str(round(F1)), 'N.</p>',...
        '<p>The &nbsp', F1A,' sign here indicates that this member is in &nbsp', F1B,'.',...
        '<p>Looking at horizontal forces at joint A, we can derive the following expression:</p>',...
        '<p>R<sub>A_x</sub> + (F<sub>AB</sub> x cos$$\\small\\theta$$) + F<sub>AC</sub> = 0</p>',...
    '<p>Therefore: F<sub>AC</sub> = &nbsp', num2str(round(F3)), 'N.</p>',...
    '<p>The &nbsp', F3A,' sign here indicates that this member is in &nbsp', F3B,'.',...
    '<p>Next, looking at vertical forces at joint E, we can derive the following expression:</p>',...
    '<p>(F<sub>DE</sub> x sin$$\\small\\theta$$) + R<sub>E</sub> = 0</p>',...
    '<p>Therefore: F<sub>DE</sub> = &nbsp', num2str(round(F7)), 'N.</p>',...
    '<p>The &nbsp', F7A,' sign here indicates that this member is in &nbsp', F7B,'.',...
    '<p>Next, looking at horizontal forces at joint E, we can derive the following expression:</p>',...
    '<p>-(F<sub>DE</sub> x cos$$\\small\\theta$$) - F<sub>CE</sub> = 0</p>',...
    '<p>Therefore: F<sub>CE</sub> = &nbsp', num2str(round(F6)), 'N.</p>',...
    '<p>The &nbsp', F6A,' sign here indicates that this member is in &nbsp', F6B,'.',...
    '<p>Next, looking at vertical forces at joint D, we can derive the following expression:</p>',...
    '<p>-(F<sub>DE</sub> x cos(90-$$\\small\\theta$$)) - (F<sub>CD</sub> x cos(90-$$\\small\\phi$$)) + F<sub>V2</sub> = 0</p>',...
    '<p>Therefore: F<sub>CD</sub> = &nbsp', num2str(round(F5)), 'N.</p>',...
    '<p>The &nbsp', F5A,' sign here indicates that this member is in &nbsp', F5B,'.',...
    '<p>Next, looking at horizontal forces at joint D, we can derive the following expression:</p>',...
    '<p>-(F<sub>CD</sub> x sin(90-$$\\small\\phi$$)) + (F<sub>DE</sub> x sin(90-$$\\small\\theta$$)) - F<sub>BD</sub> - F<sub>H5</sub> = 0</p>',...
    '<p>Therefore: F<sub>BD</sub> = &nbsp', num2str(round(F4)), 'N.</p>',...
    '<p>The &nbsp', F4A,' sign here indicates that this member is in &nbsp', F4B,'.',...
    '<p>Finally, looking at vertical forces at joint B, we can derive the following expression:</p>',...
    '<p>-(F<sub>AB</sub> x cos(90-$$\\small\\theta$$)) - (F<sub>BC</sub> x cos(90-$$\\small\\phi$$)) - F<sub>V1</sub> = 0</p>',...
    '<p>Therefore: F<sub>BC</sub> = &nbsp', num2str(round(F2)), 'N.</p>',...
    '<p>The &nbsp', F2A,' sign here indicates that this member is in &nbsp', F2B,'.',...
    '<p>You can then resolve horizontal and vertical forces at joint C, and horizontal forces at joint B, as a final check.</p>');

   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><p><b>HINT</b></p><p>Remember for a system to be in equlibirium the following conditions must be satisfied:</p><p>$$\\small\\sum$$ M<sub>z</sub>=0</p><p>$$\\small\\sum$$ F<sub>y</sub>=0</p><p>$$\\small\\sum$$ F<sub>x</sub>=0</p><p>Apply these principles to both the whole truss as a single beam, and also to each of the five joints individually.</p><p>Remember that F<sub>V1</sub>, F<sub>V2</sub>, F<sub>V3</sub>, F<sub>H4</sub> and F<sub>H5</sub> will all create moments about points A and E.</p><p>You may find it helpful to treat the whole truss as a single beam initially in order to find the reaction forces.</p><p>You can then draw a force diagram for each joint, and use the method of joints to calculate all of the remaining forces.</p><p>To answer this question, set up internal forces by assuming that each member is in tension, a negative value would therefore indicate that a member is in compression.</p><p>Remember to indicate if a force has a positive or negative value in your answers, where appropriate.</p>', ...
        plotString1, ...
        '', ...
        plotString3, ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);

