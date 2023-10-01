clc; %Clears previous data from command window 
clear all; %Removes all variables from the current workspace
 
% Declaring function
syms i(t) 

% Assigning values to the variable
R = 50;     % Resistance
a = pi/3;   % Phase angle
L = 300e-3; % Inductance
f = 1000;    % Frequency
w = 2*pi*f; 
Vm = 100;   % Voltage

% Formula
p = dsolve(L*diff(i)+i/R==Vm*sin(w*t+a),i(0)==0)

% Plotting function
ezplot(p)
grid on

% Labeling plot 
xlabel('Time(sec)')
ylabel('Current(amp)')
title('Transient response')