file=fopen('Kelvin model.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:25

ID=strcat(num2str(i));

IDString=strcat('Maxwell-1. Question ID #', ID);

% % To plot displacement time graph for correct answer
% F=10;
% k=5;
% n=10;
% t=0:0.1:4;
% u=((F/k)*(1-exp(-1*t*k/n))+(F/(2*k)));
% figure(1)
% plot(t,u,'linewidth',3,'Color','black');
% hold on
% t1=4:0.1:10;
% u1=(F/k)*(1-exp(-1*t1*k/n))+(F/(2*k));
% plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
% plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
% plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
% plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
% plot([0,0],[0,(F/(2*k))],'linewidth',3,'Color','black');
% plot([4,4],[max(u),max(u)-(F/(2*k))],'linewidth',3,'Color','black');
% 
% t2=4:0.1:8;
% u2=(-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u)))-((F/(2*k)));
% plot(t2,u2,'linewidth',3,'Color','black');
% 
% 
% grid on
% 
% axis tight
% 
% set(gca,'YTickLabel',[],'XTickLabel',[])
% 
% ylabel('Displacement','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% %Plot string generation
% plotString1= generateImageString(gcf, 'image1');

% To plot load time graph
figure(2)
plot([0,0],[0,1],'linewidth',3,'Color','black');
hold on
plot([0,1],[1,1],'linewidth',3,'Color','black');
plot([1,1],[1,0],'linewidth',3,'Color','black');
plot([1,2],[0,0],'linewidth',3,'Color','black');
plot([0,2],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,2],'linewidth',1,'Color','black');
plot([1,1],[1,2],'Linestyle','--','linewidth',1,'Color','black');

rectangle('Position',[0,0,1,1],'Facecolor','[0.5 0.5 0.5]','LineWidth',1)
grid on
axis tight
set(gca,'YTickLabel',[],'XTickLabel',[])
ylabel('Load','Fontsize',12,'FontWeight','bold');
xlabel('Time','Fontsize',12,'FontWeight','bold');


hold off

%Plot string generation
plotString2= generateImageString(gcf, 'image2');

% % To plot incorrect answer #1
% F=10;
% k=5;
% n=10;
% t=0:0.1:4;
% u=((F/k)*(1-exp(-1*t*k/n)));
% figure(3)
% plot(t,u,'linewidth',3,'Color','black');
% hold on
% t1=4:0.1:10;
% u1=(F/k)*(1-exp(-1*t1*k/n));
% plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
% plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
% plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
% plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
% 
% 
% t2=4:0.1:8;
% u2=(-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u)));
% plot(t2,u2,'linewidth',3,'Color','black');
% 
% 
% grid on
% 
% axis tight
% 
% set(gca,'YTickLabel',[],'XTickLabel',[])
% 
% ylabel('Displacement','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% %Plot string generation
% plotString3= generateImageString(gcf, 'image3');
% 
% % To plot incorrect answer #2
% F=10;
% k=5;
% n=10;
% t=0:0.1:4;
% u=((F/k)*(1-exp(-1*t*k/n))+(F/(2*k)));
% figure(4)
% plot(t,u,'linewidth',3,'Color','black');
% hold on
% t1=4:0.1:10;
% u1=(F/k)*(1-exp(-1*t1*k/n))+(F/(2*k));
% plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
% plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
% plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
% plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
% plot([0,0],[0,(F/(2*k))],'linewidth',3,'Color','black');
% plot([8,8],[0,(F/(2*k))],'linewidth',3,'Color','black');
% 
% t2=4:0.1:8;
% u2=(-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u)));
% plot(t2,u2,'linewidth',3,'Color','black');
% 
% grid on
% 
% axis tight
% 
% set(gca,'YTickLabel',[],'XTickLabel',[])
% 
% ylabel('Displacement','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% %Plot string generation
% plotString4= generateImageString(gcf, 'image4');
% 
% % To plot incorrect answer #3
% F=10;
% k=5;
% n=10;
% t=0:0.1:4;
% u=((F/k)*(1-exp(-1*t*k/n))+(F/(2*k)));
% figure(5)
% plot(t,u,'linewidth',0.1,'Color','white');
% hold on
% t1=4:0.1:10;
% u1=(F/k)*(1-exp(-1*t1*k/n))+(F/(2*k));
% plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
% plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
% plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
% plot([0,0],[0,(F/(2*k))],'linewidth',3,'Color','black');
% plot([4,4],[max(u),max(u)-(F/(2*k))],'linewidth',3,'Color','black');
% plot([0,4],[(F/(2*k)),max(u)],'linewidth',3,'Color','black');
% plot([4,8],[max(u)-(F/(2*k)),0],'linewidth',3,'Color','black');
% plot([4,4.60],[max(u),3],'linewidth',3,'Color','black','Linestyle',':');
% 
% t2=4:0.1:8;
% u2=(-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u)));
% % plot(t2,u2,'linewidth',3,'Color','black');
% 
% grid on
% 
% axis tight
% 
% set(gca,'YTickLabel',[],'XTickLabel',[])
% 
% ylabel('Displacement','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% %Plot string generation
% plotString5= generateImageString(gcf, 'image5');

% To plot displacement time graph for correct answer
F=10;
k=5;
n=10;
t=0:0.1:4;
u=((F/k)*(1-exp(-1*t*k/n))+(F/(2*k)));
figure(6)
plot(t,u,'linewidth',3,'Color','black');
hold on
t1=4:0.1:10;
u1=(F/k)*(1-exp(-1*t1*k/n))+(F/(2*k));
plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
plot([0,0],[0,(F/(2*k))],'linewidth',3,'Color','black');
plot([4,4],[max(u),max(u)-(F/(2*k))],'linewidth',3,'Color','black');

t2=4:0.1:8;
u2=(-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u)))-((F/(2*k)));
plot(t2,u2,'linewidth',3,'Color','black');
arrow([max(t1)-1,0],[max(t1)-1,3],'LineWidth',2)
arrow([max(t1)-1,3],[max(t1)-1,0],'LineWidth',2)
text(max(t1)-1.9,1.5,'F/K_{2}','Fontsize',12,'Fontweight','bold');
text(4.35,2.2,'F/(K_{1}+K_{2})','Fontsize',12,'Fontweight','bold');
% text(0.55,0.35,'Initial gradient','Fontsize',12,'Fontweight','bold');
arrow([0.2,0],[0.2,1],'LineWidth',2)
arrow([0.2,1],[0.2,0],'LineWidth',2)
arrow([4.2,max(u)],[4.2,max(u)-(F/(2*k))],'LineWidth',2)
arrow([4.2,max(u)-(F/(2*k))],[4.2,max(u)],'LineWidth',2)
text(0.35,0.5,'F/(K_{1}+K_{2})','Fontsize',12,'Fontweight','bold');

grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString6= generateImageString(gcf, 'image6');

image3= strcat('<p><img src="http://s1.postimg.org/sprhn5kbj/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image4= strcat('<p><img src="http://s1.postimg.org/gmhklujvj/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image5= strcat('<p><img src="http://s1.postimg.org/hsq5ydxjz/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image6= strcat('<p><img src="http://s1.postimg.org/cg1bk99nj/correct.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');

numString1 = cloze_mcq('vertical', 2, image4, 'Incorrect', image6, 'Good Job!',image5, 'Incorrect', image3,'Incorrect');

questionString = strcat('<p>The image below shows a model for viscoelastic materials, combining two springs and a dashpot as shown.</p>',...
    '<p><img src="http://s23.postimg.org/qajqhw32z/kelvin_model.jpg" alt="" width="184" height="209" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>',...
    'Where $$F$$ is a fixed load applied to the system, $$u$$ is the displacement of the system, and $$\\dot{u}$$ is the rate of displacement of the system, with respect to time.</p>',...
    '<br><p>A fixed load (F) is instantaneously applied, and later instantaneously removed, as shown in the graph below.</p>',...
    '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<br><p><br></p><p>From the options below, select which graph correctly represents the displacement/time plot that would be obtained in this situation.</p>',...
    numString1);

generalFeedbackStr = strcat('<img src="@@PLUGINFILE@@/image6.png" style="width:100%%; height:auto;">',...
    '<p>The correct answer is shown in the image above.</p>',...
    '<p>The initial instantaneous displacement when the load is applied (and later removed) is governed by the two spring constants,',...
    ' and is defined by the equation<br> $$\\frac{F}{\\left(K_1+K_2\\right)}$$</p>',...
    '<p>The equilibrium displacment is equal to <br>$$\\frac{F}{\\left(K_2\\right)}$$<br> as it is this spring which is carrying the whole load at equilibrium.</p>',...
    '<p>The curve between inbetween initial and equilibrium displacements is determined by a combination of the two spring constants, and the viscosity of the dashpot.</p>');

hint1 = strcat('<b>HINT</b><p>Think about how the system will responed initially, and whether or not it will reach equilibrium.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        plotString2,...
        '',...
        plotString6);
    
    %Output
    fprintf(file, xmlCode);
 
    end
    
fprintf(file, quiz_end()); %xml closing code
fclose(file);


