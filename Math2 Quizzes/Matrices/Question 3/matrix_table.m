function finalStr = matrix_table(matrixName, matrix)
    numericalFound = strfind(matrix{1, 1}, 'NUMERICAL');
    finalStr = strcat( ...
    '    <table><tr>', ...
    '      <td style="vertical-align: center;">', matrixName, '&nbsp;=&nbsp;</td>', ...
    '      <td style="border: 1px solid #000; border-right:0px;">&nbsp;</td>', ...
    '      <td>', ...
    '        <table>');
    
    for i = 1:size(matrix,1)
        finalStr = strcat(finalStr, '<tr>');
        if i == 1 & numericalFound > 0
            for j = 1:size(matrix,2)
          
                finalStr = strcat(finalStr, '<td style="padding-top:10px; padding-left:5px; padding-right:5px; text-align:center;">', matrix{i,j}, '</td>');
            
            end
        else
            for j = 1:size(matrix,2)
                finalStr = strcat(finalStr, '<td style="padding-left:5px; padding-right:5px; text-align:center;">', matrix{i,j}, '</td>');
            end
        end
        finalStr = strcat(finalStr, '</tr>');
    end
    
    finalStr = strcat(finalStr, ...
    '        </table>', ...
    '      </td>', ...
    '      <td style="border: 1px solid #000; border-left:0px;">&nbsp;</td>', ...
    '    </tr></table>');
end