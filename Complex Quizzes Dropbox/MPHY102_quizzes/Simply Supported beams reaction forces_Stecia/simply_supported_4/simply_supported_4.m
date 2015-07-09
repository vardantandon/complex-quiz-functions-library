l = randi([20,200]); %l represents the length of the beam in cm. This generates a beam of random integer length between 20 and 200 cm.

%plotting the beam
Y1=0;
Y2=0;
X1=0;
X2=l;

a = plot([X1,X2],[Y1,Y2],'Color','black','linewidth',5);

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

%Plotting distributed loads
 
%plotting load #1
Y1 = 0.12;
Y2 = 0.12;

X1 = randi([0,round(l/4)]); 
X2 = randi([round(X1+(l/10)),round(l/2)]); 

plot([X1,X2],[Y1,Y2],'linewidth',15,'Color','red')
axis([0 l -1.5 1.5])

%plotting load #2

X3 = randi([X2,round(3*l/4)]); 
X4 = randi([round(X3+(l/10)),round(14*l/15)]);

plot([X3,X4],[Y1,Y2],'linewidth',15,'Color','red')

hold on

%adding weight values
%Chose masses in kgs - can change depending on what is needed.
%Masses in lbs instead?
%Force or weight instead of mass?
l1 = X2-X1;

if l1<50
    m = randi([1,15]);
elseif (50<=l1)&&(l1<100)
        m = randi([10,25]);
elseif (100<=l1)&&(l1<150)
    m = randi([15,30]);
else m = randi([20,30]);
end

l2 = X4-X3;

if l2<50
    m2 = randi([1,15]);
elseif (50<=l2)&&(l2<100)
        m2 = randi([10,25]);
elseif (100<=l2)&&(l2<150)
    m2 = randi([15,30]);
else m2 = randi([20,30]);
end

%Showing the masses on the figure

Unit = 'kg';
m_Unit = strcat(num2str(m),Unit);
m2_Unit = strcat(num2str(m2),Unit);

%Showing m
mid = (l1/2)+X1;
if l<=45
    text(mid-0.8,0.12,m_Unit);
elseif (l>45)&&(l<=90)
    text(mid-1.5,0.12,m_Unit);
elseif (l>90)&&(l<=160)
    text(mid-2.5,0.12,m_Unit);
else
    text(mid-3,0.12,m_Unit);
end

%Showing m2
mid2 = (l2/2)+X3;
if l2<=45
    text(mid2-0.8,0.12,m2_Unit);
elseif (l2>45)&&(l2<=90)
    text(mid2-1.5,0.12,m2_Unit);
elseif (l2>90)&&(l2<=160)
    text(mid2-2.5,0.12,m2_Unit);
else
    text(mid2-3,0.12,m2_Unit);
end
    
%Indicating the positions of loads

%Load #1

arrow([X1,0.5],[X1,0.2]);
arrow([X2,0.5],[X2,0.2]);

X1_label = strcat(num2str(X1),unit);
X2_label = strcat(num2str(X2),unit);

if l<=45
    text(X1-0.8,0.55,X1_label);
    text(X2-0.8,0.55,X2_label);
elseif (l>45)&&(l<=90)
    text(X1-1.5,0.55,X1_label);
    text(X2-1.5,0.55,X2_label);
elseif (l>90)&&(l<=160)
    text(X1-2.5,0.55,X1_label);
    text(X2-2.5,0.55,X2_label);
else
    text(X1-3,0.55,X1_label);
    text(X2-3,0.55,X2_label);
end

%Load #2

arrow([X3,-0.3],[X3,0]);
arrow([X4,-0.3],[X4,0]);

X3_label = strcat(num2str(X3),unit);
X4_label = strcat(num2str(X4),unit);

if l<=45
    text(X3-0.8,-0.35,X3_label);
    text(X4-0.8,-0.35,X4_label);
elseif (l>45)&&(l<=90)
    text(X3-1.5,-0.35,X3_label);
    text(X4-1.5,-0.35,X4_label);
elseif (l>90)&&(l<=160)
    text(X3-2.5,-0.35,X3_label);
    text(X4-2.5,-0.35,X4_label);
else
    text(X3-3,-0.35,X3_label);
    text(X4-3,-0.35,X4_label);
end

%Plotting position A

text(-5,0.1,'A')

%This marks the end of the plotting process for this question. [Hopefully
%we an use this in a GUI]

saveas(a,'4_beamplot.png','png')