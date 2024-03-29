% Define Variables 
% radius of crack tip in micrometres
r=5;
% fracture stress of bone plate material in MPa
fs=300;
% nominal stress acting on bone plate in Mpa
n=randi([25,50]);
ns=4.2;
% To calculate catastrophic crack length in mm
af=(((fs/ns)-1)/2)^2*r/1000;
% initial crack length in mm
l=randi([1,30]);
ai=0.5;
% define constant C in pa^-2.m^-1
C=3*10^-16;
% define variable x = C.pi^2.nominalstress^2
x=C*((pi).^2)*((ns*10^6).^2);
% calculating number of steps to failure
N=(1/x)*((-1/(af/1000))-(-1/(ai/1000)));
% number of steps taken per day
s=1000;
% number of days to failure
D=N/s;
