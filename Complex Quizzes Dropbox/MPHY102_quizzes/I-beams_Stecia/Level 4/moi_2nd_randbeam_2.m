%Plotting the beam

W=randi([30,50]);
plot([0,W],[0,0],'Color','black','linewidth',5);

hold on

l1=randi([10,20]);
plot([0,0],[0,l1],'Color','black','linewidth',5);

plot([W,W],[0,l1],'Color','black','linewidth',5);

w=randi([7,12]);
a=randi([10,15]);
b=a+w;
plot([0,a],[l1,l1],'Color','black','linewidth',5);
plot([b,W],[l1,l1],'Color','black','linewidth',5);

l2=randi([20,30]);
plot([a,a],[l1,(l1+l2)],'Color','black','linewidth',5);
plot([b,b],[l1,(l1+l2)],'Color','black','linewidth',5);

w1=randi([b,W]);

plot([0,a],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);
plot([b,w1],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);

l3=randi([7,18]);
L=l1+l2+l3;

plot([0,0],[(l1+l2),L],'Color','black','linewidth',5);
plot([w1,w1],[(l1+l2),L],'Color','black','linewidth',5);

plot([0,w1],[L,L],'Color','black','linewidth',5);

axis([-15 (W+10) -20 (L+20)])
axis off

plot([0,0],[l1,(l1+l2)], 'LineStyle','--','Color','black','linewidth',2);

%labelling the beam

arrow([(W/2),-5],[W,-5],'linewidth',2);
arrow([(W/2),-5],[0,-5],'linewidth',2);

arrow([-5,(L/2)],[-5,L],'linewidth',2);
arrow([-5,(L/2)],[-5,0],'linewidth',2);

arrow([(a-2.5),(L/2)],[(a-2.5),(l1+l2)],'linewidth',2);
arrow([(a-2.5),(L/2)],[(a-2.5),l1],'linewidth',2);

arrow([(a+(w/2)),(l1+2.5)],[a,(l1+2.5)],'linewidth',2);
arrow([(a+(w/2)),(l1+2.5)],[b,(l1+2.5)],'linewidth',2);

arrow([(b+((W-b)/2)),(l1+2.5)],[W,(l1+2.5)],'linewidth',2);
arrow([(b+((W-b)/2)),(l1+2.5)],[b,(l1+2.5)],'linewidth',2);

arrow([(w1/2),(L+5)],[0,(L+5)],'linewidth',2);
arrow([(w1/2),(L+5)],[w1,(L+5)],'linewidth',2);

arrow([W+3,(l1/2)],[W+3,0],'linewidth',2);
arrow([W+3,(l1/2)],[W+3,l1],'linewidth',2);

Wlabel=strcat(num2str(W),'mm');
Llabel=strcat(num2str(L),'mm');
wlabel=strcat(num2str(w),'mm');
llabel=strcat(num2str(l2),'mm');
w1label=strcat(num2str(w1),'mm');
w2label=strcat(num2str(W-b),'mm');
l1label=strcat(num2str(l1),'mm');

text((W/2.5),-10,Wlabel,'fontsize',12,'fontweight','bold');
text(-15,(L/2),Llabel,'fontsize',12,'fontweight','bold');
text((a+(b-a)/4),(l1-2.5),wlabel,'fontsize',12,'fontweight','bold');
text((a-10),(L/2),llabel,'fontsize',12,'fontweight','bold');
text((w1/2.5),(L+10),w1label,'fontsize',12,'fontweight','bold');
text((b+(W-b)/4),(l1+7.5),w2label,'fontsize',12,'fontweight','bold');
text(W+5,l1/2,l1label,'fontsize',12,'fontweight','bold');

hold off