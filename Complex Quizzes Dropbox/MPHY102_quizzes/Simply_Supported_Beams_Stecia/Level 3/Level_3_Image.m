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

%Plotting distributed load

p1=randi([3,round(l/3)]);
P1=p1*10;
yr=0.05;
hr=0.3;
wr=randi([3,round(l/2.5)]);
WR=wr*10;
rectangle('Position',[P1,yr,WR,hr],'LineWidth',4,'EdgeColor','r','FaceColor','g');

%Labelling distributed load

w=randi([15,50]);
W=w*10;
W_label=strcat(num2str(W),'N');

text(P1+(WR/3),0.15,W_label,'fontsize',12,'fontweight','bold');

%Labelling distances

d1_label=strcat(num2str(P1),'cm');
d2_label=strcat(num2str(WR),'cm');
d3_label=strcat(num2str(L-P1-WR),'cm');

arrow([P1/2,-0.1],[0,-0.1],'LineWidth',2);
arrow([P1/2,-0.1],[P1,-0.1],'LineWidth',2);

arrow([P1+(WR/2),-0.1],[P1,-0.1],'LineWidth',2);
arrow([P1+(WR/2),-0.1],[P1+WR,-0.1],'LineWidth',2);

arrow([(P1+WR+L)/2,-0.1],[P1+WR,-0.1],'LineWidth',2);
arrow([(P1+WR+L)/2,-0.1],[L,-0.1],'LineWidth',2);

text(P1/3,-0.2,d1_label,'fontsize',12,'fontweight','bold');

text(P1+WR/3,-0.2,d2_label,'fontsize',12,'fontweight','bold');

text(P1+WR+(L-P1-WR)/3,-0.2,d3_label,'fontsize',12,'fontweight','bold');

%Indicating level

rectangle('Position',[L-5*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-4*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-3*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5,'FaceColor','y');
rectangle('Position',[L-2*L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);
rectangle('Position',[L-L/20+5,1.3,L/20,0.1],'Curvature',[1,1],'LineWidth',1.5);

saveas(a,'level3a.jpg')

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

%Plotting point load

P=P1+WR/2;
arrow([P,0.75],[P,0],'LineWidth',3)

%Labelling point load

W_label_b=strcat(num2str(W),'N');

text(P-5,0.85,W_label_b,'fontsize',12,'fontweight','bold')

%Labelling distances

d_label=strcat(num2str(P),'cm');

if P>=L/2
     
arrow([P/2,-0.1],[0,-0.1],'LineWidth',3);
arrow([P/2,-0.1],[P,-0.1],'LineWidth',3);

text(P/3,-0.2,d_label,'fontsize',12,'fontweight','bold');

else
    
    arrow([P+L/2,-0.1],[L,-0.1],'LineWidth',3);
    arrow([P+L/2,-0.1],[P,-0.1],'LineWidth',3);
    
  LP=L-P;
    
    text(P+(LP/3),-0.2,strcat(num2str(LP),'cm'),'fontsize',12,'fontweight','bold');
    
end 

saveas(b,'level3b.jpg');


hold off