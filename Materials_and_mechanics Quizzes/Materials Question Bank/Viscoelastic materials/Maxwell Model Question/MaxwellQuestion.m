file=fopen('Maxwell.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

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

% To plot displacement time graph for question a
figure(3)
plot([0,1],[2,6],'linewidth',3,'Color','black');
hold on
plot([1,1],[6,4],'linewidth',3,'Color','black');
plot([1,2],[4,4],'linewidth',3,'Color','black');
plot([0,0],[0,10],'linewidth',1,'Color','black');
plot([0,2],[0, 0],'linewidth',1,'Color','black');
plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
plot([1,2],[4,4],'linewidth',3,'Color','red');
plot([1,1],[5,4],'linewidth',3,'Color','red');
plot([0,1],[1,5],'linewidth',3,'Color','red');

grid on

axis tight

% title('Maxwell Model','FontSize',20, 'FontWeight','bold');
set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString3= generateImageString(gcf, 'image3');

% To plot displacement time graph for question b
figure(4)
plot([0,1],[2,6],'linewidth',3,'Color','black');
hold on
plot([1,1],[6,4],'linewidth',3,'Color','black');
plot([1,2],[4,4],'linewidth',3,'Color','black');
plot([0,0],[0,10],'linewidth',1,'Color','black');
plot([0,2],[0, 0],'linewidth',1,'Color','black');
plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
plot([0,1],[2,9],'linewidth',3,'Color','red');
plot([1,1],[9,7],'linewidth',3,'Color','red');
plot([1,2],[7,7],'linewidth',3,'Color','red');

grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString4= generateImageString(gcf, 'image4');

% To plot displacement time graph for question c
figure(5)
plot([0,1],[2,6],'linewidth',3,'Color','black');
hold on
plot([1,1],[6,4],'linewidth',3,'Color','black');
plot([1,2],[4,4],'linewidth',3,'Color','black');
plot([0,0],[0,10],'linewidth',1,'Color','black');
plot([0,2],[0, 0],'linewidth',1,'Color','black');
plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
plot([1,2],[7,7],'linewidth',3,'Color','red');
plot([1,1],[8,7],'linewidth',3,'Color','red');
plot([0,1],[1,8],'linewidth',3,'Color','red');

grid on

axis tight

set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString5= generateImageString(gcf, 'image5');

% To plot displacement time graph for incorrect option
figure(6)
plot([0,1],[2,6],'linewidth',3,'Color','black');
hold on
plot([1,1],[6,4],'linewidth',3,'Color','black');
plot([1,2],[4,4],'linewidth',3,'Color','black');
plot([0,0],[0,10],'linewidth',1,'Color','black');
plot([0,2],[0, 0],'linewidth',1,'Color','black');
plot([1,1],[6,0],'Linestyle','--','linewidth',1,'Color','black');
plot([1,2],[7,7],'linewidth',3,'Color','red');
plot([1,1],[9,7],'linewidth',3,'Color','red');
plot([0,1],[1,9],'linewidth',3,'Color','red');

grid on

axis tight

% title('Maxwell Model','FontSize',20, 'FontWeight','bold');
set(gca,'YTickLabel',[],'XTickLabel',[])

ylabel('Displacement','Fontsize',12,'FontWeight','bold');

xlabel('Time','Fontsize',12,'FontWeight','bold');

hold off

%Plot string generation
plotString6= generateImageString(gcf, 'image6');

numString1 = cloze_mcq('vertical', 2, '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">', 'Incorrect','<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">', 'Good Job!','<img src="@@PLUGINFILE@@/image5.png" style="width:100%%; height:auto;">', 'Incorrect', '<img src="@@PLUGINFILE@@/image6.png" style="width:100%%; height:auto;">','Incorrect');
numString2 = cloze_mcq('vertical', 2, '<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">', 'Incorrect','<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">', 'Good Job!','<img src="@@PLUGINFILE@@/image5.png" style="width:100%%; height:auto;">', 'Incorrect', '<img src="@@PLUGINFILE@@/image6.png" style="width:100%%; height:auto;">','Incorrect');
numString3 = cloze_mcq('vertical', 2, '<img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">', 'Incorrect','<img src="@@PLUGINFILE@@/image5.png" style="width:100%%; height:auto;">', 'Good Job!','<img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">', 'Incorrect', '<img src="@@PLUGINFILE@@/image6.png" style="width:100%%; height:auto;">','Incorrect');

questionString = strcat('<p>The image below shows the Maxwell Model for viscoelastic materials, along with the displacement time plot obtained when a fixed load (F) is',...
    ' instantaneously applied, and later instantaneously removed.</p><p>In this system a spring (with spring constant ''k'') is connected in parallel with a dashpot (with viscosity $$\\small\\eta$$).</p>',... 
    '<br><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<br><p>From the options below, select which graph correctly represents what would happen if the spring constant of the spring was doubled, but the dashpot unchanged (represented by the red line).</p>',...
    '<p>(The black line represents the original conditions)</p>',...
    numString1,...
    '<br><p>From the options below, select which graph correctly represents what would happen if the viscosity in the dashpot was halved, but the spring unchanged (represented by the red line).</p>',...
    '<p>(The black line represents the original conditions)</p>',...
    numString2,...
    '<br><p>From the options below, select which graph correctly represents what would happen if both of these changes were made (represented by the red line).</p>',...
    '<p>(The black line represents the original conditions)</p>',...
    numString3);

generalFeedbackStr = strcat('');

hint1 = strcat('');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        plotString1,...
        plotString2,...
        plotString3,...
        plotString4,...
        plotString5,...
        plotString6);
    
    %Output
    fprintf(file, xmlCode);
    
fprintf(file, quiz_end()); %xml closing code
fclose(file);


