file=fopen('Kelvin model.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:25

ID=strcat(num2str(i));

IDString=strcat('Maxwell-1. Question ID #', ID);

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

% title('Maxwell Model','FontSize',20, 'FontWeight','bold');
set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString1= generateImageString(gcf, 'image1');


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
plotString2= generateImageString(gcf, 'image2');

% % To plot displacement time graph for question 1
% figure(3)
% plot([0,1],[2,6],'linewidth',3,'Color','black');
% hold on
% plot([1,1],[6,4],'linewidth',3,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','black');
% plot([0,0],[0,10],'linewidth',1,'Color','black');
% plot([0,2],[0, 0],'linewidth',1,'Color','black');
% plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','red');
% plot([1,1],[5,4],'linewidth',3,'Color','red');
% plot([0,1],[1,5],'linewidth',3,'Color','red');
% 
% grid on
% 
% axis tight
% 
% % title('Maxwell Model','FontSize',20, 'FontWeight','bold');
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
% % To plot displacement time graph for question 2
% figure(4)
% plot([0,1],[2,6],'linewidth',3,'Color','black');
% hold on
% plot([1,1],[6,4],'linewidth',3,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','black');
% plot([0,0],[0,10],'linewidth',1,'Color','black');
% plot([0,2],[0, 0],'linewidth',1,'Color','black');
% plot([1,1],[9,0],'Linestyle','--','linewidth',1,'Color','black');
% plot([0,1],[2,9],'linewidth',3,'Color','red');
% plot([1,1],[9,7],'linewidth',3,'Color','red');
% plot([1,2],[7,7],'linewidth',3,'Color','red');
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
% % To plot displacement time graph for question 3
% figure(5)
% plot([0,1],[2,6],'linewidth',3,'Color','black');
% hold on
% plot([1,1],[6,4],'linewidth',3,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','black');
% plot([0,0],[0,10],'linewidth',1,'Color','black');
% plot([0,2],[0, 0],'linewidth',1,'Color','black');
% plot([1,1],[8,0],'Linestyle','--','linewidth',1,'Color','black');
% plot([1,2],[7,7],'linewidth',3,'Color','red');
% plot([1,1],[8,7],'linewidth',3,'Color','red');
% plot([0,1],[1,8],'linewidth',3,'Color','red');
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
% 
% % To plot displacement time graph for incorrect option
% figure(6)
% plot([0,1],[2,6],'linewidth',3,'Color','black');
% hold on
% plot([1,1],[6,4],'linewidth',3,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','black');
% plot([0,0],[0,10],'linewidth',1,'Color','black');
% plot([0,2],[0, 0],'linewidth',1,'Color','black');
% plot([1,1],[9,0],'Linestyle','--','linewidth',1,'Color','black');
% plot([1,2],[7,7],'linewidth',3,'Color','red');
% plot([1,1],[9,7],'linewidth',3,'Color','red');
% plot([0,1],[1,9],'linewidth',3,'Color','red');
% 
% grid on
% 
% axis tight
% 
% % title('Maxwell Model','FontSize',20, 'FontWeight','bold');
% set(gca,'YTickLabel',[],'XTickLabel',[])
% 
% ylabel('Displacement','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% %Plot string generation
% plotString6= generateImageString(gcf, 'image6');


% % To plot displacement time graph for feedback
% figure(7)
% plot([0,1],[2,6],'linewidth',3,'Color','black');
% hold on
% plot([1,1],[6,4],'linewidth',3,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','black');
% plot([0,0],[0,10],'linewidth',1,'Color','black');
% plot([0,2],[0, 0],'linewidth',1,'Color','black');
% plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
% plot([1,2],[4,4],'linewidth',3,'Color','red');
% plot([1,1],[5,4],'linewidth',3,'Color','red');
% plot([0,1],[1,5],'linewidth',3,'Color','red');
% arrow([1.05,5],[1.05,4.1],'LineWidth',2)
% arrow([1.05,4.1],[1.05,5],'LineWidth',2)
% arrow([0.05,0],[0.05,1],'LineWidth',2)
% arrow([0.05,1],[0.05,0],'LineWidth',2)
% text(0.1,0.5,'(F/k)','Fontsize',12,'Fontweight','bold','Color','red');
% text(1.1,4.5,'(F/k)','Fontsize',12,'Fontweight','bold','Color','red');
% grid on
% 
% axis tight
% 
% % title('Maxwell Model','FontSize',20, 'FontWeight','bold');
% set(gca,'YTickLabel',[],'XTickLabel',[])
% 
% ylabel('Displacement','Fontsize',12,'FontWeight','bold');
% 
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% 
% hold off
% 
% %Plot string generation
% plotString7= generateImageString(gcf, 'image7');

image3= strcat('<p><img src="http://s7.postimg.org/wiwugnnqz/image3.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image4= strcat('<p><img src="http://s7.postimg.org/if0z89gjf/image4.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image5= strcat('<p><img src="http://s7.postimg.org/742wxmz23/image5.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image6= strcat('<p><img src="http://s7.postimg.org/eu53p1bzv/image6.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');

numString1 = cloze_mcq('vertical', 2, image4, 'Incorrect', image3, 'Good Job!',image5, 'Incorrect', image6,'Incorrect');

questionString = strcat('<p>The image below shows a model for viscoelastic materials, combining two springs and a dashpot as shown below.</p>',...
    '<p><img src="<p><img src="http://s23.postimg.org/qajqhw32z/kelvin_model.jpg" alt="" width="184" height="209" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>',...
    'Where $$F$$ is a fixed load applied to the system, $$u$$ is the displacement of the system, and $$\\dot{u}$$ is the rate of displacement of the system, with respect to time.</p>',...
    '<br><p>A fixed load (F) is instantaneously applied, and later instantaneously removed, as shown in the graph below.</p>',...
    '<img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<br><p><br></p><p>From the options below, select which graph correctly represents the displacement/time plot that would be obtained if a fixed load was applied in this manner.</p>',...
    numString1);

generalFeedbackStr = strcat('<p>The image above shows the correct answer to this question.</p>',...
    '<p>The same force has been applied, but the spring constant has been doubled. Therefore, the displacement defined by the equation (F/k) has been halved.</p>',...
    '<p>The gradient of the sloped section of this graph represents the rate of displacement due to the dashpot, and is defined by (F/$$\\small\\eta$$). As $$\\small\\eta$$ remains unchanged, so too does the gradient of the sloped section of the graph.</p>');

hint1 = strcat('<p>Which aspect of the graph will be affected by the change in the spring constant?</p>');

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


