file=fopen('Journey.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:50
    
ID=strcat(num2str(i));

IDString=strcat('Journey. Question ID #', ID);
        
    v1=randi([10,20]);
    t1=randi([5,15]);
    t2=randi([5,15]);
    t3=randi([5,15]);
    v2=randi([1,5])*-1;
    t4=randi([5,15]);

    ta=t1;
    tb=ta+t2;
    tc=tb+t3;
    td=tc+t4;
   
% To plot velocity versus time graph
figure(1)
plot([0,ta],[0,v1],'linewidth',3,'Color','red');
hold on
plot([ta,tb],[v1,v1],'linewidth',3,'Color','red');
plot([tb,tc],[v1,0],'linewidth',3,'Color','red');
plot([tc,td],[0,v2],'linewidth',3,'Color','red');
plot([0,td],[0,0],'linewidth',0.5,'Color','black');

%Axes and titles
axis tight
grid minor
grid on
title('Velocity Vs Time','FontSize',14, 'FontWeight','bold');
ylabel('Velocity (m/s)','Fontsize',12,'FontWeight','bold');
xlabel('Time (s)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString1= generateImageString(gcf, 'image1');


a1=v1/t1;
a2=0;
a3=-1*v1/t3;
a4=1*v2/t4;

% To plot acceleration versus time graph
figure(2)
plot([0,ta],[a1,a1],'linewidth',3,'Color','blue');
hold on
plot([ta,tb],[a2,a2],'linewidth',3,'Color','blue');
plot([tb,tc],[a3,a3],'linewidth',3,'Color','blue');
plot([tc,td],[a4,a4],'linewidth',3,'Color','blue');
plot([0,td],[0,0],'linewidth',0.5,'Color','black');
plot([ta,ta],[0,a1],'linewidth',3,'Color','blue');
plot([tb,tb],[a2,a3],'linewidth',3,'Color','blue');
plot([tc,tc],[a3,a4],'linewidth',3,'Color','blue');
%Axes and titles
axis tight
grid on
grid minor
title('Acceleration Vs Time','FontSize',14, 'FontWeight','bold');
ylabel('Acceleration (m/s^2)','Fontsize',12,'FontWeight','bold');
xlabel('Time (s)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString2 = generateImageString(gcf, 'image2');

% To plot distance versus time graph
figure(3)
X1=(0:0.01:ta);
Y1=a1*0.5*X1.^2;
X2=(ta:0.01:tb);
Y2=max(Y1)+((X2-ta)*v1);
X3=(tb:0.01:tc);
m1=a3;
c1=(v1)-(m1*tb);
A1=max(Y2)-(m1*0.5*tb.^2)-(c1*tb);
Y3=(m1*0.5*X3.^2)+(c1*X3)+A1;
X4=(tc:0.01:td);
m2=a4;
c2=-1*(m2*tc);
A2=max(Y3)-(m2*0.5*tc.^2)-(c2*tc);
Y4=(m2*0.5*X4.^2)+(c2*X4)+A2;
plot(X1,Y1,'linewidth',3,'Color','green');
hold on
plot(X2,Y2,'linewidth',3,'Color','green');
plot(X3,Y3,'linewidth',3,'Color','green');
plot(X4,Y4,'linewidth',3,'Color','green');

%Axes and titles
axis tight
grid on
grid minor
title('Displacement Vs Time','FontSize',14, 'FontWeight','bold');
ylabel('Displacement (m)','Fontsize',12,'FontWeight','bold');
xlabel('Time (s)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString3 = generateImageString(gcf, 'image3');

s1=max(Y1);
s2=max(Y2)-max(Y1);
s3=max(Y3)-max(Y2);
s4=min(Y4)-max(Y3);

numString1 = cloze_numerical((round(a1*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical((round(a2*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString3 = cloze_numerical((round(a3*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString4 = cloze_numerical((round(a4*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString5 = cloze_numerical((round(s1*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString6 = cloze_numerical((round(s2*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString7 = cloze_numerical((round(s3*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString8 = cloze_numerical((round(s4*10)/10), 0.05, 'Good job!', 'Incorrect, try again');
numString9 = cloze_mcq('drop', 4, 'A horizontal line', 'Incorrect','A vertical line', 'Incorrect','A line with a slope', 'Incorrect', 'A curve','Good Job!');
numString10= cloze_mcq('drop', 3, 'A horizontal line', 'Incorrect','A vertical line', 'Incorrect','A line with a slope', 'Good Job!', 'A curve','Incorrect');


questionString = strcat('<p>Starting at rest, a car accelerates at a constant rate for&nbsp',num2str(t1),' s, until it reaches a velocity of&nbsp',num2str(v1),' m/s.</p>',...
    '<p>It then maintains this velocity for&nbsp',num2str(t2),' s, before decelerating at a constant rate back to a standstill, over a period of&nbsp',num2str(t3),' s.</p>',...
    '<p>The car then immediately turns around, and accelerates at a constant rate in the opposite direction for&nbsp',num2str(t4),' s, until it reaches a velocity of&nbsp',num2str(v2),' m/s.</p>',...
    '<p>The velocity Vs time graph for the car''s journey is shown below.</p>',...
    '</p><br><p></p><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br>',...
    '<p><br></p><p>(Please give any numerical answers to the following questions to 1.d.p.)</p>',...
    '<p><b>1. </b>Between times t=0 s and t=',num2str(ta),' s, what is the car''s acceleration, $$a$$, and displacement, $$x$$?</p>',...
    '<p>$$a$$=&nbsp',numString1,' m/s<sup>2</sup>',...
    '<p>$$x$$=&nbsp',numString5,' m',...
    '<p>What is the shape of the displacement Vs time graph in this region?&nbsp',numString9,...
    '<p><b>2. </b>Between times t=',num2str(ta),' s and t=',num2str(tb),' s, what is the car''s acceleration, $$a$$, and displacement, $$x$$?</p>',...
    '<p>$$a$$=&nbsp',numString2,' m/s<sup>2</sup>',...
    '<p>$$x$$=&nbsp',numString6,' m',...
    '<p>What is the shape of the displacement Vs time graph in this region?&nbsp',numString10,...
    '<p><b>3. </b>Between times t=',num2str(tb),' s and t=',num2str(tc),' s, what is the car''s acceleration, $$a$$, and displacement, $$x$$?</p>',...
    '<p>$$a$$=&nbsp',numString3,' m/s<sup>2</sup>',...
    '<p>$$x$$=&nbsp',numString7,' m',...
    '<p>What is the shape of the displacement Vs time graph in this region?&nbsp',numString9,...
    '<p><b>4. </b>Between times t=',num2str(tc),' s and t=',num2str(td),' s, what is the car''s acceleration, $$a$$, and displacement, $$x$$?</p>',...
    '<p>$$a$$=&nbsp',numString4,' m/s<sup>2</sup>',...
    '<p>$$x$$=&nbsp',numString8,' m',...
    '<p>What is the shape of the displacement Vs time graph in this region?&nbsp',numString9,...
    '<p>(Question ID #',num2str(i),').</p>');


generalFeedbackStr = strcat('<p>Acceleration is the differential of velocity with respect to time.</p>',...
    '<p>Alternatively, acceleration can be considered to be the second differential of displacement with respect to time.</p>',...
    '<p>Therefore:</p>',...
    '<p>$$a=\\frac{dv}{dt}=\\frac{d^2x}{dt^2}$$</p>',...
    '<br><p><b>The acceleration at any given point on the car''s journey is simply the gradient of the velocity Vs time graph at that point, $$\\frac{dv}{dt}$$.</b></p>',...
    '<p>The acceleration Vs time graph for the car''s journey looks like this:</p>',...
    '<p><br></p><img src="@@PLUGINFILE@@/image2.png" style="width:100%%; height:auto;"><br>',...
    '<p><br></p><br><p>Velocity is the rate of change of displacement with respect to time.</p>',...
    '<p>Alternatively, velocity is the integral of acceleration with respect to time.</p>',...
    '<p>Therefore:</p>',...
    '<p>$$v=\\frac{dx}{dt}=\\int a.dt$$</p>',...
    '<p>The velocity Vs time graph for the car''s journey looks like this (as given in the question above):</p>',...
    '<p><br></p><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"><br>',...
    '<p><br></p><br><p>Displacement is the integral of velocity with respect to time.</p>',...
    '<p>Alternatively, displacement is the second integral of acceleration with respect to time.</p>',...
    '<p>Therefore:</p>',...
    '<p>$$x=\\int v.dt=\\int \\int a.dt$$</p>',...
    '<p><b>The displacement between $$t_1$$ and $$t_2$$ in the car''s journey is simply the area under the velocity Vs time graph for that region:</b></p>',...
    '<p>$$\\int _{t_1}^{t_2}v.dt$$</p>',...
    '<p>The displacement /Vs time graph for the car''s journey looks like this:</p>',...
    '<p><br></p><img src="@@PLUGINFILE@@/image3.png" style="width:100%%; height:auto;"><br>',...
    '<p><br></p><br><p><b>Remember that velocity, acceleration and displacement are all vector quantities, and therefore have both magnitude and direction.</b></p>');

hint1 = strcat('<b>HINT</b><p>Remember that velocity, acceleration and displacement are all vector quantities, and therefore have both magnitude and direction. Use the velocity Vs time graph given in the question to infer the reference system used in this question.</p><p>Remember also that acceleration is the <i>differential</i> of velocity with respect to time, and that displacement is the <i>integral</i> of velocity with respect to time.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        plotString1,...
        plotString1,...
        plotString2,...
        plotString3);
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);
