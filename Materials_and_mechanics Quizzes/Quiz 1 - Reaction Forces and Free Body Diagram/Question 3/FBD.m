%START IMAGE GENERATION

%plotting the beam

y1=0;
y2=0;
x1=0;
x2=l;

a = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([0 l -1.5 1.5])

axis off

title('Free Body Diagram','FontSize',20, 'FontWeight','bold')

%indicating the length of the beam on the plot

L='Beam length =';

unit='cm';

l_unit=strcat(L,num2str(l), unit);

text(0,1.3,l_unit)

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0])

text(0,-0.85,'R1')

arrow([l,-0.75],[l,0])

text(l,-0.85,'R2')

% Indicating level

hold off

%Plotting point load

arrow([p,0.75],[p,0])

W=num2str(m*10);

Unit='N';

Weight=strcat(W,Unit);

text(p-1,0.85,Weight)

%position of point load

position=strcat(num2str(p),unit);

text(p-1.5, -0.1, position)

%Plotting position A

text(0,0.1,'A')
% END IMAGE GENERATION