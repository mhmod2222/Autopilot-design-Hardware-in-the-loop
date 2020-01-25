close,clear,clc;

global choice OC_ch uo vo wo po qo ro phio thetao epsaio deo dTo dao dro dT da dr desired_pitch
%----------FOXTROT - A twin engined, jet fighter/bomber aircraft
choice = 4;
OC_ch = 3;
% cruise initial conditions
uo = 345.2118852;   vo = 0;         wo = 9.642641063;
po = 0;             qo = 0;         ro = 0;
phio = 0;           thetao = 0.1;   epsaio = 0;
deo=0;              dTo=0;          dao=0;
dro=0;              dT=0;           da=0;               dr=0;

vector = [uo ; vo ; wo ; po ; qo ; ro ; phio ; thetao ; epsaio]; % initial state
desired_pitch = 0.2; % rad
a = 0;
b = 10;
n = 1000;
ya = vector;
[t,state] = rk4(@state_dot_fn2,a,b,ya,n); %propagating states through time using rk4
figure('Name','Pitch angle theta')
%plot(t,state(8,:)) %plotting pitch angle with time