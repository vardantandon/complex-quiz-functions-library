% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Warren Truss level 1
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% UCL Department: Medical Physics and Bioengineering
% Date:26/01/15

file=fopen('Truss-1.xml','w');
fprintf(file, quiz_start()); %xml initialization code

for i = 1:1:100 %Loop used to create multiple questions

%  Assigning values to the variables

angle1=10+randi([1 70]);
angle2=90-angle1;
F=50+randi([1 100]); 

% CALCULATIONS

% from trigonometry
Ah = 1./tand(angle1);
hC = 1./tand(angle2);
% taking moments 
Rc = (F.*Ah)./(Ah+hC);
Ra = F-Rc;
% forces
F1 = -F/((sind(angle2)./tand(angle1))+cosd(angle2));
F2 = F1*(sind(angle2)./sind(angle1));
F3 = -F1*cosd(angle1);
figure(1)
% drawing the truss triangle
x = [0 1.5 2];
y = [0 1 0];
plot (x,y,'-o', 'Linewidth', 2, 'color', 'black');
hold on
line ([0 2], [0 0],'Linewidth', 2, 'color', 'black')
text (-0.18,0, 'A', 'fontsize', 20)
text (1.6,1.05, 'B', 'fontsize', 20)
text (2.08,0, 'C', 'fontsize', 20)
text (0.25,0.1, '\theta','fontsize', 20,'FontWeight','bold');
text (1.78,0.13, '\phi', 'fontsize', 20, 'FontWeight','bold');

title('Warren Truss','FontSize',20, 'FontWeight','bold');

ID=strcat(num2str(i));

text(2.08, -0.5, strcat('Question ID #', ID),'fontsize',8,'fontweight','bold');

IDString=strcat('Warren Truss. Level 1.Question ID #', ID);  

