l=randi([15,20]);
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

%Plotting 1st distributed load

p1=randi([2,round(l/4)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([3,round(l/4)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Plotting 2nd distributed load

p2=randi([p1+wr+1,l-5]);
P2=p2*10;
yr2=0.05;
hr2=0.3;
wr2=randi([3,round(l/4)]);
WR2=wr2*10;
rectangle('Position',[P2,yr2,WR2,hr2],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling 1st distributed load

w=randi([15,50]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P1+(WR/3),0.15,W_label,'fontsize',12,'fontweight','bold');

%Labelling 2nd distributed load

w2=randi([15,50]);
W2=w2*10;
W2_label=strcat(num2str(W2),'N');

text(P2+(WR2/4),0.15,W2_label,'fontsize',12,'fontweight','bold');

%Labelling distances

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');

d3_label=strcat(num2str(P2),'cm');
d4_label=strcat(num2str(WR2),'cm');

arrow([P1/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P1/2,-0.1],[P1,-0.1],'LineWidth',2);

arrow([P1+(WR/2),-0.1],[P1,-0.1],'LineWidth',2);
arrow([P1+(WR/2),-0.1],[P1+WR,-0.1],'LineWidth',2);

plot([P2,P2],[0,-0.5],'LineStyle','--','Color','black','LineWidth',1.5);
plot([P2+WR2,P2+WR2],[0,-0.5],'LineStyle','--','Color','black','LineWidth',1.5);

arrow([P1/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([P1/2,-0.5],[P2,-0.5],'LineWidth',2);

arrow([P2+(WR2/2),-0.5],[P2,-0.5],'LineWidth',2);
arrow([P2+(WR2/2),-0.5],[P2+WR2,-0.5],'LineWidth',2);

text(P1/3,-0.2,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.2,d2_label,'fontsize',12,'fontweight','bold');

text(P2/3,-0.6,d3_label,'fontsize',12,'fontweight','bold');

text(P2+WR2/3,-0.6,d4_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

saveas(a,'level4a.jpg')

hold off

%Drawing equivalent free body diagram with point loads

%Plotting the beam

y1b=0;
y2b=0;
x1b=0;
x2b=L;

b=plot([x1b,x2b],[y1b,y2b],'Color','black','linewidth',5);

hold on

axis([-10 L+10 -1.5 1.5]);

title('Simply Supported Beam','FontSize',12, 'FontWeight','bold');

axis off

%Indicating the beam length on the plot

L_unit_b=strcat('Beam Length, L= ',num2str(L),'cm');

text(-9,1.3, L_unit_b,'FontSize',12,'FontWeight','bold');

%Reaction Forces

arrow([0,-0.75],[0,0],'LineWidth',3)

text(-2,-0.85,'R1','Fontsize',12,'FontWeight','bold')

arrow([L,-0.75],[L,0],'LineWidth',3)

text(L-2,-0.85,'R2','Fontsize',12,'Fontweight','bold');

%Plotting 1st point load

P=P1+WR/2;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling  1st point load

W_label_b=strcat(num2str(W),'N');

text(P-5,0.85,W_label_b,'fontsize',12,'fontweight','bold')

%Plotting 2nd point load

Pb=P2+WR2/2;
arrow([Pb,0.75],[Pb,0],'LineWidth',3)

%Labelling 2nd point load

W2_label_b=strcat(num2str(W2),'N');

text(Pb-5,0.85,W2_label_b,'fontsize',12,'fontweight','bold')

plot([Pb,Pb],[0,-0.5],'LineStyle','--','LineWidth',1.5,'Color','black');

%Labelling distances

d_label=strcat(num2str(P),'cm');

if P>=L/2
         
arrow([P/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',2);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',2);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',2);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(L-P),'cm'),'fontsize',12,'fontweight','bold');
    
end 

db_label=strcat(num2str(Pb),'cm');
db2_label=strcat(num2str(L-Pb),'cm');

if P>=L/2
    
    arrow([Pb/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([Pb/2,-0.5],[Pb,-0.5],'LineWidth',2);

text(Pb/3,-0.2,db_label,'fontsize',12,'fontweight','bold');

else 
    
 arrow([(Pb+L)/2,-0.5],[L,-0.5],'LineWidth',2);
    arrow([(Pb+L)/2,-0.5],[Pb,-0.5],'LineWidth',2);
    
  LP2=L-Pb;
    
    text(Pb+(LP2/3),-0.6,db2_label,'fontsize',12,'fontweight','bold');
    
end

saveas(b,'level4b.jpg');


hold off