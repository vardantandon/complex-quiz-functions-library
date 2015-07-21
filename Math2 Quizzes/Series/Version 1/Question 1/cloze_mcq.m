%Cloze multiple choice answer code generator - produces the code for
%multiple choice options
%This function will automatically print the specified options in a randomized order
%questionType = 'drop', 'vertical', 'horizontal'
%correctNo = correct option no starting with 1
%varargin = 'Option 1', 'error message', 'Option 2', 'error message', ..
%
%Last Updated: 26/06/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = cloze_mcq(questionType, correctNo, varargin)
    %Understand which type of MCQ is required
    switch questionType
        case 'drop'
            questionTypeStr = 'MULTICHOICE';
        case 'vertical'
            questionTypeStr = 'MCV';
        case 'horizontal'
            questionTypeStr = 'MCH';
        otherwise
            error('Incorrect mcq cloze type speficied');
    end
    
    %Check for right number of input arguments
    if (mod(length(varargin), 2) ~= 0)
        error(strcat('Input arguments error: ',length(varargin)));
    end
    optionStr = '';
    used = [];
    for i=1:2:length(varargin)
        %Pick a random question number that hasn't already been chosen
        newPick = randi(length(varargin)/2,1)*2-1;
        while ismember(newPick, used)
            newPick = randi(length(varargin)/2,1)*2-1;
        end
        
        used = [used, newPick];
        if (newPick == (correctNo*2-1))
            prefix = '~=';
        else
            prefix = '~';
        end
        %String of options in shuffled order
        optionStr = strcat(optionStr, prefix, varargin{newPick}, '#', varargin{newPick+1});
    end
    finalStr = strcat('{1:', questionTypeStr, ':', optionStr, '}');
end