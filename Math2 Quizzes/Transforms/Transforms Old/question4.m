%Last Updated: 13/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question4.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    alpha = randi([1,10]);
    w = randi([1,10]);
    
    syms t a b s;
    
    if (mod(i,2) == 0)
        f = exp(alpha*t)*cos(w*t);
        questionFromTable = exp(-a*t)*cos(b*t);
        formFromTable = (s - a)/((s - a)^2 + b^2);
    else
        f = exp(alpha*t)*sin(w*t);
        questionFromTable = exp(-a*t)*sin(b*t);
        formFromTable = b/((s - a)^2 + b^2);
    end
    output = laplace(f);
    
    feedbackString = strcat('From tables, <br> $$ \small \mathscr{L}\{', latex(questionFromTable), '\} = ', latex(formFromTable), '$$<br>Here a&nbsp;=&nbsp;', num2str(alpha), '&nbsp;and&nbsp;b&nbsp;=&nbsp;', num2str(w), '.<br>'); % $$ \small \mathscr{L}\{', latex(f), '\} = ', latex(output), '$$'

    %Question output
    fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="algebra">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>Laplace Transform</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>Use a table of Laplace Transforms to find $$ \\small \\mathscr{L}\\{%s\\} $$. <br><br>Find the Laplace Transforms table <a href="https://en.wikipedia.org/wiki/Laplace_transform" target="_blank">here</a>.</p>]]></text>', latex(f));
    fprintf(file,'\n    </questiontext>');
    fprintf(file,'\n    <generalfeedback format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>%s</p>]]></text>', feedbackString);
    fprintf(file,'\n    </generalfeedback>');
    fprintf(file,'\n    <defaultgrade>1.0000000</defaultgrade>');
    fprintf(file,'\n    <penalty>0.3333333</penalty>');
    fprintf(file,'\n    <hidden>0</hidden>');
    fprintf(file,'\n    <compareby>eval</compareby>');
    fprintf(file,'\n    <tolerance>0.001</tolerance>');
    fprintf(file,'\n    <nchecks>10</nchecks>');
    fprintf(file,'\n    <disallow><text></text></disallow>');
    fprintf(file,'\n    <allowedfuncs></allowedfuncs>');
    fprintf(file,'\n    <answerprefix><text></text></answerprefix>');
    fprintf(file,'\n    <answer fraction="100" format="moodle_auto_format">');
    fprintf(file,'\n      <text>%s</text>', char(output));
    fprintf(file,'\n      <feedback format="html">');
    fprintf(file,'\n        <text></text>');
    fprintf(file,'\n      </feedback>');
    fprintf(file,'\n    </answer>');
    fprintf(file,'\n    <variable name="s">');
    fprintf(file,'\n        <min>0</min>');
    fprintf(file,'\n        <max>100</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n  </question>');
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);