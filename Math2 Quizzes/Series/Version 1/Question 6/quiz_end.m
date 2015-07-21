%Quiz xml end code.
%This function has to be called after the last question_cloze or any other question
%generation function.
%
%Last Updated: 26/06/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = quiz_end()
    finalStr = strcat('\n</quiz>');
end