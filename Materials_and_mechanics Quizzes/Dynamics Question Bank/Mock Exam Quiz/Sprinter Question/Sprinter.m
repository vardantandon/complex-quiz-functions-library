file=fopen('Sprinter.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('Sprinter. Question ID #', ID);
        
    D=randi([30,50]);
    T=randi([5,10]);
    A=D*2/(T*T);
    V=A*T;
    C=100-D;
    U=C/V;
    B=T+U;
   
% To plot acceleration versus time graph
figure(1)
plot([0,T],[A,A],'linewidth',3,'Color','red');
hold on
plot([T,T],[A,0],'linewidth',3,'Color','red');
plot([T,B],[0,0],'linewidth',3,'Color','red');
%Axes and titles
axis tight
grid on
title('Acceleration Vs Time','FontSize',14, 'FontWeight','bold');
ylabel('Acceleration (m/s^2)','Fontsize',12,'FontWeight','bold');
xlabel('Time (s)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString2= generateImageString(gcf, 'image2');

% To plot speed versus time graph
figure(2)
plot([0,T],[0,V],'linewidth',3,'Color','blue');
hold on
plot([T,B],[V,V],'linewidth',3,'Color','blue');
%Axes and titles
axis tight
grid on
title('Speed Vs Time','FontSize',14, 'FontWeight','bold');
ylabel('Speed (m/s)','Fontsize',12,'FontWeight','bold');
xlabel('Time (s)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

% To plot distance versus time graph
figure(3)
X1=(0:0.01:T);
Y1=A*0.5*X1.^2;
plot(X1,Y1,'linewidth',3,'Color','green');
hold on
plot([T,B],[D,100],'linewidth',3,'Color','green');
%Axes and titles
axis tight
grid on
title('Distance Vs Time','FontSize',14, 'FontWeight','bold');
ylabel('Distance (m)','Fontsize',12,'FontWeight','bold');
xlabel('Time (s)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString4 = generateImageString(gcf, 'image4');
    
numString = cloze_numerical((round(B*10)/10), 0.05, 'Good job!', 'Incorrect, try again');

questionString = strcat('<p>A sprinter in a 100 m race accelerates at a constant rate for the first &nbsp', num2str(D),' m',...
    ' in &nbsp', num2str(T),' s.</p><p>He then runs at a constant speed until he finishes the race.</p><p>What is his finish time?</p>',...
    '<p>(Give your answer correct to 1.d.p.)</p>',...
    numString,' s',...
    '<p><img src="http://s12.postimg.org/cf5oqhk65/track.jpg" alt="" width="362" height="142" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p><p><br></p>',...
    '<p>(Question ID #',num2str(i),').</p>');

generalFeedbackStr = strcat('<p>Using $$s=u.t+\\frac{1}{2}.a.t^2$$ over the first&nbsp',num2str(D),' m  gives:</p>',...
    '<br><p>$$a=\\frac{2.\\left(s-u.t\\right)}{t^2}=',num2str(round(A*100)/100),'m/s^2$$</p>',...
    '<p>Where displacement, $$s$$, is&nbsp',num2str(D),' m; initial velocity, $$u$$, is 0 m/s; time, $$t$$, is&nbsp',num2str(round(T)),' s; and $$a$$ corresponds to acceleration.</p>',...
    '<br><p>Next, using $$v=u+a.t$$ over the first&nbsp',num2str(D),' m  gives:</p>',...
    '<p>$$v=',num2str(round(V*10)/10),'m/s$$</p>',...
    '<p>Where $$v$$ corresponds to final velocity.</p>',...
    '<br><p>The time taken to cover the remaining&nbsp',num2str(C),'m $$=\\frac{',num2str(C),'m}{',num2str(round(V*10)/10),'m/s}=', num2str(round(U*10)/10),'s$$</p>', ...
    '<br><p>Therefore total time $$=',num2str(round(T)),'s+', num2str(round(U*10)/10),'s=',num2str(round(B*10)/10),'s$$</p>',...
    '<br><p>The acceleration versus time graph for this race will look like this:</p><br><p></p><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<p><br></p><p>The speed versus time graph is the integral of the acceleration versus time graph, and will look like this:</p><br><p></p><img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
    '<p><br></p><p>The distance versus time graph is the integral of the speed versus time graph, and will look like this:</p><br><p></p><img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">',...
  '<p>---------------------------------------------------------------------------------------------------------------------</p>',...
     '<p>Image adapted from ''http://nrich.maths.org/content/id/7359/track.jpg''</p>');
    
        

hint1 = strcat('<b>HINT</b><p>First of all calculate the initial constant acceleration, then use this to find the final velocity,',...
    ' then the time to cover the last &nbsp',num2str(C),' m.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        plotString2,...
        plotString3,...
        plotString4);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
