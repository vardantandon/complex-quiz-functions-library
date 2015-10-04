file=fopen('Bat and Ball.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('Bat and Ball. Question ID #', ID);

% assigning random variables

       t=2;
       v=randi([30,60]);
       m=randi([110,250])/1000;
%      calculations
       im=m*v;
       F=1000*im/t;
           
numString1 = cloze_numerical((round(im*10)/10), 0.02*im, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical((round(F*10)/10), 0.02*F, 'Good job!', 'Incorrect, try again');


questionString = strcat('<p>A bat hits a stationary ball with a typical collision time of 2 ms. A speed of&nbsp',num2str(v),' m/s',...
        ' is imparted to the ball, which has a mass of&nbsp',num2str(m),' kg.</p>',...
        '<p>What impulse is applied to the ball?</p>',...
        numString1,' N.s',....
        '<p><br></p><p><img src="http://s14.postimg.org/but1teml9/bat2.gif" alt="" width="150" height="158" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p><p><br></p>',...
        '<p>What is the average force, $$F$$, exerted by the bat on the ball?</p>',...
        numString2, ' N',...
        '<p>(Please give your answers correct to 1.d.p.)</p>',...
        '<p>(Question ID #',num2str(i),').</p>');
    
        

generalFeedbackStr = strcat('<p>Recall from your lectures that impulse is equal to the product of force and time:</p>',...
        '<p>$$I=F.t$$</p>',...;
        '<p>But according to Newton''s second law:</p>',...
        '<p>$$F=m.a$$</p>',...
        '<p>Therefore:</p>',...
        '<p>$$I=F.t=m.a.t=m.\\frac{\\Delta v}{t}.t=m.\\Delta v=',num2str(round(im*10)/10),'N.s$$,</p>',...
        '<p>as impulse is also equal to change in momentum.</p>',...
        '<br><p>Our original defintion of impulse as given above can be rearranged:</p>',...
        '<p>$$F=\\frac{I}{t}=',num2str(round(F*10)/10),'N$$.</p>',...
        '<p>---------------------------------------------------------------------------------------------------------------------</p>',...
     '<p>Image adapted from ''http://www.spiritsd.ca/curr_content/physics30/opt_kindyn/images/bat2.gif''</p>');
    
   
    hint1 = strcat('<b>HINT</b><p>Remember that impulse is equal to change in momentum.</p><p>Newton''s second law of motion may also be helpful in answering this question.</p>');

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