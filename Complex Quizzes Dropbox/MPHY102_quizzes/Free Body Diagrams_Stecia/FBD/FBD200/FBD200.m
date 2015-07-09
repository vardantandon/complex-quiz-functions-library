l=200;

%plotting the beam
y1=0;
y2=0;
x1=0;
x2=l;

a = plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-0 200 -1.5 1.5])

title('Simply Supported Beam','FontSize',12,'FontWeight', 'bold')

axis off

%indicating the length of the beam on the plot

L='Beam length = ';

unit='cm';

l_unit=strcat(L,num2str(l),unit);

text(1,1.4,l_unit,'FontSize',12, 'FontWeight','bold')

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0],'LineWidth',3)

text(0,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([l,-0.75],[l,0],'LineWidth',3)

text(l,-0.85,'R2')



%scaling

for q=0:10:90
    plot([q,q],[-0.1,0],'Color','black','linewidth',3);
end

for q=110:10:l
    plot([q,q],[-0.1,0],'Color','black','linewidth',3);
end

for q=100
    plot([q,q],[-0.2,0],'Color','black','linewidth',3);
    text(93,-0.30,'100cm','fontsize',12,'fontweight','bold');
end

%Plotting 1st distributed load

x1=randi([0,4]);
x2=randi([(x1+1),9]);

X1=x1*10;
X2=x2*10;

plot([X1,X2],[0.08,0.08],'Color','red','linewidth',11);

%Plotting 2nd distributed load

x3=randi([11,15]);
x4=randi([(x3+1),20]);

X3=x3*10;
X4=x4*10;

plot([X3,X4],[0.08,0.08],'Color','red','linewidth',11);

%Plotting point load
 
p=randi([7,13]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling distributed loads

m1=5*(x2-x1);
m2=10*(x4-x3);

mid1=(X1+X2)/2;
mid2=(X3+X4)/2;

m1_label=strcat(num2str(m1),'kg');
m2_label=strcat(num2str(m2),'kg');

text(mid1-5,0.2,m1_label,'fontsize',12,'fontweight','bold');
text(mid2-5,0.2,m2_label,'fontsize',12,'fontweight','bold');

%Labelling point load

w=randi([5,10]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

hold off

saveas(a,'FBD200a.jpg')

%2nd image

b = plot([0,200],[0,0],'Color','black','linewidth',5);

hold on

axis([-0 200 -2 1.1])

axis off

%Plotting supports, R1 and R2

arrow([0,-0.75],[0,0],'linewidth',3)

text(0,-0.85,'R1','fontsize',12,'fontweight','bold')

arrow([l,-0.75],[l,0],'linewidth',3)

text(l,-0.85,'R2','fontsize',12,'fontweight','bold')

%plotting arrows

%Point load

arrow([P,0.8],[P,0],'linewidth',3)

%Distributed loads

arrow([mid1,0.8],[mid1,0],'linewidth',3);
arrow([mid2,0.8],[mid2,0],'linewidth',3);

%Acconting for weight of the beam

B=20*15;

arrow([100,0],[100,-0.8],'linewidth',3)

%Drawing arrows to indicate distance from R1

arrow([mid1/2,0.1],[mid1,0.1],'linewidth',2);
arrow([mid1/2,0.1],[0,0.1],'linewidth',2);

arrow([50,-0.1],[100,-0.1],'linewidth',2);
arrow([50,-0.1],[0,-0.1],'linewidth',2);

arrow([P/2,0.6],[P,0.6],'linewidth',2);
arrow([P/2,0.6],[0,0.6],'linewidth',2);

arrow([mid2/2,-0.55],[mid2,-0.55],'linewidth',2);
arrow([mid2/2,-0.55],[0,-0.55],'linewidth',2);

plot([mid2,mid2],[0,-0.55],'linewidth',1,'linestyle','--','Color','black');

%Providing a space for recation forces calculation

text(80,-1.5,'R1 =','fontsize',12,'fontweight','bold');
text(80,-1.8,'R2 =','fontsize',12,'fontweight','bold');

saveas(b,'FBD200b.jpg'); 

hold off
