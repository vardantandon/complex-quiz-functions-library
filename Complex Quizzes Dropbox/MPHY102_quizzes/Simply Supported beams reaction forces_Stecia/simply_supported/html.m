html1=fopen('simpsupp1.html','w');

fprintf(html1,'%s','<!DOCTYPE html>');
fprintf(html1,'\n%s','<html>');
fprintf(html1,'\n%s','<body>');

for i=1:1:100
    fprintf(html1,'\n<img src="beamplot%d.png" alt="beamplot">',i);
end

fprintf(html1,'\n%s','</body>');
fprintf(html1,'\n%s','</html>');
