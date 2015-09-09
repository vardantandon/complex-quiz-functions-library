file=fopen('Question_5_Level_2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code
for i=1:1:100

x = [1,-1,-1];

a = randi([1 10],1,1)*x(randi(length(x)));
b = randi ([1 10],1,1)*x(randi(length(x)));
c = randi([1 50],1,1)*x(randi(length(x)));
d = randi ([1 10],1,1)*x(randi(length(x)));  
e = randi([1 10],1,1)*x(randi(length(x)));
f = randi ([1 50],1,1)*x(randi(length(x)));
g = randi ([1 10],1,1)*x(randi(length(x)));  
h = randi([1 10],1,1)*x(randi(length(x)));
j = randi ([1 50],1,1)*x(randi(length(x)));
k = randi ([1 10],1,1)*x(randi(length(x)));  
l = randi([1 10],1,1)*x(randi(length(x)));
m = randi([1 10],1,1)*x(randi(length(x)));
    
syms x y
[solx,soly,solz] = solve([a*x + b*y + g*z== c, d*x + e*y + h*z == f,k*x + l*y +m*z ==j],[x,y,z]);
A = [a,b,g;d,e,h;k,l,m];
if (isreal(solx)==0 || isreal(soly)==0 || isreal(solz)==0 || det(A) == 0 )
    continue;    
end     

numString_1 = cloze_numerical(double(solx), 0.05, 'Good job!', 'Incorrect, try again');
numString_2 = cloze_numerical(double(soly), 0.05, 'Good job!', 'Incorrect, try again');
numString_3 = cloze_numerical(double(solz), 0.05, 'Good job!', 'Incorrect, try again');

bString = '';
eString = '';
aString = '';
dString = '';
gString = '';
hString = '';
kString = '';
lString = '';
mString = '';

if b~= 1
    bString = num2str(b);
    if (b==-1)
    bString = '-'
    end
end
if e~= 1
    eString = num2str(e);
    if (e==-1)
    eString = '-'
    end
end
if a~= 1
    aString = num2str(a);
    if (a==-1)
    aString = '-'
    end
end
if d~= 1
    dString = num2str(d);
    if (d==-1)
    dString = '-'
    end
end
if g~= 1
    gString = num2str(g);
    if (g==-1)
    gString = '-'
    end
end
if h~= 1
    hString = num2str(h);
    if (h==-1)
    hString = '-'
    end
end
if k~= 1
    kString = num2str(k);
    if (k==-1)
    kString = '-'
    end
end
if l~= 1
    lString = num2str(l);
    if (l==-1)
    lString = '-'
    end
end
if m~= 1
    mString = num2str(m);
    if (m==-1)
    mString = '-'
    end
end

if(b>0 && e>0 && g>0 && h>0 && l>0 && m>0)
questionString = strcat ('Solve the following system of simultaneous equations using standard Gaussian elimination (including row sums): <br><br>',...
aString,'x + ',bString,'y + ',gString,'z +',num2str(c),'<br>',dString,'x + ',eString,'y = ',num2str(f),...
'<br>[Calculate upto 2 significant]<br><br>',...
'x = ',numString_1,' y = ',numString_2);

    else if(b>0)
questionString = strcat ('Solve the following system of simultaneous equations using standard Gaussian elimination (including row sums): <br><br>',...
aString,'x + ',bString,'y = ',num2str(c),'<br>',dString,'x',eString,'y = ',num2str(f),...
'<br>[Calculate upto 2 significant]<br><br>',...
'x = ',numString_1,' y = ',numString_2);

    else if(e>0)
questionString = strcat ('Solve the following system of simultaneous equations using standard Gaussian elimination (including row sums): <br><br>',...
aString,'x',bString,'y = ',num2str(c),'<br>',dString,'x + ',eString,'y = ',num2str(f),...
'<br>[Calculate upto 2 significant]<br><br>',...
'x = ',numString_1,' y = ',numString_2);

else
questionString = strcat ('Solve the following system of simultaneous equations using standard Gaussian elimination (including row sums): <br><br>',...
aString,'x',bString,'y = ',num2str(c),'<br>',dString,'x',eString,'y = ',num2str(f),...
'<br>[Calculate upto 2 significant]<br><br>',...
'x = ',numString_1,' y = ',numString_2);

        end
        end 

end  

xmlCode = question_cloze(i, ...
        'Gaussian elimination Level 1', ... 
        questionString, ...
        '', ...
        '');
    fprintf(file, xmlCode);
    
    
end 
fprintf(file, quiz_end()); %xml closing code
fclose(file);