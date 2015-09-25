file=fopen('Maxwell-2.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:25

ID=strcat(num2str(i));

IDString=strcat('Maxwell-2. Question ID #', ID);

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
% plot([1,2],[4,4],'linewidth',3,'Color','yellow');
% plot([1,1],[5,4],'linewidth',3,'Color','yellow');
% plot([0,1],[1,5],'linewidth',3,'Color','yellow');
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
% plot([1,1],[10,0],'Linestyle','--','linewidth',1,'Color','black');
% plot([0,1],[2,10],'linewidth',3,'Color','yellow');
% plot([1,1],[10,8],'linewidth',3,'Color','yellow');
% plot([1,2],[8,8],'linewidth',3,'Color','yellow');
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
% plot([1,2],[7,7],'linewidth',3,'Color','yellow');
% plot([1,1],[8,7],'linewidth',3,'Color','yellow');
% plot([0,1],[1,8],'linewidth',3,'Color','yellow');
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
% plot([1,2],[7,7],'linewidth',3,'Color','yellow');
% plot([1,1],[9,7],'linewidth',3,'Color','yellow');
% plot([0,1],[1,9],'linewidth',3,'Color','yellow');
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

image3= strcat('<p><img src="http://s21.postimg.org/q49krbhfb/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image4= strcat('<p><img src="http://s21.postimg.org/8s985vnxz/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image5= strcat('<p><img src="http://s21.postimg.org/izrriaa5z/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image6= strcat('<p><img src="http://s21.postimg.org/dffa7nbav/image.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');

numString1 = cloze_mcq('vertical', 1, image4, 'Good Job', image3, 'Incorrect',image5, 'Incorrect', image6,'Incorrect');

questionString = strcat('<p>The image below shows the Maxwell Model for viscoelastic materials, along with the displacement time plot obtained when a fixed load (F) is',...
    ' instantaneously applied, and later instantaneously removed.</p><p>In this system a spring (with spring constant ''k'') is connected in series with a dashpot (with viscosity $$\\small\\eta$$).</p>',... 
    '<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<br><p><br></p><p>From the options below, select which graph correctly represents what would happen if the viscosity in the dashpot was halved, but the spring unchanged (represented by the yellow line).</p>',...
    '<p>(The black line represents the original conditions)</p>',...
    numString1);

generalFeedbackStr = strcat('<p>The image above shows the correct answer to this question.</p>',...
    '<p>The gradient of the sloped section of this graph represents the rate of displacement due to the dashpot, and is defined by (F/$$\\small\\eta$$).</p>',...
    '<p>The same force has been applied, but the viscosity in the dashpot has been halved. Therefore, the rate of displacement (and thus the gradient of the sloped section of the graph) has been doubled.</p>',...
    '<p>The displacement defined by the equation (F/k) remains unchanged, as k has not been altered in this case.</p>');

hint1 = strcat('<p>Which aspect of the graph will be affected by the change in the viscosity in the dashpot?</p>');


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


