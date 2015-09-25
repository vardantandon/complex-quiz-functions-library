file=fopen('Freefall.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:25
    
ID=strcat(num2str(i));

IDString=strcat('Freefall. Question ID #', ID);
    
    t=0:0.1:5;
    a=-9.81;
    s=a*t;
    d=0.5*a*(t).^2;
    
   
% % To plot acceleration versus time graph
% figure(1)
% plot([0,5],[a,a],'linewidth',2,'Color','red');
% hold on
% plot(t,s,'linewidth',2,'Color','green');
% plot(t,d,'linewidth',2,'Color','blue');
% plot([0,5],[0,0],'linewidth',1,'Color','black');
% % set(gca,'YTickLabel',[],'XTickLabel',[])
% %Axes and titles
% axis([0, 5, min(d), min(d)*-1])
% % axis tight
% grid on
% % title('Acceleration Vs Time','FontSize',14, 'FontWeight','bold');
% ylabel('Acceleration / Velocity / Displacement','Fontsize',12,'FontWeight','bold');
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% hold off
% %Plot string generation
% plotString1= generateImageString(gcf, 'image1');
% 
% % incorrect option 1
% figure(2)
% plot([0,5],[-1*a,-1*a],'linewidth',2,'Color','red');
% hold on
% plot(t,-1*s,'linewidth',2,'Color','green');
% plot(t,-1*d,'linewidth',2,'Color','blue');
% plot([0,5],[0,0],'linewidth',1,'Color','black');
% % set(gca,'YTickLabel',[],'XTickLabel',[])
% %Axes and titles
% axis([0, 5, min(d), min(d)*-1])
% % axis tight
% grid on
% % title('Acceleration Vs Time','FontSize',14, 'FontWeight','bold');
% ylabel('Acceleration / Velocity / Displacement','Fontsize',12,'FontWeight','bold');
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% hold off
% plotString2= generateImageString(gcf, 'image2');
% 
% % incorrect option 2
% figure(3)
% plot([0,5],[a,a],'linewidth',2,'Color','red');
% hold on
% plot(t,s,'linewidth',2,'Color','green');
% plot([0,5],[0,min(d)],'linewidth',2,'Color','blue');
% plot([0,5],[0,0],'linewidth',1,'Color','black');
% % set(gca,'YTickLabel',[],'XTickLabel',[])
% %Axes and titles
% axis([0, 5, min(d), min(d)*-1])
% % axis tight
% grid on
% % title('Acceleration Vs Time','FontSize',14, 'FontWeight','bold');
% ylabel('Acceleration / Velocity / Displacement','Fontsize',12,'FontWeight','bold');
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% hold off
% %Plot string generation
% plotString3= generateImageString(gcf, 'image3');
% 
% % incorrect option 3
% figure(4)
% plot([0,5],[a,a],'linewidth',2,'Color','red');
% hold on
% s=0.35*a*(t).^2;
% plot(t,s,'linewidth',2,'Color','green');
% plot(t,d,'linewidth',2,'Color','blue');
% plot([0,5],[0,0],'linewidth',1,'Color','black');
% % set(gca,'YTickLabel',[],'XTickLabel',[])
% %Axes and titles
% axis([0, 5, min(d), min(d)*-1])
% % axis tight
% grid on
% % title('Acceleration Vs Time','FontSize',14, 'FontWeight','bold');
% ylabel('Acceleration / Velocity / Displacement','Fontsize',12,'FontWeight','bold');
% xlabel('Time','Fontsize',12,'FontWeight','bold');
% hold off
% plotString4= generateImageString(gcf, 'image4');


correct= strcat('<p><img src="http://s7.postimg.org/5a1tzb0h7/correct.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image1= strcat('<p><img src="http://s7.postimg.org/97p3opnaj/wrong1.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image2= strcat('<p><img src="http://s7.postimg.org/f62wyy697/wrong2.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');
image3= strcat('<p><img src="http://s7.postimg.org/85jz3aasr/wrong3.jpg" alt="" width="560" height="420" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p>');

numString1 = cloze_mcq('vertical', 1, correct, 'Good Job!', image1, 'Incorrect',image2, 'Incorrect', image3,'Incorrect');

questionString = strcat('<p>A ball is released from a height and it drops under the effect of gravity.</p><p>If we plot the ball''s acceleration (m/s<sup>2</sup>) in red, velocity (m/s) in green, and displacement (m) in blue, from release for the first five seconds, which of the diagrams below is correct?</p>',...
    numString1,...
    '<p>(Question ID #',num2str(i),').</p>');


generalFeedbackStr = strcat('<p>The correct answer to this question is shown above</p>',...
    '<p>Acceleration due to gravity is -9.8 m/s<sup>2</sup>, and remains constant regardless of size, shape or weight of an object in freefall.</p>',...
    '<p>Therefore acceleration in this case is represented by the straight line $$y=-9.8$$, which has a gradient of zero.</p>',...
    '<p>Velocity is the integral of acceleration with respect to time, and is therefore represented by the straight line $$y=-9.8\\times (time)$$.</p>',...
    '<p>Displacement is the integral of velocity with respect to time, and is therefore represented by the curve $$y=-4.9\\times (time)^2$$.</p>',...
   '<p>Remember that acceleration, velocity and displacement are vector (not scalar) quantities. As acceleration has a negative value in this case, so too do velocity and displacement.</p>');


hint1 = strcat('<b>HINT</b><p>Remember that acceleration, velocity and displacement are vector (not scalar) quantities.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        '',...
        '',...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
