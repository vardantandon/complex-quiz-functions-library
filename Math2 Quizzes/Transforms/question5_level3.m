%Last Updated: 13/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question5_level3.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
    %Calculations
    
    syms x a b c d m g h s;
    a = randi([1 5]);
    b = randi([6 9]);
    c = randi([1 9]);
    d = randi([20 30]);
    m = randi([2 5]);
    g = randi([1 3]);
    h = randi([3 6]);
    f = ((g*s^2 + (a*h + b*g + g*m*a)*s + a*h*m + b*g*m + d) / ((s + m)*(a*s^2 + b * s + c)));
    output = ilaplace(f);
    aString = '';
    cString = '';
    gString = '';
    agString = '';
    
    if a ~= 1
        aString  = num2str(a);
    end
    if c ~= 1
        cString  = num2str(c);
    end
    if g ~= 1
        gString  = num2str(g);
    end
    if a*g ~= 1
        agString = num2str(a*g);
    end
    
    step1 = strcat(aString,' [ s^2Y(s) - \frac{dy}{dt}(0) - sy(0)] + ', num2str(b), '[sY(s) - y(0)] + ', cString, '[Y(s)] = \frac{', num2str(d), '}{s + ', num2str(m), '}');
    step2 = strcat(aString,' [ s^2Y(s) - ', num2str(h), ' - ', gString, 's] + ', num2str(b), '[sY(s) - ', num2str(g), '] + ', cString, '[Y(s)] = \frac{', num2str(d), '}{s + ', num2str(m), '}');
    step3 = strcat(' Y(s) [', aString, 's^2 + ', num2str(b), 's + ', num2str(c), '] = \frac{', num2str(d), '}{s + ', num2str(m), '} + ', agString, 's + ', num2str(a*h + b*g)); %', num2str(), '
    step4 = strcat(' Y(s) = ', latex(f));
    step5 = strcat(' Y(s) = ', latex(feval(symengine, 'partfrac', f)));
    
    feedbackString = strcat('Remember that <br> $$ \small \mathscr{L}\{\frac{d^2 y}{d t^2}\} = s^2Y(s) - \frac{dy}{dt}(0) - sy(0) $$<br>and', ...
        '<br> $$ \small \mathscr{L}\{\frac{d y}{d t}\} = sY(s) - y(0)$$<br><br>');
    feedbackString = strcat(feedbackString, 'Step 1: Take laplace transform of both sides:<br>');
    feedbackString = strcat(feedbackString, '$$ \small \Rightarrow', step1, ' $$<br>');
    feedbackString = strcat(feedbackString, 'Step 2: Substitute in coefficients and initial conditions:<br>');
    feedbackString = strcat(feedbackString, '$$ \small \Rightarrow', step2, ' $$<br>');
    feedbackString = strcat(feedbackString, 'Step 3: Collect <b>Y(s)</b> terms on one side and <b>s</b> terms on the other:<br>');
    feedbackString = strcat(feedbackString, '$$ \small \Rightarrow', step3, ' $$<br>');
    feedbackString = strcat(feedbackString, 'Step 4: From an expression for <b>Y(s)</b>:<br>');
    feedbackString = strcat(feedbackString, '$$ \small \Rightarrow', step4, ' $$<br>');
    feedbackString = strcat(feedbackString, 'Step 5: Split the partial fractions: <br>'); 
    feedbackString = strcat(feedbackString, '$$ \small \Rightarrow', step5, ' $$<br>');
    feedbackString = strcat(feedbackString, 'Finally, rewrite the above to match forms on the Laplace Transforms table and take the inverse laplace, <br>');
    feedbackString = strcat(feedbackString, '$$ \small \Rightarrow', latex(output), ' $$<br>');
    
    %Question output
    fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="algebra">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>Level 3 - Differential Equations using Laplace Transforms</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text><![CDATA[<p>Level 3<br><br>Use Laplace transforms to solve the following differential equation given that y = %i and dy/dt = %i at t = 0:<br><br><p style="text-align: center;">$$ \\small %s\\frac{d^2 y}{d t^2} + %i\\frac{dy}{dt} + %sy = %iexp(-%it) $$ </p><br>Laplace Transforms table can be found <a href="http://www.ucl.ac.uk/~rmapdpg/ENGS203P/laplace.png" target="_blank">here</a>.<br>Help on how to insert mathmetical expressions in your answer can be found <a href="http://www.ucl.ac.uk/~rmapdpg/ENGS203P/equation_input.png" target="_blank">here</a>.</p>]]></text>', g, h, aString, b, cString, d, m);
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
    fprintf(file,'\n    <answerprefix><text>y(t) =</text></answerprefix>');
    fprintf(file,'\n    <answer fraction="100" format="moodle_auto_format">');
    fprintf(file,'\n      <text>%s</text>', strrep(strrep(char(output), 'exp(', 'e^('),'e^(-(','e^((-'));
    fprintf(file,'\n      <feedback format="html">');
    fprintf(file,'\n        <text></text>');
    fprintf(file,'\n      </feedback>');
    fprintf(file,'\n    </answer>');
    fprintf(file,'\n    <variable name="t">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n  </question>');
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);