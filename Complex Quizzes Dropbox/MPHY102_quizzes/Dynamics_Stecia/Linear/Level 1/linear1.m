% Generates *.xml scripts for Moodle Embedded answers [cloze]
% question name - Linear Mechanics level 1
% Created by Stecia-Marie Fletcher for Dr. Pilar Garcia Souto and the Mechanics and Materials Module
% UCL Department: Medical Physics and Bioengineering
% Date:1/10/14
% version 1.0

lin1=fopen('linear1.xml','w');

fprintf(lin1,'%s','<?xml version="1.0" encoding="UTF-8"?>');
fprintf(lin1,'\n%s','<quiz>');

for i=1:1:75
    
    %Assigning values
    
    %Initial velocity km/hr
    w=randi([50,100]);
        
    %Distance from collapsed road m
    s=randi([10,30]);
    
    %One dimensional constant acceleration equation of motion
    %v^2=u^2+2as
    
    %Calculations
    
    %Initial velocity m/s
    
    u=w*(1000/3600);
    
    %Final Velocity v=0
    
    %By rearranging the equation of motion
    
    %The acceleration
    
    a=-1*(u^2)/(2*s);
    
    %The deceleration
    
    d=-1*a;
    
    %Preliminary code
    
    fprintf(lin1,'\n<!--question %d-->',i);
    fprintf(lin1,'\n%s','<question type="cloze">');

    fprintf(lin1,'\n%s','<name>');
    fprintf(lin1,'\n<text>Linear %d Level 1</text>',i);
    fprintf(lin1,'\n%s','</name>');
    
    %Question text and image
    
    fprintf(lin1,'\n%s','<questiontext format="html">');
    fprintf(lin1,'\n%s','<text>');
    fprintf(lin1,'\n%s','<![CDATA[<p><img style="width: 625px; heght: 500px; margin-right: auto; margin-left: auto; display: block;"');
    fprintf(lin1,'%s','src="http://www.ucl.ac.uk/~wmapsfl/moodle/mechanics/truck1.jpg"');
    fprintf(lin1,'%s','alt="truck" width="30 height="30"/></p>');
    
    if i<=25
    
    fprintf(lin1,'\n<p style="text-align: left;">A truck is moving at %d km/h.',w);
    fprintf(lin1,'The driver notices that the road has collapsed at a distance %d m ahead and applies brakes. ',s);
    fprintf(lin1,'%s','Assuming that the driver''s thinking time is negligible and that the deceleration produced by the brakes is uniform');
    fprintf(lin1,'%s',', find the deceleration required to stop the truck before reaching the collapsed road.</p>');
    fprintf(lin1,'%s','(Give your answer to the nearest whole number.)</p>');

    %Deceleration
    
    fprintf(lin1,'\n%s','<p style="text-align: center;" >');
    fprintf(lin1,'Deceleration = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} ms<sup>-2</sup></p>',d);
    
    fprintf(lin1,'\n%s','How would your answer change if the truck was moving twice as fast?</p>');

    fprintf(lin1,'\n%s','<p>{1:MULTICHOICE:Remain the same.~=Increase by a factor of 4.~Increase by a factor of 2.~Decrease by a factor of 4.~Decrease by a factor of 2.}</p>]]>');
    
    elseif i>=50
        
    fprintf(lin1,'\n<p style="text-align: left;">A truck is moving at %d km/h.',w);
    fprintf(lin1,'The driver notices that the road has collapsed ahead of him. He immediately applies brakes with a deceleration of %3.0f ms<sup>-2</sup>.',d);
    fprintf(lin1,'%s',' Assuming that the driver''s thinking time is negligible and that the deceleration produced by the brakes is uniform');
    fprintf(lin1,'%s',', find the minimum distance,s, required to stop before reaching the collapsed road.</p>');
        fprintf(lin1,'%s','(Give your answer to the nearest whole number.)</p>');


    %Distance
    
    fprintf(lin1,'\n%s','<p style="text-align: center;" >');
    fprintf(lin1,'Distance = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} m</p>',s);
    
    fprintf(lin1,'\n%s','How would your answer change if the truck was moving twice as fast?</p>');

    fprintf(lin1,'\n%s','<p>{1:MULTICHOICE:Remain the same.~=Increase by a factor of 4.~Increase by a factor of 2.~Decrease by a factor of 4.~Decrease by a factor of 2.}</p>]]>'); 
    
    else
        
    fprintf(lin1,'\n<p style="text-align: left;">The driver of a truck notices that the road has collapesed %d m ahead of him.',s);
    fprintf(lin1,' He immediately applies brakes with a deceleration of %3.0f ms<sup>-2</sup>.',d);
    fprintf(lin1,'%s',' Assuming that the driver''s thinking time is negligible and that the deceleration produced by the brakes is uniform');
    fprintf(lin1,'%s',', find the maximum velocity, u (in km/h), at which the truck must be moving for it to stop before the collapsed road.</p>');
        fprintf(lin1,'%s','(Give your answer to the nearest whole number.)</p>');


    %Speed
    
    fprintf(lin1,'\n%s','<p style="text-align: center;" >');
    fprintf(lin1,'Velocity = {1:NUMERICAL:=%3.0f:1#Good job!~*#Sorry. Try again.} km/h</p>',w);
    
    fprintf(lin1,'\n%s','How would your answer change if the deceleration of the brakes were half as large?</p>');

    fprintf(lin1,'\n%s','<p>{1:MULTICHOICE:Remain the same.~Increase by a factor of 4.~Increase by a factor of 2.~Decrease by a factor of 4.~=Decrease by a factor of 2.}</p>]]>');   
    
    end
    
    fprintf(lin1,'\n%s','</text>');
    fprintf(lin1,'\n%s','</questiontext>');
    
    %General feedback
    
    fprintf(lin1,'\n%s','<generalfeedback format="html">');
    fprintf(lin1,'\n%s','<text>');
    
    fprintf(lin1,'\n%s','<![CDATA[<p>To solve this problem, you can use the one-dimensional equation of motion for constant acceleration systems.</p>');
    fprintf(lin1,'\n%s','<p>v<sup>2</sup>=u<sup>2</sup>+2as</p>');
    fprintf(lin1,'\n%s','<p>Where v is the final velocity, u is the initial velocity, a is the acceleration and s is the displacement.</p>');
    fprintf(lin1,'\n%s','<p>In this case v=0. Also convert the initial velocity, u, from km/hr to ms<sup>-1</sup> before making calculations.</p>]]>');
    
    fprintf(lin1,'\n%s','</text>');
    fprintf(lin1,'\n%s','</generalfeedback>');

    fprintf(lin1,'\n%s','<penalty>0</penalty>');
    fprintf(lin1,'\n%s','<hidden>0</hidden>');
    
    fprintf(lin1,'\n%s','</question>');    
end

fprintf(lin1,'\n%s','</quiz>');