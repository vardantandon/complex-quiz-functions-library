file=fopen('YM-Question.xml','w'); 
fprintf(file, quiz_start()); %xml initialization code

for i=1:1:100
    
ID=strcat(num2str(i));

IDString=strcat('YM. Question ID #', ID);

% Define Variables 
% length of rod in cm
l=randi([4,20]);
% radius of rod in mm
r=randi([1,10]);
% tensile load in kN
tl=randi([1,5]);
% displacement in mm
d=randi([1,3]);
% calculate stress in MPa
stress=(tl*1000/((pi)*(r/1000).^2))/1000000;
stress=(round(stress*10)/10);
area1=(pi)*((r/1000).^2);
% to calculate strain
strain=(d/1000)/(l/100);
strain=(round(strain*1000)/1000);
% to calculate YM in MPa
YoungM=round(stress/strain);
% yield point
x=randi([4,8])/100;
y=randi([1,3])/100; 
% coefficients
a=randi([7,13])*1000;
b=randi([1,10])*10;
c=(a*y)-(b*log(y)); 
f=log(c+(b*log(x))+1)/x;
% strain x-axis


% To plot stress versus strain graph
figure(1)
plot([0,y],[0,a*y],'linewidth',3,'Color','red');
hold on
x1=y:0.001:x;
y1=c+(b*log(x1));
plot(x1,y1,'linewidth',3,'Color','red');
x2=0:0.001:x;
y2=(exp(f*x2))-1;
plot(x2,y2,'linewidth',3,'Color','red');
plot([y,y],[0,a*y],'linestyle','--','color','black')
plot([0,y],[a*y,a*y],'linestyle','--','color','black')
text(y,(a*y),'Y','fontsize',20,'fontweight','bold')
%Axes and titles
axis tight
grid on
title('Loading/Unloading Cycle','FontSize',14, 'FontWeight','bold');
ylabel('Stress (N/m^2)','Fontsize',12,'FontWeight','bold');
xlabel('Strain (-)','Fontsize',12,'FontWeight','bold');
hold off
%Plot string generation
plotString1= generateImageString(gcf, 'image1');

% calculations
% part d
ansd=a*y*y*0.5;
ansd=round(ansd*100)/100;
% part e
c=round(c*100)/100;
integral1=y*((b*log(y))-b+c);
integral2=x*((b*log(x))-b+c);
anse=integral2-integral1;
anse=round(anse*100)/100;
% part f
f=round(f);
integral3=(1/f);
integral4=(exp(f*x)/f)-x;
integral5=integral4-integral3;
area=ansd+anse-integral5;
ansf=area*0.6;
ansf=round(ansf*100)/100;

% embed answers

numString1 = cloze_numerical(stress, 0.05, 'Good job!', 'Incorrect, try again');
numString2 = cloze_numerical(strain, 0.0005, 'Good job!', 'Incorrect, try again');
numString3 = cloze_numerical(YoungM, 0.5, 'Good job!', 'Incorrect, try again');
numString4 = cloze_numerical((round(ansd*100)/100), 0.005, 'Good job!', 'Incorrect, try again');
numString5 = cloze_numerical((round(anse*100)/100), 0.005, 'Good job!', 'Incorrect, try again');
numString6 = cloze_numerical((round(ansf*100)/100), 0.02*ansf, 'Good job!', 'Incorrect, try again');

