file=fopen('Fairground.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('Fairground. Question ID #', ID);

% assigning random variables
       m=randi([100,200]);
       l=randi([5,10]);
       angle=randi([45,75]);
       g=9.8;     
% calculations
       down=m*g;
       T=(down)/(cosd(angle));
       r=l*sind(angle);
       left=T*sind(angle);
       w=sqrt((left/(r*m)));
       f=w/(2*pi);
       ar=r*w.^2;
       V=r*w;
       w=round(w*100)/100;
       f=round(f*100)/100;
       V=round(V*100)/100;
       ar=round(ar*100)/100;
       down=round(down*100)/100;
       left=round(left*100)/100;
     T=round(T*100)/100;
       
numString1 = cloze_numerical(w, 0.02*w, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical(f, 0.02*f, 'Good job!', 'Incorrect, try again');
numString3 = cloze_numerical(V, 0.02*V, 'Good job!', 'Incorrect, try again');
numString4 = cloze_numerical(ar, 0.02*ar, 'Good job!', 'Incorrect, try again');
numString5 = cloze_numerical(0, 0, 'Good job!', 'Incorrect, try again');

questionString = strcat('<p>In a fairground ride a person sits in a chair attached by a cable to a tall post.',...
    ' The ride spins, causing the rider and chair to travel in a horizontal circle at a constant angular velocity, $$w$$.',...
    '<br><p><img src="http://s8.postimg.org/pkka5kwh1/image.jpg" alt="" width="292" height="302" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p><p><br></p>',...
    'If the rider and chair combined have a mass, $$m$$, of&nbsp',num2str(m),' kg and the length of the cable, $$l$$, is&nbsp',num2str(l),' m, calculate the value of $$w$$ required to maintain an angle of&nbsp',num2str(angle),' degrees with the vertical.</p>',...
    '<p>(Assume a value of $$g$$ of 9.8 m/s<sup>2</sup>)</p>',...
    '<p>$$w$$=&nbsp',numString1,' rad/s',...
    '<p>What is the rider''s angular acceleration, $$\\alpha$$?</p>',...
    '<p>$$\\alpha$$=&nbsp',numString5,' rad/s<sup>2</sup>',...
    '<p>With what frequency, $$f$$, is the rider rotating?</p>',...
    '<p>$$f$$=&nbsp',numString2,' Hz',...
    '<p>What is the rider''s linear velocity, $$V$$?</p>',...
    '<p>$$V$$=&nbsp',numString3,' m/s',...
    '<p>What is the rider''s linear radial acceleration, $$a_r$$?</p>',...
    '<p>$$a_r$$=&nbsp',numString4,' m/s<sup>2</sup>',...
    '<p>What is the rider''s linear tangential acceleration, $$a_t$$?</p>',...
    '<p>$$a_t$$=&nbsp',numString5,' m/s<sup>2</sup>',...
    '<p>(Please give all of your answers correct to 2.d.p. and in the specified units)</p>',...
    '<p>(Question ID #',num2str(i),')');

generalFeedbackStr = strcat('<p>For the rider to travel at a constant velocity, all forces must be balanced.</p>',...
        '<br><p>The downward force to consider in this case is the weight of the rider:</p>',...
        '<p>$$m\\cdot g=',num2str(m),'\\times 9.8=',num2str(down),' N$$',...
        '<p>This must be balanced by the upwards force, supplied by the tension, $$T$$, in the cable:</p>',...
        '<p>$$',num2str(down),'=T\\cdot cos(',num2str(angle),')$$</p>',...
        '<p>Therefore,</p>',...
        '<p>$$T=',num2str(down),'/cos(',num2str(angle),')=',num2str(T),'N$$</p>',...
        '<br><p>Using simple trigonometry, the radius of the circle, $$r$$, that the rider rotates in can be calculated as follows:</p>',...
        '<p>$$r=',num2str(l),'\\times sin(',num2str(angle),')=',num2str(round(r*100)/100),'$$ m.</p>',...
        '<br><p>Next we need to consider horizontal forces.</p>',...
        '<p>The horizontal force supplied by the tension in the cable is equal to:</p>',...
        '<p>$$T\\cdot sin(',num2str(angle),')=',num2str(left),'N$$</p>',...
        '<p>This force must be balanced by the centripetal force of the angular motion of the rider.',...
        '<p>This can be calculated by applying Newton''s second law of motion ($$F=m\\cdot a$$), where $$a$$ is the linear radial acceleration, $$a_r$$, given by $$\\omega^2\\cdot r$$.</p>',...
        '<p>Therefore,</p>',...
        '<p>$$m\\cdot \\omega^2\\cdot r=',num2str(left),'N$$.</p>',...
        '<p>Therefore,</p>',...
        '<p>$$\\omega=\\sqrt{\\frac{',num2str(left),'}{r\\cdot m}}=',num2str(w),'$$ rad/s.</p>',...
        '<br><p>The remainder of the question is relatively straightforward once the value of $$\\omega$$ has been calculated.</p>',...
        '<p>The angular acceleration, $$\\alpha$$ is zero rad/s<sup>2</sup>, as there is no change in the angular velocity.</p>',...
        '<p>The relationship $$\\omega=2\\cdot \\pi\\cdot f$$ can be used to calculate $$f=',num2str(f),'Hz$$</p>',...
        '<p>The relationship $$V=r\\cdot \\omega$$ can be used to calculate $$V=',num2str(V),'$$ m/s.</p>',...
        '<p>The relationship $$a_r=\\omega^2\\cdot r$$ can be used to calculate $$a_r=',num2str(ar),'$$ m/s<sup>2</sup>.</p>',...
        '<p>As the rider has a constant linear velocity (or alternatively a constant angular velocity), the linear tangential acceleration $$a_t$$ is zero m/s<sup2</sup>.</p>',...
             '<p>---------------------------------------------------------------------------------------------------------------------</p>',...
     '<p>Image adapted from Dynamics lecture notes.</p>');
    
    hint1 = strcat('<b>HINT</b><p>To answer this question simply draw a force diagram showing balanced forces in both the horizontal and and vertical planes.</p><p>The three forces at play here are the tension in the cable, gravity, and the centripetal force of the angular motion.</p><p>Concentrate on calculating $$\\omega$$ first before answering any other parts of the question.</p>');...

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