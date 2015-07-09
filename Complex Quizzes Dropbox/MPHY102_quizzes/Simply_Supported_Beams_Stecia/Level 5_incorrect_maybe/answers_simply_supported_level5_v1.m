%Known variables:
%R1 and R2: Reaction forces in left and right side respectively, located at
%x=0 and x=L
%L = total lenght of the beam
%W1 = total load for the UDL
%WR = lenght of the UDL
%P1 = position of the start of the UDL W1
%Pb = position of the equivalent pointed load of the UDL W1
%W = pointed load
%P= position of the pointed load

%===============
%Example to try the code:
L=60;
R1=104;
R2=46;
P1=10;
P=15;
W=50;
W1=100;
WR=20;
Pb=20;
%==================


UDL = W1/WR; % Value of the UDL in N/m

%Points of interest = PoI
PoI=[0,P1,P,P1+WR,L];

%Shear force values
SF(1)=R1;
SF(2)=R1;
SF(3)= SF(2) - UDL*(P-P1) -W;
SF(4)= -R2;
SF(5)=0;

%Location when SF=0, i.e. when the Bending Moment is at its maximum
Max_BM_position = -1;
SF_pre_drop = SF(3) - UDL*(P-P1);
if(SF(2)>0 && SF_pre_drop<=0)
    %check the position at which crosses using equation of the line
    % y=R1 - UDL*x
    Max_BM_position = P1+ R1/UDL;
    
elseif (SF_pre_drop>0 && SF(3)<=0)
    Max_BM_position =P;
elseif (SF(3)>0 && SF(4)<=0)
    %Check the position at which it crosses using equation of the line
    % y=SF(2) - UDL*x
    Max_BM_position = P+ SF(3)/UDL;
end

%Calculate the BM values at the points of interest
BM(1)=0;
BM(2)= abs(-R1*P1);
BM(3)= abs(-R1*P +UDL*(P-P1)*(P-P1)/2);
BM(4)= R2*(L-P1-WR);
BM(5)=0;

%Calculate the Maximum BM, i.e. at position "Max_BM_position"
Max_BM=-1;
if(P>=Max_BM_position)
    Max_BM = abs(-R1*Max_BM_position +UDL*(Max_BM_position-P1)*(Max_BM_position-P1)/2);
else
    Max_BM = abs(-R1*Max_BM_position +UDL*(Max_BM_position-P1)*(Max_BM_position-P1)/2 + W*(Max_BM_position -P));
end

%Done
%Need to be careful with the number of decimals used and the error derived
%by using approximation numbers