questionString = strcat('<p>A rod of length&nbsp',num2str(l/100),' m and radius&nbsp',num2str(r/1000),' m, is subjected to a tensile load of&nbsp',num2str(tl*1000),' N, ',...
    ' at which it elongates a total of&nbsp',num2str(d/1000),' m.</p>',...
    '<p>Assuming that the yield stress has not been reached, calculate the following (giving your answers in the specified units and with the specified accuracy):</p>',...    
    '<p>(NB - Please carry through any rounded values to subsequent calcualtions if necessary)</p>',...
    '<p>a) The stress the rod experiences (to 1.d.p):</p>',...
    '<p>Stress:&nbsp',numString1,'MPa</p>',...
    '<p>b) The strain the rod experiences (to 3.d.p):</p>',...
    '<p>Strain:&nbsp',numString2,'</p>',...
    '<p>c) The Young''s Modulus in the elastic region (to the nearest whole number):</p>',...
    '<p>E:&nbsp',numString3,'MPa</p>',...
    '<p><br></p><p>A different material has a characteristic hysteresis from its loading/unloading cycle as shown in the figure below.</p>',...
    '<p><img src="@@PLUGINFILE@@/image1.png" style="width:100%%; height:auto;"></p>',...
    '<p>The curve is defined by the following functions:</p>',...
    '<br><p>$$\\small\\sigma =',num2str(a),'\\epsilon$$ in the elastic region under loading.</p>',...
    '<br><p>$$\\small\\sigma =',num2str(c),'+',num2str(b),'ln\\left(\\epsilon \\right)$$ in the plastic region under loading.</p>',...
    '<br><p>$$\\small\\sigma =e^{',num2str(f),'\\epsilon }-1$$ when the material is unloaded.</p>',...
    '<br><p>Where $$\\small\\sigma$$ and $$\\small\\epsilon$$ are the stress and strain experienced by the material, respectively. Y is the Yield Point of the material.<p>',...
    '<br><p>Calculate the following, being careful to give your answers in the specified units and to the specified level of accuracy:</p>',...
    '<br><p>d) Calculate the work needed per unit volume to extend the sample up to the Yield Point from its unstrained position (to 2.d.p.):</p>',...
    '<p>W1:&nbsp',numString4,'N/m<sup>2</sup></p>',...
    '<br><p>e) Calculate the work needed per unit volume to extend the sample from the Yield Point to a strain of&nbsp',num2str(x),' (to 2.d,p):</p>',...
    '<p>W2:&nbsp',numString5,'N/m<sup>2</sup></p>',...
    '<br><p>f) Calculate the energy lost in creating plastic deformation in one complete hysteresis loop when the material is subjected to a strain of&nbsp',num2str(x),', ',...
    ' if the sample is a rectangular cross-section bar of initial dimensions 0.03 x 0.01 x 0.002 m (to 2.d.p, giving your answer in millijoules.).</p>',...
    '<p>Energy Lost:&nbsp',numString6,'mJ</p>',...
    '<br><p>(Question ID #',num2str(i),').</p>');


generalFeedbackStr = strcat('<p>For the first three parts of the questions, you simply need to apply the following equations:</p>',...
        '<p>Stress = Force/Area = $$\\sigma \\:=\\frac{F}{A}$$ =&nbsp',num2str(tl*1000),'N/',num2str(area1),'m<sup>2</sup> =&nbsp',num2str(stress),' MPa.</p>',...
        '<p>Strain = Extension/Original Length = $$\\epsilon =\\frac{x}{L}$$ =&nbsp',num2str(d/1000),'m/',num2str(l/100),'m =&nbsp',num2str(strain),'.</p>',...
        '<p>Young''s Modulus = Stress/Strain = $$\\frac{\\sigma }{\\epsilon }$$ =&nbsp',num2str(stress),'MPa/',num2str(strain),' =&nbsp',num2str(YoungM),'MPa.</p>',...
        '<br><p>For the last three parts of the question you need to integrate the various parts of the Stress Vs Strain curve.</p>',...
        '<p>Remember that the area under the Stress Vs Strain curve will give the energy to reach a particular strain (per unit volume of unstrained material).</p>',...
        '<p>Therefore:</p>',...
        '<p>W1 = $$\\int _{0}^{',num2str(y),'}\\:',num2str(a),'\\epsilon.d\\epsilon$$</p><p>and,</p>',...
        '<p>W2 = $$\\int _{',num2str(y),'}^{',num2str(x),'}\\:',num2str(c),'+',num2str(b),'ln\\left(\\epsilon \\right).d\\epsilon$$</p>',...
        '<br><p>For the last part of the question, you will need to calculate:</p>',...
        '<p>$$\\:\\int _{0}^{',num2str(x),'}\\:e^{88\\epsilon }-1.d\\epsilon$$</p>',...
        '<p>And then subtract W1 and W2 from this value. This will give you the area of the hysteresis loop, i.e. the energy cost in N/m<sup>2</sup> of the plastic deformation that occurs.</p>',...
        '<p>You will then need to multiply this by the volume of the sample to calculate the energy lost in this sample in Nm (remember 1 Joule = 1 Nm).</p>');

  
hint1 = strcat('<p><b>HINT</b></p><p>Look through your notes to recall the definitions of stress, strain and Young''s Modulus.</p><p>Also recall that the area under the Stress Vs Strain curve up to a given point tells you how much work you had to do (per unit unstrained volume of material) to reach there.</p>');

    %Complete question XML code generation
    xmlCode = question_cloze(i, ...
        IDString, ... 
        questionString, ...
        generalFeedbackStr, ...
        hint1,...
        '',...
        plotString1,...
        '',...
        '',...
        '');
    
    %Output
    fprintf(file, xmlCode);
    
end
fprintf(file, quiz_end()); %xml closing code
fclose(file);



