%Last Updated: 13/07/2015
%Authored By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto
%UCL Department: Medical Physics and Bioengineering

file=fopen('question1.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:5
    
    %Calculations
    %coeff1 = 4; %randi([2,10]) %4
    %coeff2 = 1; %randi([2,10]) %1
    
    coeff1 = randi([1,4]) * 2;
    coeff2 = randi([1,3]) * 2;
    
    syms x L n b t p;
    ini_conditions = (coeff1*x/L) * (-x/L + coeff2);
    f = ini_conditions * sin(n*p*x/L);
    intVal = (int(f, 0, L) * 2 / L);
    answer = intVal * sin(n*p*x/L) * exp(-(n^2)*(p^2)*(b^2)*t / (L^2));
    
    assume((n - 1)/2, 'integer'); %Assume odd
    assume(p == pi); %Ensures the numerical value of pi isn't used, and it remains as a symbol
    simplifiedAnswer = simplify(answer);

    ansString = char(simplifiedAnswer);
    ansString = strrep(ansString, 'exp(', 'e^(');
    ansString = strrep(ansString, 'n','(2n-1)');
    ansString = strrep(ansString, 'si(2n-1)', 'sin');
    
    latexAnsString = latex(simplifiedAnswer);
    latexAnsString = strrep(latexAnsString, 'b', '\beta');
    latexAnsString = strrep(latexAnsString, 'n','(2n-1)');
    latexAnsString = strrep(latexAnsString, 'si(2n-1)', 'sin');
    
    assume((n - 1)/2, 'integer'); %Assume odd
    assume(p == pi); %Ensures the numerical value of pi isn't used, and it remains as a symbol
    simplifiedIntVal = simplify(intVal);
    
%     latexIntValString = latex(intVal);
%     latexIntValString = strrep(latexIntValString, 'n','(2n-1)');
%     latexIntValString = strrep(latexIntValString, 'si(2n-1)', 'sin');
    
%     if (mod(i,2) == 0)
%         f = exp(a*t)*cos(b*t);
%     else
%         f = exp(a*t)*sin(b*t);
%     end

    output = laplace(f);
    
    step0 = '$$ \small u(x,t) =  \sum_{{n}={1}}^{\infty}  u_n(x,t) =  \sum_{{n}={1}}^{\infty} c_n\sin{\frac{n\pi x}{L}}exp [-\frac{n^2\pi^2}{L^2} \beta^{2} t]  $$';
    step1 = 'This is a half-range Fourier series, so;';
    step2 = ['$$ \small c_n = \frac{2}{L} \int_{0}^{L} [-\frac{', num2str(-coeff1), 'x^2}{L^2}sin(\frac{n\pi x}{L})+\frac{', num2str(coeff1+coeff2), 'x}{L}sin(\frac{n\pi x}{L})]dx $$'];
    step3 = 'Solving the integral';
    step4 = ['$$ \small c_n = ', latex(intVal), ' $$'];
    step5 = 'If n is even, c<sub>n</sub> is 0. If n is odd,';
    step6 = ['$$ \small c_n = ' latex(simplifiedIntVal) ' $$'];
    step7 = 'Substituting back into expression for u(x,t):';
    step8 = ['$$ \small u(x,t) = \sum_{{n}={1}}^{\infty} ', latexAnsString, '$$'];
    feedbackString = [step0 '<br>' step1 '<br>' step2 '<br>' step3 '<br>' step4 '<br>' step5 '<br>' step6 '<br>' step7 '<br>' step8];
    
    %Question output
    fprintf(file,'  <!-- question: %i  -->', i);
    fprintf(file,'\n  <question type="algebra">');
    fprintf(file,'\n    <name>');
    fprintf(file,'\n      <text>PDE Question 1 Level 1</text>');
    fprintf(file,'\n    </name>');
    fprintf(file,'\n    <questiontext format="html">');
    fprintf(file,'\n      <text>');
    fprintf(file,'\n        <![CDATA[<p><span>Part of the question has been solved for you. Complete the remaining bit and enter the answer:</span></p>');
    fprintf(file,'\n        <p></p>');
    fprintf(file,'\n        <p><span style="text-decoration: underline; font-size: medium;"><strong>Question </strong></span></p>');
    fprintf(file,'\n        <p>Consider the problem of determining the temperature distribution in a thin homogeneous bar of length L, given the initial temperature throughout the bar and the temperature at both ends at all times. The governing equation is:</p>');
    fprintf(file,'\n        <p style="text-align: center;"><span>$$ \\small \\frac{\\partial u}{\\partial t} = \\beta^2 \\frac{\\partial^2 u}{\\partial x^2} $$   <span>(1)</span></span></p>');
    fprintf(file,'\n        <p>where $$ \\small \\beta = \\sqrt{K/c\rho} $$</p>');
    fprintf(file,'\n        <p>Boundary Conditions:</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">i)  $$ \\small u(0,t) = 0 $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;" dir="ltr">ii) $$ \\small u(L,t) = 0 $$</p>');
    fprintf(file,'\n        <p>Initial Condition:</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">i) $$ \\small u(x,0) = f(x) $$</p>');
    fprintf(file,'\n        <p>Given: </p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small   f(x) = %s $$   (2)</p>', latex(f)); %\\frac{4x}{L} (-\\frac{x}{L} + 1)
    fprintf(file,'\n        <p>Look for solutions of the form</p>');
    fprintf(file,'\n        <p style="text-align: left; margin-left: 30px;">$$ \\small u(x,t)=T(t)X(x) $$   (3)</p>');
    fprintf(file,'\n        <p> </p>');
    fprintf(file,'\n        <p><span style="font-size: medium;"><strong><span style="text-decoration: underline;">Solution</span></strong></span></p>');
    fprintf(file,'\n        <p>Rewriting the governing equation using (3),</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small \\frac{1}{\\beta} \\frac{T''(t)}{T(t)} = \\frac{X''''(x)}{X(x)} = \\alpha $$   (4)</p>');
    fprintf(file,'\n        <p><span style="text-decoration: underline;">Case 1 - $$ \\small \\alpha $$ &gt; 0</span></p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">Let: $$ \\small \\alpha = \\lambda^2 $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small X'' =  \\lambda^{2}X =&gt; X(x) = Ae^{\\lambda x} + Be^{-\\lambda x} $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">Applying boundary condition (i) and (ii) will show that this case results in a trivial solution.</p>');
    fprintf(file,'\n        <p><span style="text-decoration: underline;">Case 2 - $$ \\small \\alpha $$ &lt; 0</span></p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">Let: $$ \\small \\alpha = -\\lambda^2 $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small X'' = -\\lambda^2X =&gt; X(x) = A\\cos{\\lambda x} + B \\sin{\\lambda x} $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;"><span style="text-decoration: underline;">From boundary condition (i)</span></p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small u(0,t) = 0 =&gt; X(0) = 0 $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\tiny \\therefore $$ A = 0</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;"><span style="text-decoration: underline;">From boundary condition (ii)</span></p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small u(L,t) = 0 =&gt; B \\sin{\\lambda L} = 0 $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\tiny \\therefore \\small  \\lambda L = n\\pi $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small\\lambda = \\frac{n\\pi}{L} $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small X_n = B_n\\sin{\\frac{n\\pi x}[L}} $$</p>');
    fprintf(file,'\n        <p>Also,</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small T_n(t) = D_n exp [-\\frac{n^2\\pi^2}{L^2} \\beta^{2} t] $$</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small u_n(x,t) = c_n \\sin{\\frac{n\\pi x}{L}} exp [-\\frac{n^2\\pi^2}{L^2} \\beta^{2} t] $$</p>');
    fprintf(file,'\n        <p>To satisfy the initial condition we use the superposition principle, i.e, :</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small u(x,t) =  \\sum_{{n}={1}}^{\\infty}  u_n(x,t) =  \\sum_{{n}={1}}^{\\infty} c_n\\sin{\\frac{n\\pi x}{L}}exp [-\\frac{n^2\\pi^2}{L^2} \\beta^{2} t]  $$</p>');
    fprintf(file,'\n        <p>Thus at $$ \\small t $$ = 0, we get</p>');
    fprintf(file,'\n        <p style="margin-left: 30px;">$$ \\small u(x,0) = \\sum_{{n}={1}}^{\\infty} c_n \\sin{\\frac{n\\pi x}{L}} = f(x) = %s $$</p>', latex(f));
    fprintf(file,'\n        <p>This is a half-range Fourier series expression. Solve it to find an expression for $$ \\small u(x,t) $$. Use L = 10 and $$ \\small \\beta $$ = 1.</p>');
    fprintf(file,'\n        <p>$$ \\small u(x,t) = \\sum_{{n}={1}}^{\\infty} [?] $$</p>');
    fprintf(file,'\n        <p>Enter the ($$ \\small ? $$) missing expression in the box below.</p>]]>');
    fprintf(file,'\n      </text>');
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
    fprintf(file,'\n      <text>%s</text>', ansString);
    fprintf(file,'\n      <feedback format="html">');
    fprintf(file,'\n        <text></text>');
    fprintf(file,'\n      </feedback>');
    fprintf(file,'\n    </answer>');
    fprintf(file,'\n    <variable name="b">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n    <variable name="n">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n    <variable name="p">');
    fprintf(file,'\n        <min>3.14158</min>');
    fprintf(file,'\n        <max>3.14160</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n    <variable name="t">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n    <variable name="L">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n    <variable name="x">');
    fprintf(file,'\n        <min>1</min>');
    fprintf(file,'\n        <max>10</max>');
    fprintf(file,'\n    </variable>');
    fprintf(file,'\n  </question>');
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);