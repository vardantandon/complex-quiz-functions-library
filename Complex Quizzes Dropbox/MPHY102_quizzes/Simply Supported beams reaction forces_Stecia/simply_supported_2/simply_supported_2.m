l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

%plotting the beam
y1=0;
y2=0;
x1=0;
x2=l;

b = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([0 l -1.5 1.5])

axis off

title('Simply Supported Beam')

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(1,1.4,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

hold off

%Plotting point loads

w1=randi([8,15]);

p1=randi([round(l/8),round(l/2)]);

arrow([p1,0.75],[p1,0])

W1=num2str(w1);

Unit='N';

Weight1=strcat(W1,Unit);

text(p1-1,0.85,Weight1)

%2

w2=randi([8,15]);

p2=randi([round(l/2),round(7*l/8)]);

arrow([p2,0.75],[p2,0])

W2=num2str(w2);

Unit='N';

Weight2=strcat(W2,Unit);

text(p2-1,0.85,Weight)

%position of point loads

position1=strcat(num2str(p1),unit);

text(p1-1.5, -0.1, position1)

%2

position2=strcat(num2str(p2),unit);

text(p2-1.5, -0.1, position2)

%Plotting position A

text(0,0.1,'A')

%This marks the end of the plotting process for this question. [Hopefully
%we an use this in a GUI]

saveas(b,'2_beamplot.png','png')