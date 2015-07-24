%Last Updated: 13/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question4_level2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    alpha = randi([1,10]);
    w = randi([1,10]);
    
    syms t a b s;
    
    if (mod(i,2) == 0)
        f = exp(-alpha*t)*cos(w*t);
        questionFromTable = exp(-a*t)*cos(b*t);
        formFromTable = (s + a)/((s + a)^2 + b^2);
        trigString = 'cos';
        trigLatex = '\frac{s}{s^2 + b^2}';
    else
        f = exp(-alpha*t)*sin(w*t);
        questionFromTable = exp(-a*t)*sin(b*t);
        formFromTable = b/((s + a)^2 + b^2);
        trigString = 'sin';
        trigLatex = '\frac{b}{s^2 + b^2}';
    end
    output = laplace(f);
    
    instruction1 = 'From the Laplace Tables,';
    instruction2 = 'According to the Shift Theorem,';
    instruction3 = strcat('If f(t) =&nbsp;', trigString, '(bt), we get:');
    instruction4 = strcat('Finaly substituting a =&nbsp;', num2str(alpha), ' and b =&nbsp;', num2str(w), ' we get:'); 
    
    step1 = strcat('$$ \small \mathscr{L}\{', trigString, '(bt)\} =', trigLatex, ' $$');
    step2 = strcat('$$ \small \mathscr{L}\{f(t)e^{-at}\} = F(s+a) $$');
    step3 = strcat('$$ \small \mathscr{L}\{', trigString, '(bt)e^{-at}\} =', latex(formFromTable), ' $$');
    step4 = strcat('$$ \small \mathscr{L}\{', latex(f), '\} = ', latex(output), ' $$');
    
    feedbackString = strcat( ...
        instruction1, '<br>', step1, '<br>', ...
        instruction2, '<br>', step2, '<br>', ...
        instruction3, '<br>', step3, '<br>', ...
        instruction4, '<br>', step4);

    %Question output
    fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="algebra">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>Laplace Transform Level 2</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>Level 2<br><br>Use a table of Laplace Transforms to find </p><br><p style="text-align: center;">$$ \\small \\mathscr{L}\\{%s\\} $$. </p><p><br>Laplace Transforms table can be found <a href="http://www.ucl.ac.uk/~rmapdpg/ENGS203P/laplace.png" target="_blank">here</a>.<br>Help on how to insert mathmetical expressions in your answer can be found <a href="http://www.ucl.ac.uk/~rmapdpg/ENGS203P/equation_input.png" target="_blank">here</a>.</p>]]></text>', latex(f));
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