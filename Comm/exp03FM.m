clc;%Clears previous data from command window 
clear all; %Removes all variables from the current workspace
fs = 1000; %Messege signal frequency
fc = 200;  %Carrier signal frequency
t = (0:1/fs:0.2)';
%Create two-tone sinusoidal signal with frequencies 30 and 60 Hz.

x = sin(2*pi*30*t)+2*sin(2*pi*60*t);
%Set the frequency deviation to 50 Hz.

fDev = 50;
%Frequency modulate x.
y = fmmod(x,fc,fs,fDev);
%Demodulate z.
z = fmdemod(y,fc,fs,fDev);
%Plot the original and demodulated signals.
plot(t,y,t,z);
xlabel('Time (s)')
ylabel('Amplitude')
legend('Modulated Signal','Demodulated Signal')