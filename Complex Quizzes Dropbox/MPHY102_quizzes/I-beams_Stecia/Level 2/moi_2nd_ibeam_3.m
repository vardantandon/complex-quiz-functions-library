%Plotting the beam

W=randi([20,30]);
plot([0,W],[0,0],'Color','black','linewidth',5);

hold on

l1=randi([10,15]);
plot([0,0],[0,l1],'Color','black','linewidth',5);

plot([W,W],[0,l1],'Color','black','linewidth',5);

w=randi([5,8]);
a=randi([5,8]);
b=a+w;
plot([0,a],[l1,l1],'Color','black','linewidth',5);
plot([b,W],[l1,l1],'Color','black','linewidth',5);

l2=randi([20,30]);
plot([a,a],[l1,(l1+l2)],'Color','black','linewidth',5);
plot([b,b],[l1,(l1+l2)],'Color','black','linewidth',5);

plot([0,a],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);
plot([b,W],[(l1+l2),(l1+l2)],'Color','black','linewidth',5);

L=(2*l1)+l2;

l3=l1;

w1=W;

plot([0,0],[(l1+l2),L],'Color','black','linewidth',5);
plot([W,W],[(l1+l2),L],'Color','black','linewidth',5);

plot([0,W],[L,L],'Color','black','linewidth',5);

axis([-15 (W+10) -20 (L+10)])
axis off

%labelling the beam

arrow([(W/2),-5],[W,-5],'linewidth',2);
arrow([(W/2),-5],[0,-5],'linewidth',2);

arrow([-5,(L/2)],[-5,L],'linewidth',2);
arrow([-5,(L/2)],[-5,0],'linewidth',2);

arrow([(a-2.5),(L/2)],[(a-2.5),(l1+l2)],'linewidth',2);
arrow([(a-2.5),(L/2)],[(a-2.5),l1],'linewidth',2);

arrow([(a+w/2),(l1+2.5)],[a,(l1+2.5)],'linewidth',2);
arrow([(a+w/2),(l1+2.5)],[b,(l1+2.5)],'linewidth',2);

arrow([b+3,l1+2.5],[b,l1+2.5],'linewidth',2);
arrow([b+3,l1+2.5],[W,l1+2.5],'linewidth',2);

Wlabel=strcat(num2str(W),'mm');
Llabel=strcat(num2str(L),'mm');
wlabel=strcat(num2str(w),'mm');
llabel=strcat(num2str(l2),'mm');
w2label=strcat(num2str(W-b),'mm');

text((W/2.5),-10,Wlabel,'fontsize',12,'fontweight','bold');
text(-12,(L/2),Llabel,'fontsize',12,'fontweight','bold');
text((a+w/4),(l1-2.5),wlabel,'fontsize',12,'fontweight','bold');
text((a-9),(L/2),llabel,'fontsize',12,'fontweight','bold');
text(W+1,l1/2,'a','fontsize',12,'fontweight','bold');
text(W+1,l1+l2+l1/2,'a','fontsize',12,'fontweight','bold');
text((3*b+W)/4,l1+6,w2label,'fontsize',12,'fontweight','bold');


%Indicating level

a1=rectangle('Position',[W-10,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
a2=rectangle('Position',[W-7,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5,'Facecolor','y');
a3=rectangle('Position',[W-4,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
a4=rectangle('Position',[W-1,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5);
a5=rectangle('Position',[W+2,L+6,2,3],'Curvature',[1,1],'LineWidth',1.5);

hold off
