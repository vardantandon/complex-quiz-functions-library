%Cloze short answer code generator - produces the code for a
%short answer box
%answer - number: correct answer
%rightFeedback - string: correct answer feedback
%wrongFeedback - string: wrong answer feedback
%
%Last Updated: 26/06/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = cloze_short(answer, rightFeedback, wrongFeedback)
    finalStr = strcat('{1:SHORTANSWER:=', answer, '#', rightFeedback, '~*#', wrongFeedback, '}');
end