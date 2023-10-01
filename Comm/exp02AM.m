clc;%Clears previous data from command window 
clear all; %Removes all variables from the current workspace
m = input('Modulation Index = '); %Modulation index ranginf from 0 to 1
Am = 5; %Amplitude of the modulating signal
f = 2000; %Frequency
T = 1/f; %Time period of modulating signal
t = 0: T: .2;
fa = 20; %message frequency
ym = Am*sin(2*pi*fa*t);
%ploting modulating signal
subplot(3,1,1)
plot(t,ym)
title('Modulating signal')

%carrier signal
Ac = Am/m; %Carrier Amplitude
fc = fa*10; %Carrier frequency
Tc = 1/fc; %Time period of carrier signal
yc = Ac*sin(2*pi*fc*t);
%ploting carrier signal
subplot(3,1,2)
plot(t,yc)
title('Carrier Signal');

%AM modulation
y = Ac+(1+m*sin(2*pi*fa*t)).*sin(2*pi*fc*t);
%ploting amplitude modulated signal
subplot(3,1,3)
plot(t,y)
title('Amplitude Modulated Signal')
