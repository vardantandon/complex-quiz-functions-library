file=fopen('Voigt-2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:25

ID=strcat(num2str(i));

IDString=strcat('Voigt-2. Question ID #', ID);

% To plot displacement time graph for maxwell model
F=10;
k=5;
n=10;
t=0:0.1:4;
u=(F/k)*(1-exp(-1*t*k/n));
figure(1)
plot(t,u,'linewidth',3,'Color','black');
hold on
t1=4:0.1:10;
u1=(F/k)*(1-exp(-1*t1*k/n));
plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');
t2=4:0.1:8;
u2=-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u));
plot(t2,u2,'linewidth',3,'Color','black');
arrow([max(t1)-1,0],[max(t1)-1,(F/k)],'LineWidth',2)
arrow([max(t1)-1,(F/k)],[max(t1)-1,0],'LineWidth',2)
text(max(t1)-1.9,(F/(2*k)),'(F/k)','Fontsize',12,'Fontweight','bold');
text(0.55,0.25,'(F/\eta)','Fontsize',12,'Fontweight','bold');
text(0.55,0.35,'Initial gradient','Fontsize',12,'Fontweight','bold');

grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString1= generateImageString(gcf, 'image1');


% To plot load time graph for voigt model
figure(2)
plot([0,0],[0,1],'linewidth',3,'Color','black');
hold on
plot([0,4],[1,1],'linewidth',3,'Color','black');
plot([4,4],[1,0],'linewidth',3,'Color','black');
plot([4,10],[0,0],'linewidth',3,'Color','black');
plot([0,10],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,2],'linewidth',1,'Color','black');
plot([4,4],[1,2],'Linestyle','--','linewidth',1,'Color','black');

rectangle('Position',[0,0,4,1],'Facecolor','[0.5 0.5 0.5]')
grid on

axis tight
set(gca,'YTickLabel',[],'XTickLabel',[])
ylabel('Load','Fontsize',12,'FontWeight','bold');
xlabel('Time','Fontsize',12,'FontWeight','bold');



hold off

%Plot string generation
plotString2= generateImageString(gcf, 'image2');

% To plot displacement time graph for question 1 model
figure(3)
plot(t,u,'linewidth',3,'Color','black');
hold on 
plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
plot(t2,u2,'linewidth',3,'Color','black');
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');F=10;
k=10;
n=10;
u3=(F/k)*(1-exp(-1*t*k/n));
u4=(F/k)*(1-exp(-1*t1*k/n));
u5=-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u3));

plot(t,u3,'linewidth',3,'Color','[.7 .5 0]');
plot(t1,u4,'linewidth',3,'Color','[.7 .5 0]','Linestyle',':');
plot(t2,u5,'linewidth',3,'Color','[.7 .5 0]');

grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

% To plot displacement time graph for question 2 model
figure(4)
plot(t,u,'linewidth',3,'Color','black');
hold on 
plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
plot(t2,u2,'linewidth',3,'Color','black');
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');F=10;
k=5;
n=5;
u3=(F/k)*(1-exp(-1*t*k/n));
u4=(F/k)*(1-exp(-1*t1*k/n));
u5=-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u3));

plot(t,u3,'linewidth',3,'Color','[.7 .5 0]');
plot(t1,u4,'linewidth',3,'Color','[.7 .5 0]','Linestyle',':');
plot(t2,u5,'linewidth',3,'Color','[.7 .5 0]');


grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

% To plot displacement time graph for question 3 model
figure(5)
plot(t,u,'linewidth',3,'Color','black');
hold on 
plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
plot(t2,u2,'linewidth',3,'Color','black');
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');F=10;
k=10;
n=5;
u3=(F/k)*(1-exp(-1*t*k/n));
u4=(F/k)*(1-exp(-1*t1*k/n));
u5=-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u3));

plot(t,u3,'linewidth',3,'Color','[.7 .5 0]');
plot(t1,u4,'linewidth',3,'Color','[.7 .5 0]','Linestyle',':');
plot(t2,u5,'linewidth',3,'Color','[.7 .5 0]');


grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

% To plot displacement time graph for incorrect option model
figure(6)
plot(t,u,'linewidth',3,'Color','black');
hold on 
plot(t1,u1,'linewidth',3,'Color','black','Linestyle',':');
plot(t2,u2,'linewidth',3,'Color','black');
plot([0,max(t1)],[0,0],'linewidth',1,'Color','black');
plot([0,0],[0,max(u1)],'linewidth',1,'Color','black');
plot([4,4],[max(u),0],'linewidth',1,'Color','black','Linestyle','--');F=10;
k=10;
n=20;
u3=(F/k)*(1-exp(-1*t*k/n));
u4=(F/k)*(1-exp(-1*t1*k/n));
u5=-1*((F/k)*(1-exp(-1*(t2-4)*k/n)))+(max(u3));

plot(t,u3,'linewidth',3,'Color','[.7 .5 0]');
plot(t1,u4,'linewidth',3,'Color','[.7 .5 0]','Linestyle',':');
plot(t2,u5,'linewidth',3,'Color','[.7 .5 0]');


grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

image3= strcat('<p><img src="http://s13.postimg.org/x69ecsncn/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image4= strcat('<p><img src="http://s13.postimg.org/xkaqce7g7/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image5= strcat('<p><img src="http://s13.postimg.org/4j6e2zn07/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image6= strcat('<p><img src="http://s13.postimg.org/7ejh9ur07/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');

numString1 = cloze_mcq('vertical', 2, image3, 'Incorrect', image4, 'Good Job!',image5, 'Incorrect', image6,'Incorrect');

questionString = strcat('<p>The image below shows the Voigt Model for viscoelastic materials, along with the displacement time plot obtained when a fixed load (F) is',...
    ' instantaneously applied, and later instantaneously removed.</p><p>In this system a spring (with spring constant ''k'') is connected in parallel with a dashpot (with viscosity $$\\small\\eta$$).</p>',... 
    '<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<br><p><br></p><p>From the options below, select which graph correctly represents what would happen if the viscosity in the dashpot was halved, but the spring unchanged (represented by the brown line).</p>',...
    '<p>(The black line represents the original conditions)</p>',...
    numString1);

generalFeedbackStr = strcat('<p>The image above shows the correct answer to this question.</p>',...
    '<p>The initial gradient of the slope represents the rate of displacement of the system, and is defined by (F/$$\\small\\eta$$). As $$\\small\\eta$$ has been halved, the initial gradient of the slope has doubled.</p>',...
    '<p>This change will also cause the system to displace further in the same amount of time.</p>',...
    '<p>However, as the value of k is unchanged, the slope will asymptotically move towards the same value of (F/k).</p>');

hint1 = strcat('<p>Which aspects of the graph will be affected by the change in the dashpot?</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        plotString1,...
        plotString2,...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
 
    end
    
fprintf(file, quiz_end()); %xml closing code
fclose(file);


