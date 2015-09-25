file=fopen('Shear-Strain.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:1

ID=strcat(num2str(i));

IDString=strcat('Shear-Strain. Question ID #', ID);

L=randi([40,60]);
r=randi([2,4])/10;
theta=randi([25,75])/10;
strain=(pi*theta*r)/(180*L);


numString1 = cloze_numerical(strain, 0.005, 'Good Job!', 'Incorrect');



questionString = strcat('<p>Two sportsmen collide resulting in the femur of one being loaded in torsion, as indicated below, ',...
    ' which shows the affected bone modelled as a hollow cylinder. The top surface of the cylinder has been rotated by \\theta =&nbsp',num2string(theta),'<sup>o</sup>',...
    ' relative to the bottom surface so that the line AB in the unstrained bone has become AB<sup>I</sup>.</p>',...
    '<img src="http://s4.postimg.org/6kvvea6fh/image.jpg" alt="" width="560" height="373" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive">',...
    '<p>A cylindrical bone loaded in torsion as indicated by the arrows (left). On the right, the top surface of the bone is shown, in which the darkly shaded annulus',...
    ' is the end of a cylindrical element of radius, <i>r</i>, and wall thickness, <i>dr</i>.</p>',...
    numString1);
    


generalFeedbackStr = strcat('');
    
    

hint1 = strcat('');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        '',...
        '',...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
 
end
    
fprintf(file, quiz_end()); %xml closing code
fclose(file);


