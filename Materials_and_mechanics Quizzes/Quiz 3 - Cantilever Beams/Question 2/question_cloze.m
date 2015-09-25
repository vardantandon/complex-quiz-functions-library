%Cloze-type question generation code, produces a string output.
%num - number: Question Number
%nameStr - string: Question Name
%questionStr - string: The content of the question, including output from
%cloze_mcq/cloze_numerical/cloze_short
%generalFeedbackStr - string: Feedback shown to student after question is
%completed.
%fileStr - string: xml code that contains a file (eg an image).
%
%Last Updated: 15/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = question_cloze(num, nameStr, questionStr, generalFeedbackStr, hint1, hint2, fileStr1, fileStr2, fileStr3, fileStr4)
    finalStr = '';
    finalStr = strcat(finalStr, '\n  <!-- question: ', num2str(num), '  -->');
    finalStr = strcat(finalStr, '\n  <question type="cloze">');
    finalStr = strcat(finalStr, '\n    <name>');
    finalStr = strcat(finalStr, '\n      <text>', nameStr, '</text>');
    finalStr = strcat(finalStr, '\n    </name>');
    finalStr = strcat(finalStr, '\n    <questiontext format="html">');
    finalStr = strcat(finalStr, '\n      <text><![CDATA[<p>', questionStr, '</p>]]></text>');
    finalStr = strcat(finalStr, '\n    ', fileStr1);
    finalStr = strcat(finalStr, '\n    </questiontext>');
    finalStr = strcat(finalStr, '\n    <generalfeedback format="html">');
    finalStr = strcat(finalStr, '\n      <text><![CDATA[<p>', generalFeedbackStr, '</p>]]></text>');
    finalStr = strcat(finalStr, '\n    ',fileStr2, fileStr3, fileStr4); 
    finalStr = strcat(finalStr, '\n    </generalfeedback>');
    finalStr = strcat(finalStr, '\n    <penalty>0.00000</penalty>');
    finalStr = strcat(finalStr, '\n    <hidden>0</hidden>');
    finalStr = strcat(finalStr, '\n    <hint format="html">');
    finalStr = strcat(finalStr, '\n      <text><![CDATA[<p>', hint1, '</p>]]></text>');
    finalStr = strcat(finalStr, '\n    </hint>');
    finalStr = strcat(finalStr, '\n    <hint format="html">');
    finalStr = strcat(finalStr, '\n      <text><![CDATA[<p>', hint2, '</p>]]></text>');
    finalStr = strcat(finalStr, '\n    </hint>');
    finalStr = strcat(finalStr, '\n  </question>');
end