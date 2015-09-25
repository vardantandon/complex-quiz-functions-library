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
plot([0,T],[0,V],'linewidth',3,'Color','red');
hold on
plot([T,B],[V,V],'linewidth',3,'Color','red');
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
plot(X1,Y1,'linewidth',3,'Color','red');
hold on
plot([T,B],[D,100],'linewidth',3,'Color','red');
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

questionString = strcat('<p>A sprinter in a 100 metre race accelerates at a constant rate for the first &nbsp', num2str(D),' metres',...
    ' in &nbsp', num2str(T),' seconds. He then runs at a constant speed. What is his finish time?</p>',...
    '<p>(Give your answer in seconds correct to 1.d.p.)</p>',...
    numString,...
    '<p><img src="http://nrich.maths.org/content/id/7359/track.jpg" alt="" width="362" height="142" role="presentation" style="vertical-align:middle; margin: 0 .5em;" class="img-responsive"><br></p><p><br></p>',...
    '<p>(Question ID #',num2str(i),').</p>');

generalFeedbackStr = strcat('<p>Using s = (u*t) + 0.5*a*t<sup>2</sup> gives:</p>',...
    '<p>a = &nbsp',num2str(round(A*100)/100),' m/s<sup>2</sup></p>', ...
    '<p>Using v = u + a*t gives:</p>',...
    '<p>v = &nbsp',num2str(round(V*10)/10),' m/s</p>',...
    '<p>The time taken to cover the remaining &nbsp',num2str(C),' metres = &nbsp',num2str(C),'m / &nbsp',num2str(round(V*10)/10),'m/s = &nbsp', num2str(round(U*10)/10),' seconds.</p>', ...
    '<p>Therefore total time = &nbsp',num2str(round(B*10)/10),' seconds.</p>',...
    '<br><p>The acceleration versus time graph for this race will look like this:</p><br><p></p><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;">',...
    '<br><p>The speed versus time graph is the integral of the acceleration versus time graph, and will look like this:</p><br><p></p><img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;">',...
    '<br><p>The distance versus time graph is the integral of the speed versus time graph, and will look like this:</p><br><p></p><img src="@@PLUGINFILE@@/image4.png" style="width:100%%; height:auto;">');

hint1 = strcat('<p>First of all calculate the initial constant acceleration, then use this to find the final velocity,',...
    ' then the time to cover the last &nbsp',num2str(C),' metres.</p>');

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
