html2=fopen('simpsupp2.html','w');

fprintf(html2,'%s','<!DOCTYPE html>');
fprintf(html2,'\n%s','<html>');
fprintf(html2,'\n%s','<body>');

for i=1:1:100
    fprintf(html2,'\n<img src="2_beamplot%d.png" alt="beamplot">',i);
end

fprintf(html2,'\n%s','</body>');
fprintf(html2,'\n%s','</html>');