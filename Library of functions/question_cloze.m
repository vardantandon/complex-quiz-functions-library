%Cloze-type question generation code, produces a string output.
%num - number: Question Number
%nameStr - string: Question Name
%questionStr - string: The content of the question, including output from
%cloze_mcq/cloze_numerical/cloze_short
%generalFeedbackStr - string: Feedback shown to student after question is
%completed.
%hint1 - string: hint for the first incorrect attempt
%hint2 - string: hint for the second incorrect attempt
%fileStrQuestion - string: xml code that contains a file (eg an image) for the question section.
%fileStrFeedback - string: xml code that contains a file (eg an image) for the feedback section.
%
%Last Updated: 22/07/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalStr = question_cloze(num, nameStr, questionStr, generalFeedbackStr, hint1, hint2, fileStrQuestion, fileStrFeedback)
    finalStr = '';
    finalStr = strcat(finalStr, '\n  <!-- question: ', num2str(num), '  -->');
    finalStr = strcat(finalStr, '\n  <question type="cloze">');
    finalStr = strcat(finalStr, '\n    <name>');
    finalStr = strcat(finalStr, '\n      <text>', nameStr, '</text>');
    finalStr = strcat(finalStr, '\n    </name>');
    finalStr = strcat(finalStr, '\n    <questiontext format="html">');
    finalStr = strcat(finalStr, '\n      <text><![CDATA[<p>', questionStr, '</p>]]></text>');
    finalStr = strcat(finalStr, '\n    ', fileStrQuestion);
    finalStr = strcat(finalStr, '\n    </questiontext>');
    finalStr = strcat(finalStr, '\n    <generalfeedback format="html">');
    finalStr = strcat(finalStr, '\n      <text><![CDATA[<p>', generalFeedbackStr, '</p>]]></text>');
    finalStr = strcat(finalStr, '\n    ', fileStrFeedback);
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