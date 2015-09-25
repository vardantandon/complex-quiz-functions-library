% To plot incorrect answer #2
F=10;
k=5;
n=10;
t=0:0.1:4;
u=((F/k)*(1-exp(-1*t*k/n))+(F/(2*k)));
figure(4)
plot(t,u,'linewidth',0.1,'Color','white');
hold on
t1=4:0.1:10;
u1=(F/k)*(1-exp(-1*t1*k/n))+(F/(2*k));
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
plot([0,0],[0,(F/(2*k))],'linewidth',3,'Color','black');
plot([4,4],[max(u),max(u)-(F/(2*k))],'linewidth',3,'Color','black');
plot([0,4],[(F/(2*k)),max(u)],'linewidth',3,'Color','black');
plot([4,8],[max(u)-(F/(2*k)),0],'linewidth',3,'Color','black');
plot([4,4.60],[max(u),3],'linewidth',3,'Color','black','Linestyle',':');

t2=4:0.1:8;
u2=(-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u)));
% plot(t2,u2,'linewidth',3,'Color','black');

grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString4= generateImageString(gcf, 'image4');