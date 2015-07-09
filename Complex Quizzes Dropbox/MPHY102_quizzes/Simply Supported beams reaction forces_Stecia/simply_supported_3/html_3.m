html3=fopen('simpsupp3.html','w');

fprintf(html3,'%s','<!DOCTYPE html>');
fprintf(html3,'\n%s','<html>');
fprintf(html3,'\n%s','<body>');

for i=1:1:100
    fprintf(html3,'\n<img src="3_beamplot%d.png" alt="beamplot">',i);
end

fprintf(html3,'\n%s','</body>');
fprintf(html3,'\n%s','</html>');