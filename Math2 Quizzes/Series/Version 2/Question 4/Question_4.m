file = fopen('Question_4.xml', 'w');
fprintf(file,quiz_start());

for i=1:1:10
    
flag = randi([1 3],1,1)
a = randi ([1 2],1,1)
b = randi([1 3],1,1)
syms x
cos_f =  1 - (a*(x^2))/2
sin_f = a*x - (a*(x^3))/6
tan_f = a*x +  (a*(x^3))/3

aString = '';
bString = '';

if a~= 1
    aString = num2str(a);
end
if b~= 1
    bString = num2str(b);
end

if (flag == 1)
        str = 'cos'
        answer = simplify(b*(cos_f*cos_f  - (a*(x^2)/2)^2) ) 
        feedbackString = strcat('The Maclaurin expansion for cos(x) : <br>', char(simplify(taylor(cos(x)))),'<br>');
  
else if (flag == 2)
        str = 'sin'
        answer = simplify(b*(sin_f*sin_f -   ((a*(x^3))/6)^2 ))
         feedbackString = strcat('The Maclaurin expansion for sin(x) : <br>', char(simplify(taylor(sin(x)))),'<br>');
  
else 
        str = 'tan'
        answer = simplify(b*(tan_f*tan_f  -  ((a*(x^3))/3) ^2 ))
         feedbackString = strcat('The Maclaurin expansion for tan(x) : <br>', char(simplify(taylor(tan(x)))),'<br>');
  
    end
end 
 
 
 
    fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="algebra">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>Maclaurin Series</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>Use the Maclaurin series for %s(x) to find the first two-non zero terms of the Maclaurin expansion for %s%s<sup>2</sup>(%sx). </p>]]></text>',str,bString,str,aString);
    fprintf(file,'\n    </questiontext>');
    fprintf(file,'\n    <generalfeedback format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>%s</p>]]></text>',feedbackString);
    fprintf(file,'\n    </generalfeedback>');
    fprintf(file,'\n    <defaultgrade>1.0000000</defaultgrade>');
    fprintf(file,'\n    <penalty>0.3333333</penalty>');
    fprintf(file,'\n    <hidden>0</hidden>');
    fprintf(file,'\n    <compareby>eval</compareby>');
    fprintf(file,'\n    <tolerance>0.001</tolerance>');
    fprintf(file,'\n    <nchecks>10</nchecks>');
    fprintf(file,'\n    <disallow><text></text></disallow>');
    fprintf(file,'\n    <allowedfuncs></allowedfuncs>');
    fprintf(file,'\n    <answerprefix><text>%s</text></answerprefix>', 'Answer(in x) = ');
    fprintf(file,'\n    <answer fraction="100" format="moodle_auto_format">');
    fprintf(file,'\n      <text>%s</text>', strrep(char(answer), 'exp(', 'e^('));
    fprintf(file,'\n      <feedback format="html">');
    fprintf(file,'\n        <text></text>');
    fprintf(file,'\n      </feedback>');
    fprintf(file,'\n    </answer>');
    fprintf(file,'\n    <variable name="x">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n  </question>');    
  
end 

fprintf(file, quiz_end()); %xml closing code
fclose(file);