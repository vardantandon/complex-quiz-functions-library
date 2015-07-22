%Quiz xml start code.
%This function has to be called before question_cloze or any other question
%generation function.
%
%Last Updated: 26/06/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = quiz_start()
    finalStr = strcat('<?xml version="1.0" encoding="UTF-8"?>\n<quiz>');
end