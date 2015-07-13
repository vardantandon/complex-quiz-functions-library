%Calculations
period_1 = randi([1, 2]);
period_2 = randi([10, 15]);
amp_factor = randi([1, 3]);
xaxis_length = period_2 * randi([2, 4]) / 2;

amp_1 = 0.5 * amp_factor;
amp_2 = 2 * amp_factor;

t = 0:0.01:2*period_2;
y = amp_1 * sin(t * 2 * pi/period_1) + amp_2 * sin(t * 2 * pi/period_2);

%Plot generation

plotVar = plot(t, y);
hold on

plot([0,2*period_2],[0,0],'Color','black','linewidth',1);

axis([0 xaxis_length -(amp_1+amp_2) (amp_1+amp_2)]);
set(gca,'FontSize',20);
set(findall(gcf,'type','text'),'FontSize',30,'fontWeight','bold');    
axis on

grid(gca,'minor') 
set(gca,'MinorGridLineStyle','-')
grid on

clear title xlabel ylabel;

xlabel_string='t(seconds)';
ylabel_string='s(t)';
xlabel(xlabel_string);
ylabel(ylabel_string);


hold off;


%bar([1 10 7 8 2 2 9 3 6])
fig = gcf;
fig.PaperPositionMode = 'auto';
print('ScreenSizeFigure','-dpng','-r0')