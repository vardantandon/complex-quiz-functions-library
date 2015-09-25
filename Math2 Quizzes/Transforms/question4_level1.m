%Last Updated: 13/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question4_level1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    alpha = randi([1,10]);
    w = randi([1,10]);
    
    syms t a b s;
    
    if (mod(i,3) == 0)
        f = cos(w*t);
        questionFromTable = cos(b*t);
        formFromTable = s/(s^2 + b^2);
        substitutionString = strcat('b =&nbsp;', num2str(w)');
    elseif (mod(i,3) == 1)
        f = sin(w*t);
        questionFromTable = sin(b*t);
        formFromTable = b/(s^2 + b^2);
        substitutionString = strcat('b =&nbsp;', num2str(w)');
    else
        f = exp(-alpha*t);
        questionFromTable = exp(-a*t);
        formFromTable = 1/(s + a);
        substitutionString = strcat('a =&nbsp;', num2str(alpha)');
    end
    output = laplace(f);
    
    questionString = strcat('Level 1<br><br>Use a table of Laplace Transforms to find </p><br>', ...
        '<p style="text-align: center;">$$ \small \mathscr{L}\{', latex(f),'\} $$. </p><p><br>', ...
        'Laplace Transforms table can be found <a href="http://www.ucl.ac.uk/~rmapdpg/ENGS203P/laplace.png" target="_blank">here</a>.', ...
        '<br>Help on how to insert mathmetical expressions in your answer can be found <a href="http://www.ucl.ac.uk/~rmapdpg/ENGS203P/equation_input.png" target="_blank">here</a>.');
    
    instruction1 = 'From the Laplace Tables,';
    instruction2 = strcat('Substituting&nbsp;', substitutionString, ', we get:'); 
    
    step1 = strcat('$$ \small \mathscr{L}\{', latex(questionFromTable), '\} =', latex(formFromTable), ' $$');
    step2 = strcat('$$ \small \mathscr{L}\{', latex(f), '\} = ', latex(output), ' $$');
    
    feedbackString = strcat( ...
        instruction1, '<br>', step1, '<br>', ...
        instruction2, '<br>', step2, '<br>');
    
    %This if condition is to fix an error where during some iterations in
    %the loop, feedbackString ends up being a 1x2 matrix with two sets of
    %the same string; that causes the code to write 'ffrroomm' instead of
    %'from' into the output file for eg.
    if size(feedbackString,1) > 1
        %disp(feedbackString(1,:));
        feedbackString = feedbackString(1,:);
    end
    
    %Question output
    fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="algebra">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>Laplace Transform Level 1</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>%s</p>]]></text>', questionString);
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