%Indicating level (c = x start location, d= diameter, e= y plane location)
c=-0.5; 
d=0.15;
e=1.5;
rectangle('Position',[c,e,d,d],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[c+d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+2*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[c+3*d,e,d,d],'Curvature',[1,1],'LineWidth',1.5);
text (c+0.1, e-d/2 ,'Level 1','FontWeight', 'bold', 'fontsize',15)

text (1.38, 1.3, '\downarrow','color', 'red', 'fontsize',50)
text (1.3,1.5, strcat('F = ',num2str(F),' N'), 'fontsize', 18)

% Plotting the left support

x = [-0.08 0 0.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([-0.15 0.15], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')

% Plotting the right support

x = [1.92 2 2.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([1.92 2.08], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')
line ([1.80 2.20], [-0.25 -0.25],'Linewidth', 1.5, 'color', 'black')
rectangle('Position',[1.91,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[2.04,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);

% Axes requirements

axis ([-0.5 2.5 -0.4 1.8])

axis off

daspect ([1,1,1])

hold off

%Plot string generation
plotString1 = generateImageString(gcf, 'image1');

% Plotting diagram to embed in solution
figure(2)
% drawing the truss triangle
x = [0 1.5 2];
y = [0 1 0];
plot (x,y,'-o', 'Linewidth', 2, 'color', 'black');
hold on
line ([0 2], [0 0],'Linewidth', 2, 'color', 'black')
text (-0.18,0, 'A', 'fontsize', 20)
text (1.6,1.05, 'B', 'fontsize', 20)
text (2.08,0, 'C', 'fontsize', 20)
text (1.45,-0.1, 'D', 'fontsize', 20)
text (0.25,0.1, '\theta','fontsize', 20,'FontWeight','bold');
text (1.78,0.13, '\phi', 'fontsize', 20, 'FontWeight','bold');

f=-0.45;
text (1.38, 1.3, '\downarrow','color', 'red', 'fontsize',50)
text (-0.1, f, '\uparrow','color', 'red', 'fontsize',50)
text (0.05,f-0.1, 'R', 'color', 'red', 'fontsize',15)
text (0.16,f-0.15, 'Ay', 'color', 'red', 'fontsize',9)
text (1.9, f, '\uparrow','color', 'red', 'fontsize',50)
text (-0.7, 0.05, '\rightarrow','color', 'red', 'fontsize',50)
text (-0.6,0.1, 'R', 'color', 'red', 'fontsize',15)
text (-0.49,0.05, 'Ax', 'color', 'red', 'fontsize',9)
text (2.05,f-0.1, 'R', 'color', 'red', 'fontsize',15)
text (2.16,f-0.15, 'C', 'color', 'red', 'fontsize',9)
text (1.37,1.35, 'F', 'color', 'red','fontsize', 15);
plot([1.50,1.50],[0,1],'Linestyle','--','linewidth',1,'Color','red')
text (0.5,0.6, 'F', 'color', 'red','fontsize', 15);
text (0.55,0.52, 'AB', 'color', 'red','fontsize', 9);
text (1.37,0.5, 'h', 'color','red','fontsize', 15);
text (1,-0.1, 'F', 'color', 'red','fontsize', 15);
text (1+0.05,-0.1-0.08, 'AC', 'color', 'red','fontsize', 9);
text (1.8,0.5, 'F', 'color', 'red','fontsize', 15);
text (1.8+0.05,0.5-0.08, 'BC', 'color', 'red','fontsize', 9);

% Plotting the left support

x = [-0.08 0 0.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([-0.15 0.15], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')

% Plotting the right support

x = [1.92 2 2.08];
y = [-0.2 0 -0.2];
plot (x,y, 'Linewidth', 1.5, 'color', 'black')
line ([1.92 2.08], [-0.2 -0.2],'Linewidth', 1.5, 'color', 'black')
line ([1.80 2.20], [-0.25 -0.25],'Linewidth', 1.5, 'color', 'black')
rectangle('Position',[1.91,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[2.04,-0.25,0.06,0.06],'Curvature',[1,1],'LineWidth',1.5);

% Axes requirements
axis ([-0.5 2.5 -0.4 1.1])

axis off

hold off

daspect ([1,1,1])

%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

% Type of force on each member, qs c)

%Embedded components string generation

% AB
if F1 > 0
       numString_AB = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
       F1A='positive';
       F1B='tension';
end
if F1 < 0
       numString_AB = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
       F1A='negative';
       F1B='compression';
end
% BC
if F2 > 0
       numString_BC = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
       F2A='positive';
       F2B='tension';
end
if F2 < 0
       numString_BC = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
       F2A='negative';
       F2B='compression';
end
% AC
if F3 > 0
       numString_AC = cloze_mcq('vertical', 2, 'Compression', 'Incorrect', 'Tension','Good job!');
       F3A='positive';
       F3B='tension';
end
if F3 < 0
       numString_AC = cloze_mcq('vertical', 1, 'Compression', 'Good Job!', 'Tension','Incorrect');
       F3A='negative';
       F3B='compression'; 
end
    
    numString_rax = cloze_numerical(0,0, 'Good job!', 'Incorrect');
    numString_ray = cloze_numerical(round(Ra), 0.025*Ra, 'Good job!', 'Incorrect');
    numString_c = cloze_numerical(round(Rc), 0.025*Rc, 'Good job!', 'Incorrect');
    numString_F1 = cloze_numerical(round(F1), 0.025*F1, 'Good job!', 'Incorrect');
    numString_F2 = cloze_numerical(round(F2), 0.025*F2, 'Good job!', 'Incorrect');
    numString_F3= cloze_numerical(round(F3), 0.025*F3, 'Good job!', 'Incorrect');
    

%Question string joining
    questionString = strcat('<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">', ...
    '<br><p></p>Consider the right angle triangle in the truss problem as shown above, where $$\\small\\theta$$  = &nbsp',num2str(angle1),'<sup>o</sup> and $$\\small\\phi$$ = &nbsp',num2str(angle2), '<sup>o</sup>', ...
    ', and the force applied on the truss system is &nbsp', num2str(F), 'N (indicated by the red arrow).</p>',...
    '<p>Use the convention that upward forces (vertical), forces to the right (horizontal), and anti-clockwise moments are positive, when answering this question.</p>',...
    '<p>Giving your answers to the nearest whole number, calculate:</p>', ...
    '<p><b>A)</b></p><p>The reaction forces.</p>', ...
    '<p></p><p></p><p>R<sub>A_x</sub>:&nbsp', numString_rax,'N</p>', ...
    '<p>R<sub>A_y</sub>:&nbsp', numString_ray,'N</p>', ...
    '<p>R<sub>C</sub>:&nbsp', numString_c,'N</p>', ...
    '<p></p>',...
    '<p><b>B)</b></p><p>The internal forces on each member.</p>', ...
    '<p>F<sub>AB</sub>:&nbsp', numString_F1,'N</p>', ......
    '<p>F<sub>AC</sub>:&nbsp', numString_F3,'N</p>', ......
    '<p>F<sub>BC</sub>:&nbsp', numString_F2,'N</p>', ......
    '<p><b>C)</b></p><p>Indicate if each member is tension or compression from the options below.</p>',...
    '<p>F<sub>AB</sub><p></p>', numString_AB,...
    '<p>F<sub>AC</sub><p></p>', numString_AC,...
    '<p>F<sub>BC</sub><p></p>', numString_BC); 


    generalfeedbackString=strcat('<br><img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">', .....
    '<p>Use the diagram above to help solve this problem. </p>',...
    '<p>Consider the whole truss as a single beam.', ...
    '<p>Find the reaction forces by taking moments about A or C.',...
    '<p>Consider each joint seperately to find the forces on each member and assume all members are in tension (i.e. draw them in tension on your force diagram).',...
    '<p>Find a joint where only one or two forces are unknown and repeat until all the forces are found.</p>',...   
    '<p>Finally, a positive force means the element is in tension, otherwise it is in compression.</p>',...
    '<br><p>Here is the full worked solution for this question:</p>',....
    '<p><b>PART A</b></p><p>R<sub>A_x</sub> must equal zero, as there are no other horizontal forces to consider, and the system is in equilibirum.</p>',...
    '<p>Using simple trigonometry, the distance AD = (h/tan$$\\small\\theta$$), and the distance DC = (h/tan$$\\small\\phi$$).</p>',...
    '<p>By taking moments about A, we can derive the following expression:</p>',...
    '<p>(R<sub>C</sub> x (AD + DC)) - (F x AD) = 0</p>',...
    '<p>We can then substitute in the distances AD and DC (as calculated above), the values of F, $$\\small\\theta$$ and $$\\small\\phi$$ as given in the question, and divide the whole expression by h.</p>',...
    '<p>This gives a value of R<sub>C</sub> = &nbsp', num2str(round(Rc)), 'N.</p>',...
    '<p>For the whole system to be in equilibrium: R<sub>A_y</sub> + R<sub>C</sub> - F = 0.</p>',...
    '<p>Therefore: R<sub>A_y</sub> = &nbsp', num2str(round(Ra)), 'N.</p>',...
    '<p><b>PARTS B & C</b></p><p>Starting with joint A, and by looking at vertical forces, we can derive the following expression:</p>',...
    '<p>R<sub>A_y</sub> + (F<sub>AB</sub> x sin$$\\small\\theta$$) = 0</p>',...
    '<p>Therefore: F<sub>AB</sub> = &nbsp', num2str(round(F1)), 'N.</p>',...
    '<p>The &nbsp', F1A,' sign here indicates that this member is in &nbsp', F1B,'.',...
    '<p>Looking at horizontal forces at joint A, we can derive the following expression:</p>',...
    '<p>R<sub>A_x</sub> + (F<sub>AB</sub> x cos$$\\small\\theta$$) + F<sub>AC</sub> = 0</p>',...
    '<p>Therefore: F<sub>AC</sub> = &nbsp', num2str(round(F3)), 'N.</p>',...
    '<p>The &nbsp', F3A,' sign here indicates that this member is in &nbsp', F3B,'.',...
    '<p>Next, looking at horizontal forces at joint B, we can derive the following expression:</p>',...
    '<p>(F<sub>BC</sub> x sin$$\\small\\theta$$) - (F<sub>AB</sub> x sin$$\\small\\phi$$) = 0</p>',...
    '<p>Therefore: F<sub>BC</sub> = &nbsp', num2str(round(F2)), 'N.</p>',...
    '<p>The &nbsp', F2A,' sign here indicates that this member is in &nbsp', F2B,'.',...
    '<p>You can then calculate the vertical forces at joint B, and both the horizontal and vertical forces at joint C, as a final check.</p>');
    


            
   %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalfeedbackString, ...
        '<p><b>HINT</b></p><p>Remember for a system to be in equlibirium the following conditions must be satisfied:</p><p>$$\\small\\sum$$ M<sub>z</sub>=0</p><p>$$\\small\\sum$$ F<sub>y</sub>=0</p><p>$$\\small\\sum$$ F<sub>x</sub>=0</p><p>You may find it helpful to treat the whole truss as a single beam initially in order to find the reaction forces.</p><p>You can then draw a force diagram for each joint, and use the method of joints to calculate all of the remaining forces.</p><p>To answer this question, set up internal forces by assuming that each member is in tension, a negative value would therefore indicate that a member is in compression.</p><p>Remember to indicate if a force has a positive or negative value in your answers, where appropriate.</p>', ...
        plotString1, ...
        '', ...
        plotString3, ...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);





