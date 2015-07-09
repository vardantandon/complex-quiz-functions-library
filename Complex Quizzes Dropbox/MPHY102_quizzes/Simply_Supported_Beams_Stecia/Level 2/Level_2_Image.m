l=randi([10,20]);
L=l*10;

%Plotting the beam

y1=0;
y2=0;
x1=0;
x2=L;

a=plot([x1,x2],[y1,y2],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

title('Simply Supported Beam','FontSize',12, 'FontWeight','bold');

axis off

%Indicating the beam length on the plot

L_unit=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%Plotting 1st point load

p=randi([3,l-5]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling 1st point load

w=randi([5,15]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')



%Plotting 2nd point load

p2=randi([p+1,l-1]);
P2=p2*10;
arrow([P2,0.75],[P2,0],'LineWidth',3);

%Labelling 2nd point load

w2=randi([5,15]);
W2=w2*10;
W2_label=strcat(num2str(W2),'N');

text(P2-5,0.85,W2_label,'fontsize',12,'fontweight','bold')

%Labelling distances

d_label=strcat(num2str(P),'cm');

plot([P2,P2],[0,-0.5],'LineStyle','--','Color','black','Linewidth',1.5);

d2_label=strcat(num2str(P2),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',3);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',3);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

arrow([P2/2,-0.5],[0,-0.5],'LineWidth',3);
arrow([P2/2,-0.5],[P2,-0.5],'LineWidth',3);

text(P2/3,-0.6,d2_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([(P+L)/2,-0.1],[L,-0.1],'LineWidth',3);
    arrow([(P+L)/2,-0.1],[P,-0.1],'LineWidth',3);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
      arrow([(P2+L)/2,-0.5],[L,-0.5],'LineWidth',3);
    arrow([(P2+L)/2,-0.5],[P2,-0.5],'LineWidth',3);
    
  LP2=L-P2;
    
    text(P2+(LP2/3),-0.6,strcat(num2str(LP2),'cm'),'fontsize',12,'fontweight','bold');
    
end 

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

hold off