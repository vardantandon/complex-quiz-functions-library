%Drawing Shear force diagrama
h=0.01;
x=[0:h:1,1:h:5,5:h:6,6:h:7];

for i=1:1:length(x)
    if x(i)<1
        SF(i)=500;
    elseif x(i)>=1 & x(i)<5
        SF(i) = 600-100*x(i);
    elseif x(i)>=5 & x(i)<6
        SF(i)=100;
    elseif x(i)>=6
        SF(i) = 0;
    end
end

figure(1)
plot(x,SF)
title('Shear Force Diagram','LineWidth',2);
xlabel('x(m)');
ylabel('SF (N)');

%Drawing Bending Moment Diagrama
for i=1:1:length(x)
    if x(i)<1
        BM(i)=-1800+500*x(i);
    elseif x(i)>=1 & x(i)<5
        BM(i) = -50*x(i)*x(i)+600*x(i)-1850;
    elseif x(i)>=5 & x(i)<6
        BM(i)=100*x(i)-600;
    elseif x(i)>=6
        BM(i) = 0;
    end
end

figure(2)
plot(x,BM,'LineWidth',2)
title('Bending Moment Diagram');
xlabel('x(m)');
ylabel('BM (N.m)');
