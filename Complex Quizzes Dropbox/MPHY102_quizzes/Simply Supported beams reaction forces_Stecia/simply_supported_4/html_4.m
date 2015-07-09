html4=fopen('simpsupp4.html','w');

fprintf(html4,'%s','<!DOCTYPE html>');
fprintf(html4,'\n%s','<html>');
fprintf(html4,'\n%s','<body>');

for i=1:1:100
    fprintf(html4,'\n<img src="4_beamplot%d.png" alt="beamplot">',i);
end

fprintf(html4,'\n%s','</body>');
fprintf(html4,'\n%s','</html>');