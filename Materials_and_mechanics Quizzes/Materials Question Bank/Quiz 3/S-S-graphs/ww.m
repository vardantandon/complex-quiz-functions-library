stress=100;
A1=10;
x1=0:0.1:30;
x2=30.1:0.1:80;
y11=stress*A1*x1;
x5=30.1:0.1:90;
y12=(-8*(x5-max(x1)).^2)+(1000*(x5-max(x1)))+(max(y11));
A2=60;
x3=15.1:0.1:70;
x4=0:0.1:15;
y21=stress*A2*x4;
y22=(-8*(x3-max(x4)).^2)+(1000*(x3-max(x4)))+(max(y21));
A3=30;
x6=30:0.1:40;
y31=stress*A3*x1;
y32=(-10*(x6-max(x1)).^2)+(1000*(x6-max(x1)))+(max(y31));
A4=40;
y41=stress*A4*x1;
x7=30:0.1:85;
y42=(-10*(x7-max(x1)).^2)+(1500*(x7-max(x1)))+(max(y41));
A5=50;
y51=stress*A5*x1;
y52=(-10*(x2-max(x1)).^2)+(800*(x2-max(x1)))+(max(y51));
plot(x1,y11,'green')
hold on
plot(x5,y12,'green')
plot(x4,y21,'black')
plot(x3,y22,'black')
plot(x1,y31,'red')
plot(x6,y32,'red')
plot(x1,y41,'blue')
plot(x7,y42,'blue')
plot(x1,y51,'yellow')
plot(x2,y52,'yellow')
grid on
grid minor
axis([0 100 0 18*10^4])
set(gca,'YTickLabel',[],'XTickLabel',[])
ylabel('Stress','Fontsize',12,'FontWeight','bold');
xlabel('Strain','Fontsize',12,'FontWeight','bold');
hold off