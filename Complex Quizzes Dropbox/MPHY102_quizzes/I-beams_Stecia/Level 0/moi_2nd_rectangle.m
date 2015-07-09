x=0;
y=0;
w=randi([10,20]);
h=randi([40,60]);

m=plot([0,w],[0,0],'Color','black','linewidth',3);

hold on

plot([0,0],[0,h],'Color','black','linewidth',3);

plot([0,w],[h,h],'Color','black','linewidth',3);

plot([w,w],[0,h],'Color','black','linewidth',3);

axis([-20 (w+10) -20 (h+10)]);

axis off



arrow([(w/2),-5],[w,-5],'linewidth',2);
arrow([(w/2),-5],[0,-5],'linewidth',2);
arrow([-2.5,(h/2)],[-2.5,h],'linewidth',2);
arrow([-2.5,(h/2)],[-2.5,0],'linewidth',2);

xlabel=strcat(num2str(w),'mm');
ylabel=strcat(num2str(h),'mm');

text((w/3),-10,xlabel,'fontsize',12,'fontweight','bold');
text(-10,(h/2),ylabel,'fontsize',12,'fontweight','bold');

hold off



