% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Warren Truss level 4
% Created by Azalea A Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% Re-done by Pilar Garcia - 6th March 2015 
% UCL Department: Medical Physics and Bioengineering
% Date:17/02/15

comb1=fopen('Warren Truss L4.xml','w'); 

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

% Assigning values to the variables
angle1=10+randi(70,[1 100]);
angle2=10+randi(50,[1 100]);


sign1 = randi([0 1],[1 100])*2 - 1;%Added by Pilar. It allows for the sign to change. Gives 100 values from the set {-1, 1}.
sign2 = randi([0 1],[1 100])*2 - 1;
sign3 = randi([0 1],[1 100])*2 - 1;
sign4 = randi([-1 1],[1 100]);
sign5 = randi([-1 1],[1 100]);

for i=1:1:100
    if sign4(i)==0 && sign5(i)==0
        sign4(i)= randi([0 1])*2-1;
    end
end

Fv1=(50+randi(1000,[1 100])).*sign1; 
Fv2=(50+randi(700,[1 100])).*sign2; 
Fv3=(50+randi(950,[1 100])).*sign3; 
Fh4=(50+randi(950,[1 100])).*sign4; 
Fh5=(50+randi(950,[1 100])).*sign5; 

%Space allocation
RaV = ones(1,100);
RaH = ones(1,100);
Re = ones(1,100);
Fab = ones(1,100);
Fbc = ones(1,100);
Fac = ones(1,100);
Fbd = ones(1,100);
Fcd = ones(1,100);
Fce = ones(1,100);
Fde = ones(1,100);

for i=1:1:100
    
    % START IMAGE
    
% Generates image for level 4 Warren Truss problems
% question name - Warren Truss level 4
% Created by Azalea Khan for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
%Modified by Pilar - 6th March 2015
% UCL Department: Medical Physics and Bioengineering
% Date:15/2/15


% drawing the truss triangles

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
text (0.25,0.17, '\theta', 'fontsize', 20,'FontWeight','bold')
text (1.65,0.225, '\phi' , 'fontsize', 20, 'FontWeight','bold') 
text (2.25,0.17, '\phi', 'fontsize', 20,'FontWeight','bold')%Pilar swapped phi and theta
text (3.65,0.225, '\theta', 'fontsize', 20, 'FontWeight','bold')%Pilar swapped phi and theta
title('Warren Truss level 4','FontSize',20, 'FontWeight','bold')



if Fv1(i) <0
    text (0.75, 1.95, '\downarrow','color', 'black', 'fontsize',50)
else
    text (0.75, 1.95, '\uparrow','color', 'black', 'fontsize',50)     
end
text (0.9,2.5, strcat('F_{V1}= ',num2str(abs(Fv1(i))),' N'), 'fontsize', 18)

if Fv2(i) <0
    text (2.75, 1.95, '\downarrow','color', 'black', 'fontsize',50)
else
   text (2.75, 1.95, '\uparrow','color', 'black', 'fontsize',50)
end
text (2.9,2.5, strcat('F_{V2}= ',num2str(abs(Fv2(i))), ' N'), 'fontsize', 18)

if Fv3(i) <0
    text (1.77, -0.5, '\downarrow','color', 'black', 'fontsize',50)
else
   text (1.77, -0.5, '\uparrow','color', 'black', 'fontsize',50)
end
text (1.65,-0.9, strcat('F_{V3}= ',num2str(abs(Fv3(i))),' N'), 'fontsize', 18)

%---- Fh4 -----
if Fh4(i) > 0
    text (-0.2, 1.6, '\rightarrow','color', 'black', 'fontsize',50)
elseif Fh4(i) < 0
    text (-0.2, 1.6, '\leftarrow','color', 'black', 'fontsize',50)   
end
if Fh4(i) ~= 0
    text (-0.6,1.7, strcat('F_{H4}= ', num2str(abs(Fh4(i))), ' N'), 'fontsize', 18)
