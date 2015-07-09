xUTS = 0.03;
delta = 0.0001;
x3=0:delta:xUTS;
figure(1)

% y=50.8625*exp(100*x.^3)-1;
% plot(x,y);

% A=51/exp(100*(0.03^3))
% 
% figure(1)
% y=exp(100*x.^3);
% plot(x,y);
% 
% figure(2)
% y=exp(100*x.^2);
% plot(x,y);
% 
% 
% figure(3)
% y=exp(100*x);
% plot(x,y);
% 
% figure(4)
% y=exp(100*x.^0.9);
% plot(x,y);

close all
figure(5)
y3=exp(140*x3)-1;
plot(x3,y3,'LineWidth',2);

hold
x1=0:delta:0.01;
y1=4000*x1;
plot(x1,y1,'LineWidth',2);


x2=0.01:delta:0.03;
% y2=100-39.602*exp(90*x2);
%y2=37500*x2.^2-36.25;

y2=178.16+30*log(x2);
plot(x2,y2,'LineWidth',2)

title('Hysteresis from Loading/Unloading Cycle on a given material');
xlabel('Strain (-)');
ylabel('Stress (N/cm^2)');

%plot(x,44.4+100*(log(x)+600))