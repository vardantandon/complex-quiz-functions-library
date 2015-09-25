comb1=fopen('Projectiles-Advanced.xml','w');

fprintf(comb1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(comb1,'\n%s','<quiz>');

for i=1:1:100
    
    %load image - code this later
    %generating random parameters for question (distance D and time M), and calculating working
    %steps
    
    D=19;
    T=25;
    D=randi([10,30]);
    T=randi([20,40]);
    X=T/2;
    Y=D*1000/T;
    Z=9.8*X;
    W=Z/Y;
    B=atan(W);
    C=B*180/pi;
    V=Z/sin(B);   
    
fprintf(comb1,'\n%s','<question type="cloze">');

fprintf(comb1,'\n%s','<name>');
fprintf(comb1,'\n<text>Projectiles Advanced %d </text>',i);
fprintf(comb1,'\n%s','</name>');

fprintf(comb1,'\n%s','<questiontext format="html">');
fprintf(comb1,'\n<text><![CDATA[<p>HMS Belfast is a warship situated on the River Thames. Its guns are aimed to fire at a motorway service station %2.0f km away. ', D);
fprintf(comb1,'\nAssuming no air resistance, and that the ship and service station are at the same height above sea level, at what velocity must the shells leave the guns in order to reach the service station in a time of %2.0f seconds?</p>', T);
fprintf(comb1,'\n%s','<p>(Give your answer in m/s to 1.d.p.)</p>');
fprintf(comb1,'\n%s','<p>(Use a value of g of -9.8 m/s<sup>2</sup>)</p>');
fprintf(comb1,'\n<p>{1:NUMERICAL:=%.1f:0.05#Good job!~*#Sorry. Try again.}</p>',V);
fprintf(comb1,'\n%s','<p></p>');


    E=randi([1510,1550]);
    M=randi([50,70]);
    F=(M/2)*((E^2)-(228484));
    ANS=F/1000000;
 

fprintf(comb1,'\n%s','<p>The maximum firing range of the HMS Belfast front guns at 45 degrees, taking air resistance into account, is stated to be 23.3 km. '); 
fprintf(comb1,'\nThe stated maximum velocity at which the shells leave the gun is %4.0f m/s. ', E); 
fprintf(comb1,'\nEach shell weighs %2.0f kg. Calculate the energy loss of the shells due to air resistance when they are fired to the maximum range at 45 degrees.</p>', M);
fprintf(comb1,'\n%s','<p>(Give your answer in MJ to 2.s.f.)</p>');
fprintf(comb1,'\n%s','<p>(Again use a value of g of -9.8 m/s<sup>2</sup>)</p>');
fprintf(comb1,'\n<p>{1:NUMERICAL:=%2.0f:0.5#Good job!~*#Sorry. Try again.}</p>', ANS);
fprintf(comb1,'\n%s','<p></p>');
fprintf(comb1,'\n%s','<p></p>');
fprintf(comb1,'\n%s','<p></p>]]></text>');

fprintf(comb1,'\n%s','</questiontext>');
fprintf(comb1,'\n%s','<generalfeedback format="html">');
fprintf(comb1,'\n%s','<text></text>');
fprintf(comb1,'\n%s','</generalfeedback>');
fprintf(comb1,'\n%s','<penalty>0.0000000</penalty>');
fprintf(comb1,'\n%s','<hidden>0</hidden>');

fprintf(comb1,'\n%s','<hint format="html">');
fprintf(comb1,'\n%s','<text><![CDATA[<p>First of all, work out the velocity in the x-direction, and then obtain an expression for the initial velocity in the y-direction. Then combine these two expressions to calculate the angle of trajectory of the shells, and then their velocity.</p>');
fprintf(comb1,'\n%s','<p>For the second question, calculate the initial velocity to achieve the maximum given range with no air resistance, when fired at 45 degrees. Then calculate the difference in kinetic energy between the shells when fired at this speed compared to the speed calculated in the first question.</p>]]></text>');
fprintf(comb1,'\n%s','</hint>');
fprintf(comb1,'\n%s','</question>')
end
fprintf(comb1,'\n%s','</quiz>');


% fprintf(comb1,'\n%s','<text><![CDATA[<p>Let V<sub>o</sub> = initial velocity and PHI = angle of trajectory.</p>');
% fprintf(comb1,'\n<p>In the x-direction, [s=V<sub>o</sub>*cosPHI*t], therefore V<sub>o</sub>*cosPHI = D*1,000/T = %.1f</p>',Y);
% fprintf(comb1,'\n<p>The maximum height attained by the shells occurs at T/2 = %.1f seconds, at which point V<sub>y</sub>=0 m/s.</p>',X);
% fprintf(comb1,'\n<p>As [v = u + a*t], u = V<sub>o</sub>*sinPHI = 9.8*12.5 = %.1f</p>',Z);
% fprintf(comb1,'\n<p>Using the identity [sinPHI/cosPHI = tanPHI] gives tanPHI = %.3f</p>',W);
% fprintf(comb1,'\n<p>Therefore PHI = %.2f degrees</p>', C); 
% fprintf(comb1,'\n<p>Using V<sub>o</sub> = ((T/2)*9.8)sin(PHI) OR V<sub>o</sub> = ((1,000*D)/T)/cos(PHI) gives V<sub>o</sub> = %.1f m/s </p>]]></text>', V);


