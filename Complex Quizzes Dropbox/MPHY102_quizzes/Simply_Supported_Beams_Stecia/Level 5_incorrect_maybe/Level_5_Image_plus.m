l=20;
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

%plotting 1st distributed load

p1=randi([2,round(l/6)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([15,round(l-p1-2)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling 1st distributed load

w=randi([15,50]);
W1=w*10;
W1_label=strcat(num2str(W1),'N');

text(P1+(WR/3),0.15,W1_label,'fontsize',12,'fontweight','bold');

%Plotting point load

p=randi([3,l-3]);
P=p*10;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load

w=randi([8,20]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

%labelling distances

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

plot([P1,P1],[0,-0.5],'LineStyle','--','Linewidth',1.5,'Color','black');
plot([P1+WR,P1+WR],[0,-0.5],'LineStyle','--','Linewidth',1.5,'Color','black');

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');

arrow([P1/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([P1/2,-0.5],[P1,-0.5],'LineWidth',2);

arrow([P1+(WR/2),-0.5],[P1,-0.5],'LineWidth',2);
arrow([P1+(WR/2),-0.5],[P1+WR,-0.5],'LineWidth',2);

text(P1/3,-0.6,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.6,d2_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');


saveas(a,'level5plusa.jpg');

hold off

%Drawing equivalent free body diagram

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

%Plotting point load

arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load


text(P-5,0.85,W_label,'fontsize',12,'fontweight','bold')

%labelling distances

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

%Plotting distributed point load

Pb=P1+WR/2;
arrow([Pb,0.75],[Pb,0],'LineWidth',3)

%Labelling  1st point load

text(Pb-5,0.85,W1_label,'fontsize',12,'fontweight','bold')

plot([Pb,Pb],[0,-0.5],'LineStyle','--','LineWidth',1.5,'Color','black');

db_label=strcat(num2str(Pb),'cm');
db2_label=strcat(num2str(L-Pb),'cm');

if P>=L/2
    
    arrow([Pb/2,-0.5],[0,-0.5],'LineWidth',2);
arrow([Pb/2,-0.5],[Pb,-0.5],'LineWidth',2);

text(Pb/3,-0.6,db_label,'fontsize',12,'fontweight','bold');

else 
    
 arrow([(Pb+L)/2,-0.5],[L,-0.5],'LineWidth',2);
    arrow([(Pb+L)/2,-0.5],[Pb,-0.5],'LineWidth',2);
    
  LP2=L-Pb;
    
    text(Pb+(LP2/3),-0.6,db2_label,'fontsize',12,'fontweight','bold');
    
end

saveas(b,'level5plusb.jpg');

hold off