end

%---- Fh5 -----
if Fh5(i) > 0
    text (3.4, 1.6, '\rightarrow','color', 'black', 'fontsize',50)
elseif Fh5(i) < 0
    text (3.4, 1.6, '\leftarrow','color', 'black', 'fontsize',50)
end
if Fh5(i) ~= 0
    text (4.0,1.5, strcat('F_{H5}= ', num2str(abs(Fh5(i))), ' N'), 'fontsize', 18)
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

  
warrentruss=strcat('WarrenTrussL4_',num2str(i),'.jpg');

saveas(T,warrentruss);

    % END IMAGE
    

% QUESTION TEXT AND DIAGRAM

fprintf(comb1,'\n<!--question %d-->',i);
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Warren Truss %d Level 4</text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n%s','<text>');
fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_4/WarrenTrussL4_%d.jpg"',i);
fprintf(comb1,'%s','alt="truss" width="30 height="30"/></p>');

fprintf(comb1,'\n<p style="text-align: left;">Consider the system of triangles in the Truss problem as shown above,');
fprintf(comb1,' where &theta; = %d<sup>o</sup>, &phi; = %d<sup>o</sup>. ',angle1(i),angle2(i));
%fprintf(comb1,'and the forces applied on the system are F<sub>V1</sub> = %d N, F<sub>V2</sub> = %d N and F<sub>V3</sub> = %d N.</p>',abs(Fv1(i)),abs(Fv2(i)),abs(Fv3(i)));
fprintf(comb1,'%s','Draw a free body diagram of the system and calculate:');
fprintf(comb1,'%s',' a) The reaction forces and b) the forces on each member.</p>');
fprintf(comb1,'%s','(Give your answer to 1 d.p.)</p>');


% CALCULATIONS

% taking moments and resolving forces
Re(i) = (Fv1(i)/tand(angle1(i))  + Fv3(i)*(1/tand(angle1(i))+1/tand(angle2(i)))  + Fv2(i)*(1/tand(angle1(i))+2/tand(angle2(i))) -(Fh4(i)+Fh5(i)))  / (-2/tand(angle1(i))-2/tand(angle2(i))); %Pilar
RaV(i) = -Fv1(i)-Fv2(i)-Fv3(i)-Re(i);
RaH(i)= -Fh4(i) - Fh5(i);

%Azalea --> wrong
%Re(i) =
%0.5*(Fv3(i)+((tand(angle1(i))*tand(angle2(i)))/(tand(angle1(i))+tand(angle2(i))))*((Fv1(i)/tand(angle1(i)))+Fv2(i)*((2/tand(angle1(i)))+(1/tand(angle2(i))))));
% if Fv1(i)>500 && Fv2(i)>300 
%     Re(i) = 0.5*(Fv3(i)+((tand(angle1(i))*tand(angle2(i)))/(tand(angle1(i))+tand(angle2(i))))*((Fv1(i)/tand(angle1(i)))+Fv2(i)*((2/tand(angle1(i)))+(1/tand(angle2(i))))));
%     Ra(i) = Fv1(i)+Fv2(i)+Fv3(i)-Re(i);
% else
%     Re(i) = 0.5*(Fv3(i)+((tand(angle1(i))*tand(angle2(i)))/(tand(angle1(i))+tand(angle2(i))))*((-Fv1(i)/tand(angle1(i)))-Fv2(i)*((2/tand(angle1(i)))+(1/tand(angle2(i))))));
%     Ra(i) = -Fv1(i)-Fv2(i)+Fv3(i)-Re(i);
% end


% resolving forces
Fab(i) = -RaV(i)/sind(angle1(i));                            % Joint A, F_AB. 
Fac(i) = -RaH(i) -Fab(i)*cosd(angle1(i));                               % Joint A, F_AC. 

