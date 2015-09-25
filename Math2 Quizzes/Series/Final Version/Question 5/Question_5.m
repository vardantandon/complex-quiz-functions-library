

file = fopen('Question_5.xml', 'w');
fprintf(file,quiz_start());

for i=1:1:90

a = randi([1 5],1,1)
b = randi([1 3],1,1)
syms x
fun = @(x)(((x).^2).^3/6 + ((x).^2).^2/2 + ((x).^2) + 1)
answer = a*integral(fun,0,1)

numString = cloze_numerical(answer, 0.10 , 'Good job!', 'Incorrect, try again');

if (a == 1)
questionString = strcat('Use Maclaurin series to calculate the following integral to 2 significant figures : <br>',...
      '$$\\small\\int_0^1e^{x^2}$$dx<br>', '<br>Answer : <br>', numString);

feedbackString = strcat('The general equation for Maclaurin series :<br> $$\\small f\\left(x\\right)\\:=\\:\\sum \\:_{n=0}^{\\infty \\:}\\:\\frac{f^{\\left(n\\right)}\\left(0\\right)}{n!}x^n$$<br>=> $$\\small f\\left(0\\right)\\:+\\:f\\:''\\left(0\\right)x\\:+\\:\\frac{f\\:''''\\left(0\\right)}{2!}x^2\\:+\\:\\frac{f\\:''''''\\left(0\\right)}{3!}x^3\\:+\\:....$$<br><br>',...
                        'The Maclaurin expansion for e<sup>x</sup> is given by :<br> $$\\small 1 + x + \\frac{x^{2}}{2!} + \\frac{x^{3}}{3!} + ...$$ <br><br>',...
                        'The series for e<sup>x<sup>2</sup></sup> becomes :<br> $$\\small 1 + x^{2} + \\frac{x^{4}}{2!} + \\frac{x^{6}}{3!} + ...$$ <br><br>',...
                        'Integrating and Applying limits, we get :<br>$$\\small[x + \\frac{x^{3}}{3} + \\frac{x^{5}}{10} + \\frac{x^{7}}{42} + ...]_{0}^{1}$$<br>[Higher terms in x are ignored because the denomitor increases leading to a negligible value]<br><br>',...
                        'So the correct answer is : $$\\small\\int_0^1e^{x^2}$$dx =&nbsp;',num2str(answer));
else 
questionString = strcat('Use Maclaurin series to calculate the following integral to 2 significant figures : <br>',...
      '$$\\small\\int_0^1',num2str(a),'e^{x^2}$$dx<br>', '<br>Answer : <br>', numString);

feedbackString = strcat('The general equation for Maclaurin series :<br> $$\\small f\\left(x\\right)\\:=\\:\\sum \\:_{n=0}^{\\infty \\:}\\:\\frac{f^{\\left(n\\right)}\\left(0\\right)}{n!}x^n$$<br>=> $$\\small f\\left(0\\right)\\:+\\:f\\:''\\left(0\\right)x\\:+\\:\\frac{f\\:''''\\left(0\\right)}{2!}x^2\\:+\\:\\frac{f\\:''''''\\left(0\\right)}{3!}x^3\\:+\\:....$$<br><br>',...
                        'The Maclaurin expansion for e<sup>x</sup> is given by :<br> $$\\small 1 + x + \\frac{x^{2}}{2!} + \\frac{x^{3}}{3!} + ...$$ <br><br>',...
                        'The series for e<sup>x<sup>2</sup></sup> becomes :<br> $$\\small 1 + x^{2} + \\frac{x^{4}}{2!} + \\frac{x^{6}}{3!} + ...$$ <br><br>',...
                        'Integrating and Applying limits, we get :<br>$$\\small[x + \\frac{x^{3}}{3} + \\frac{x^{5}}{10} + \\frac{x^{7}}{42} + ...]_{0}^{1}$$<br>[Higher terms in x are ignored because the denomitor increases leading to a negligible value]<br><br>',...
                        'So the correct answer is : $$\\small\\int_0^1',num2str(a),'e^{x^2}$$dx =&nbsp;',num2str(answer));

end



xmlCode = question_cloze(i, ...
        'Integral', ... 
        questionString, ...
        feedbackString, ...
        '');

fprintf(file, xmlCode);

end

fprintf(file, quiz_end()); %xml closing code
fclose(file);