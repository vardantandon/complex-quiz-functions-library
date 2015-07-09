%Cloze numerical answer code generator - produces the code for a
%numerical answer box
%answer - number: correct answer
%error - number: acceptable error
%rightFeedback - string: correct answer feedback
%wrongFeedback - string: wrong answer feedback
%
%Last Updated: 26/06/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = cloze_numerical(answer, error, rightFeedback, wrongFeedback)
    finalStr = strcat('{1:NUMERICAL:=', num2str(answer), ':', num2str(error), '#', rightFeedback, '!~*#', wrongFeedback, '}');
end