file=fopen('Fatigue-Question.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('Fatigue. Question ID #', ID);

% Define Variables 
% radius of crack tip in micrometres
r=randi([3,9]);
% fracture stress of bone plate material in MPa
fs=randi([30,50]*10);
% nominal stress acting on bone plate in Mpa
n=randi([25,50]);
ns=n/10;
% To calculate catastrophic crack length in mm
af=(((fs/ns)-1)/2)^2*r/1000;
% initial crack length in mm
l=randi([1,30]);
ai=1/10;
% define constant C in pa^-2.m^-1
C=3*10^-16;
% define variable x = C.pi^2.nominalstress^2
x=C*((pi).^2)*((ns*10^6).^2);
% calculating number of steps to failure
N=(1/x)*((-1/(af/1000))-(-1/(ai/1000)));
% number of steps taken per day
s=randi([10,30])*100;
% number of days to failure
D=N/s;

numString1 = cloze_numerical((round(af*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical(round(D), 0.5, 'Good job!', 'Incorrect, try again');

questionString = strcat('<p>An athlete breaks her leg in an accident and has a bone plate fitted, as shown in the radiograph below.</p>',... 
    '<p><img src="http://www.vetsurgerycentral.com/images/orthopedics/fracture_tibia/tibia2.jpg" alt="" width="230" height="409" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>',...
    '<p>Analysis of the radiograph reveals a&nbsp',num2str(ai),' mm long crack in the woman''s bone plate.</p>',...
    '<p>The tensile loading on the plate at right angles to the plane of the crack cycles between 0 and&nbsp',num2str(ns),' MPa with each step she takes.</p>',...
    '<p>Suppose the fracture stress of the bone plate material is&nbsp',num2str(fs),' MPa and the radius of the crack tip is&nbsp',num2str(r),' $$\\small\\mu$$m throughout.</p>',... 
    '<p>How long will the crack be when the plate fails?</p>',...
    '<p>(Give your answer in mm to 1.d.p.)</p>',...
    numString1,...
    '<p>She takes, on average,&nbsp',num2str(s),' steps each day. The rate of crack growth is given by:<p>',...
    '<p>$$\\frac{da}{dN}=C\\cdot \\left(\\Delta \\sigma _o\\right)^2\\cdot \\pi ^2\\cdot a^2\\$$</p>',...
    '<p>Where: $$a$$ = crack length; $$N$$ = number of loading cycles; $$\\small\\Delta \\sigma _o$$ = the difference between the minimum and maximum nominal stress on the plate at right angles to the crack;',... 
    ' and $$C$$ = a constant, of value 3 x 10<sup>-16</sup> Pa<sup>-2</sup>.m<sup>-1</sup> for the current situation.</p>',...
    '<p>Ignoring the impact of any bone healing, how long will it be before the plate fails?</p>',...
    '<p>(Give your answer in days to the nearest whole number)</p>',...
    numString2,...
    '<p>(Question ID #',num2str(i),').</p>');


generalFeedbackStr = strcat('In order to find the crack length at failure, rearrange the Griffiths Formula to make $$l$$ the subject as follows:',...
    '<p>$$l=\\left(\\left(\\frac{\\sigma \\:_c}{\\sigma \\:_o}-1\\right)\\cdot \\:0.5\\right)^2\\cdot r$$</p>',...
    '<p>In this case: $$\\small\\sigma _c$$ = &nbsp',num2str(fs),' MPa; $$\\small\\sigma _o$$ = &nbsp',num2str(ns),' MPa; and $$r$$ =&nbsp',num2str(r),'$$\\small\\mu$$m</p>',...
    '<p></p><br><p>By rearranging the equation given in the question, and integrating between the limits of the initial crack length $$(_{a_i})$$ and crack length at failure $$(_{a_f})$$, the following expression can be produced:</p>',...
    '<p>$$N=C\\cdot \\left(\\Delta \\sigma _o\\right)^2\\cdot \\pi ^2\\cdot \\left[-a^{-1}\\right]_{a_i}^{a_f}$$</p>',...
    '<p>In this case: $$C$$ = 3 x 10<sup>-16</sup> Pa<sup>-2</sup>.m<sup>-1</sup>; $$\\small\\Delta \\sigma _o$$ =&nbsp',num2str(ns),' MPa; $$_{a_f}$$ =&nbsp',num2str(round(af*10)/10),' mm; and $$_{a_i}$$ =&nbsp',num2str(ai),' mm.</p>',...
    '<p>This gives a value of $$N$$ =&nbsp',num2str(round(N)),' (the number of steps before the plate fails).</p>');

hint1 = strcat('<b>HINT</b><p>Use the Griffiths Formula (or Stress Raiser equation) to answer the first part of the question:</p>',...
    '<p>$$\\sigma _c=\\sigma _o\\cdot \\left(1+2\\cdot \\sqrt{\\frac{l}{r}}\\right)$$</p>',...
    '<p>Where: $$\\small\\sigma _c$$ = the stress at the tip of the crack; $$\\small\\sigma _o$$ = the nominal stress distant from the crack;',...
    ' $$l$$ = the the length of the surface crack; and $$r$$ = the crack tip radius.</p>',...
    '<p>To answer the second part of the question, you will need to integrate the equation given in the question, and evaluate it between the limits of the inital crack length, and crack length at plate failure.</p>');

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



