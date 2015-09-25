% To plot displacement time graph for maxwell model
figure(1)
plot([0,1],[2,6],'linewidth',3,'Color','black');
hold on
plot([1,1],[6,4],'linewidth',3,'Color','black');
plot([1,2],[4,4],'linewidth',3,'Color','black');
plot([0,0],[0,10],'linewidth',1,'Color','black');
plot([0,2],[0, 0],'linewidth',1,'Color','black');
plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
arrow([1.05,6],[1.05,4.1],'LineWidth',2)
arrow([1.05,4.1],[1.05,6],'LineWidth',2)
arrow([0.05,0],[0.05,2],'LineWidth',2)
arrow([0.05,2],[0.05,0],'LineWidth',2)
text(0.1,1,'(F/k)','Fontsize',12,'Fontweight','bold');
text(1.1,5,'(F/k)','Fontsize',12,'Fontweight','bold');


grid on

axis tight

title('Maxwell Model','FontSize',20, 'FontWeight','bold');
set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation

% To plot load time graph for maxwell model
figure(2)
plot([0,0],[0,1],'linewidth',3,'Color','black');
hold on
plot([0,1],[1,1],'linewidth',3,'Color','black');
plot([1,1],[1,0],'linewidth',3,'Color','black');
plot([1,2],[0,0],'linewidth',3,'Color','black');
plot([0,2],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,2],'linewidth',1,'Color','black');
plot([1,1],[1,2],'Linestyle','--','linewidth',1,'Color','black');

rectangle('Position',[0,0,1,1],'Facecolor','[0.5 0.5 0.5]')
grid on

axis tight
set(gca,'YTickLabel',[],'XTickLabel',[])
ylabel('Load','Fontsize',12,'FontWeight','bold');
xlabel('Time','Fontsize',12,'FontWeight','bold');


hold off

%Plot string generation



