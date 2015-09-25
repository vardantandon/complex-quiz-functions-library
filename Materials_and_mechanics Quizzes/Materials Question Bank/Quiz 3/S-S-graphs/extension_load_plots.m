file=fopen('Stress-Strain1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:25
    
ID=strcat(num2str(i));

IDString=strcat('Stress-Strain. Question ID #', ID);
figure(1)
% Plotting graph
stress=100;
A1=10;
x1=0:0.1:30;
x2=30.1:0.1:80;
y11=stress*A1*x1;
y12=(-10*(x2-max(x1)).^2)+(1000*(x2-max(x1)))+(max(y11));
A2=20;
y21=stress*A2*x1;
y22=(-10*(x2-max(x1)).^2)+(1000*(x2-max(x1)))+(max(y21));
A3=30;
y31=stress*A3*x1;
y32=(-10*(x2-max(x1)).^2)+(1000*(x2-max(x1)))+(max(y31));
A4=40;
y41=stress*A4*x1;
y42=(-10*(x2-max(x1)).^2)+(1000*(x2-max(x1)))+(max(y41));
A5=50;
y51=stress*A5*x1;
y52=(-10*(x2-max(x1)).^2)+(1000*(x2-max(x1)))+(max(y51));
plot(x1,y11,'red')
hold on
plot(x2,y12,'red')
plot(x1,y21,'black')
plot(x2,y22,'black')
plot(x1,y31,'green')
plot(x2,y32,'green')
plot(x1,y41,'blue')
plot(x2,y42,'blue')
plot(x1,y51,'yellow')
plot(x2,y52,'yellow')
grid on
grid minor
axis([0 100 0 18*10^4])
set(gca,'YTickLabel',[],'XTickLabel',[])

hold off

%Plot string generation
plotString1= generateImageString(gcf, 'image1');
figure(2)
stress=100;
A1=10;
x1=0:0.1:30;
x2=30.1:0.1:80;
y11=stress*A1*x1;
x5=30.1:0.1:90;
y12=(-8*(x5-max(x1)).^2)+(1000*(x5-max(x1)))+(max(y11));
A2=60;
x3=15.1:0.1:70;
x4=0:0.1:15;
y21=stress*A2*x4;
y22=(-8*(x3-max(x4)).^2)+(1000*(x3-max(x4)))+(max(y21));
A3=30;
x6=30:0.1:40;
y31=stress*A3*x1;
y32=(-10*(x6-max(x1)).^2)+(1000*(x6-max(x1)))+(max(y31));
A4=40;
y41=stress*A4*x1;
x7=30:0.1:85;
y42=(-10*(x7-max(x1)).^2)+(1500*(x7-max(x1)))+(max(y41));
A5=50;
y51=stress*A5*x1;
y52=(-10*(x2-max(x1)).^2)+(800*(x2-max(x1)))+(max(y51));
plot(x1,y11,'green')
hold on
plot(x5,y12,'green')
plot(x4,y21,'black')
plot(x3,y22,'black')
plot(x1,y31,'red')
plot(x6,y32,'red')
plot(x1,y41,'blue')
plot(x7,y42,'blue')
plot(x1,y51,'yellow')
plot(x2,y52,'yellow')
grid on
grid minor
axis([0 100 0 18*10^4])
set(gca,'YTickLabel',[],'XTickLabel',[])
ylabel('Stress','Fontsize',12,'FontWeight','bold');
xlabel('Strain','Fontsize',12,'FontWeight','bold');
hold off

%Plot string generation
plotString2= generateImageString(gcf, 'image2');


numString1 = cloze_mcq('drop', 1, 'Yellow', 'Good Job!','Blue', 'Incorrect','Green', 'Incorrect', 'Black','Incorrect','Red','Incorrect');
numString2 = cloze_mcq('drop', 1, 'Red', 'Good Job!','Blue', 'Incorrect','Green', 'Incorrect', 'Black','Incorrect','Yellow','Incorrect');
numString3 = cloze_mcq('drop', 1, 'Yellow', 'Good Job!','Blue', 'Incorrect','Green', 'Incorrect', 'Black','Incorrect','Red','Incorrect');
numString4 = cloze_mcq('drop', 1, 'Green', 'Good Job!','Blue', 'Incorrect','Yellow', 'Incorrect', 'Black','Incorrect','Red','Incorrect');
numString5 = cloze_mcq('drop', 1, 'Red', 'Good Job!','Blue', 'Incorrect','Green', 'Incorrect', 'Black','Incorrect','Yellow','Incorrect');
numString6 = cloze_mcq('drop', 1, 'Yellow', 'Good Job!','Blue', 'Incorrect','Green', 'Incorrect', 'Black','Incorrect','Red','Incorrect');
numString7 = cloze_mcq('drop', 1, 'Blue', 'Good Job!','Black', 'Incorrect','Green', 'Incorrect', 'Yellow','Incorrect','Red','Incorrect');
numString8 = cloze_mcq('drop', 1, 'Black', 'Good Job!','Blue', 'Incorrect','Green', 'Incorrect', 'Yellow','Incorrect','Red','Incorrect');


questionString = strcat('<p><u><b>Part A</b></u></p><p>Consider the graph shown below, with unlabelled axes of arbitrary units.</p>',...
    '<img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;">',...
    '<p><br></p><p>Imagine that the graph is a plot of load on the y-axis, against extension on the x-axis, for five rods, all of the same material, ',...
    ' but having different cross-sectional areas and/or lengths, which are undergoing tension tests.</p>',...
    '<p><b>i)</b> Assuming that all five rods have the same cross-sectional area, which plot represents the rod with the shortest length?</p>',...
    numString1,...
    '<p><b>ii)</b> Assuming that all five rods have the same length, which plot represents the rod with the smallest cross-sectional area?</p>',...
    numString2,...
    '<p><b>iii)</b> Now imagine that the graph is a plot of stress on the y-axis, against strain on the x-axis, for five rods, all of differing materials and dimensions, which are undergoing tension tests. ',...
    ' Which plot represents the rod with the greatest value of Young''s Modulus?</p>',...
    numString3,...
    '<br><p><b><u>Part B</b></u></p><p>Consider the graph shown below, which is a stress-strain plot for five different materials, all of which underwent tension tests to failure.</p>',....
    '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<p><br></p><p><b>i)</b> Which plot represents the most ductile material?</p>',...
    numString4,...
    '<p><b>ii)</b> Which plot represents the most brittle material?</p>',...
    numString5,...
    '<p><b>iii)</b> Which plot represents the material with the highest yield point?</p>',...
    numString6,...
    '<p><b>iv)</b> Which plot represents the ''toughest'' material?</p>',...
    numString7,...
    '<p><b>V)</b> Which plot represents the ''stiffest'' material?</p>',...
    numString8);
 
generalFeedbackStr = strcat('<p><u><b>Part A</b></u></p><p>Load Vs extension curves for rods of the same material, having different cross sectional areas and/or different lengths will be different.</p>',...
    '<p>But if you divide load by the cross sectional area, and extension by the initial length of the rods, all the curves for same material will fall (essentially) on top of one another;',...
    ' that is, on a curve that is characteristic of the material alone, and (essentially) independent of cross sectional area and intial length for the rod.<p>',...
    '<p>This will produce what is otherwise known as a stress / strain plot, the gradient of which (up until the yield point) is equal to the Young''s Modulus of the material.</p>',...
    '<p><u><b>Part B</b></u></p><p>If a material is loaded up until the yield point, removing the load will return the material to its original length. This reversibility is called elasticity.</p>',...
    '<p>At stresses greater than the yield stress, removing the load will not return the material to its original length, and plastic deformation (or permanent deformation) will occur.',...
    ' If you remove the load when you have entered the plastic region, the elastic portion of the deformation is reversed, but the plastic part remains and the rod is said to have suffered a permanent strain.</p>',...
    '<p>If instead of removing the load you keep increasing it, there will be a point at which it breaks into two. The stress at this point is known as the ultimate tensile stress ',...
    ' or ultimate tensile strength (UTS), and the strain is often referred to as the fracture strain.',...
    '<p>The ductility of a material is often expressed as the strain at fracture, expressed as a percentage.</p>',...
    '<p>For brittle materials (the opposite of ductile), there is little or no detectable plastic region, so much so that the yield point and UTS points are very close together or even sit on top of each other.</p>',...
    '<p>''Toughness'' is often a reference to how high a material''s UTS is, with a higher value making a material more tough.</p>',...
    '<p>''Stiffness'' is often a reference to how high a material''s Young''s Modulus is, with a higher value making a material stiffer.</p>',...
    '<p>For example, bone is both stiff and tough.</p><p>It owes its toughness to the collagen in its osteoid, which has a low modulus (~1.2 GPa) but imparts high tensile strength and toughness to the bone.',...
    ' Bone without this protein component is hard, brittle and weak in tension, like a piece of chalk.</p>',...
    '<p>The hydroxyapatites (part of the inorganic material in bone) have a high modulus (~165 GPa) and high compressive strength, and impart hardness, compressive stiffness, and strength to the bone.',...
    ' Bone without this mineral component is soft, rubbery and ductile.</p>');

hint1 = strcat('<b>HINT</b><p>Look through the relevant sections of your notes and figures to answer this question.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        plotString1,...
        plotString2,...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