Fbc(i) = (Fv1(i)-Fab(i)*cosd(90-angle1(i)))/cosd(90-angle2(i));  % Joint B, F_BC
Fbd(i) = -Fh4(i) + Fab(i)*sind(90-angle1(i))-Fbc(i)*sind(90-angle2(i));          % Joint B, F_BD.

Fde(i) = -Re(i)/sind(angle1(i));    % Joint E, F_DE. 
Fce(i) = -Fde(i)*cosd(angle1(i));    % Joint C, F_CE.


Fcd(i) = (Fv2(i)-Fde(i)*cosd(90-angle1(i)))/cosd(90-angle2(i));   % Joint D, F_CD. Correct!




% ANSWER

% Reaction forces, qs a)
fprintf(comb1,'\n<p style="text-align: left;"> a) Reaction forces</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>A,V</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',RaV(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>A,H</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',RaH(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'R<sub>E</sub>= {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Re(i));

% Forces on each member, qs b)
fprintf(comb1,'\n<p style="text-align: left;"> b) Forces on each member</p>');
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>AB</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fab(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>BC</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fbc(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>AC</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fac(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>BD</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fbd(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>CD</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fcd(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>CE</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fce(i));
fprintf(comb1,'\n%s','<p style="text-align: center;" >');
fprintf(comb1,'F<sub>DE</sub> = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} N</p>',Fde(i));

% Type of force on each member, qs c)
fprintf(comb1,'\n%s','c) From the drop down list below, indicate for each member if it is in tension or compression</p>');
% AB
if Fab(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>AB</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');  
end
if Fab(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>AB</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% BC
if Fbc(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>BC</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');
end
if Fbc(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>BC</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% AC
if Fac(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>AC</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>'); 
end
if Fac(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>AC</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');  
end
% BD
if Fbd(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>BD</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');  
end
if Fbd(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>BD</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% CD
if Fcd(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>CD</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>');
end
if Fcd(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>CD</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');
end
% CE
if Fce(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>CE</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>'); 
end
if Fce(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>CE</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>');  
end
% DE
if Fde(i) > 0
        fprintf(comb1,'\n%s','<p> F<sub>DE</sub> {1:MULTICHOICE:~Compression ~=Tension}</p>]]>'); 
end
if Fde(i) < 0
        fprintf(comb1,'\n%s','<p> F<sub>DE</sub> {1:MULTICHOICE:~Tension ~=Compression}</p>]]>');  
end

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</questiontext>');


% General Feedback

fprintf(comb1,'\n%s','<generalfeedback format="html">');
fprintf(comb1,'\n%s','<text>');

fprintf(comb1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
fprintf(comb1,'src="http://www.ucl.ac.uk/~rmapdpg/MoodleQuiz/WarrenTruss/Level_4/solution.jpg"');
fprintf(comb1,'%s','alt="truss" width="30 height="30"/></p>');
 
fprintf(comb1,'\n%s','<P>Use a variation of the diagram above as an aid to solve this problem. </p>');
fprintf(comb1,'\n%s','<p>Find the reaction forces by taking moments about A and E, and then resolve forces horizontally and vertically.');
fprintf(comb1,'\n%s','<p>Consider each joints seperately to find the forces on each member and assume all elements are in tension.');
fprintf(comb1,'\n%s','<p>Draw a Free body force diagram for each joint with all the forces acting on the joint');
fprintf(comb1,'\n%s','<p>Find a joint where only two forces are unknown and repeat until all the forces are found.');
fprintf(comb1,'\n%s','<p>Finally, positive force means the element is in tension, otherwise compression.</p>]]>');

fprintf(comb1,'\n%s','</text>');
fprintf(comb1,'\n%s','</generalfeedback>');

fprintf(comb1,'\n%s','<penalty>0</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');

fprintf(comb1,'\n%s','</question>');

end

fprintf(comb1,'\n%s','</quiz>');

fclose(comb1);