% FILE: Ex3.m
% NAME: Jeremy Liem/Hankoo Lee
% DESCRIPTION: Recover Audio/TV File
% Clear all variables and close all windows

clearvars;
close all;

%Start the exercise.
load s6.mat;
t_y =(0:length(y)-1)*(1/Fs);
figure;

subplot(2,1,1);
plot(t_y,y); %plot the distorted sound graph
xlabel('t');
ylabel('y(t)');
title('Distorted Audio File');
%Doing y(t)=x(2t-0.5)
[y1,t1]= timescale(y,Fs,0.5);
[y2,t2]= timeshift(y1,Fs,-0.5);
%Doing y(t)=x(0.5t-2)
[y3,t3]= timescale(y,Fs,2);
[y4,t4]= timeshift(y,Fs,-2);

%plot the correct output
subplot(2,1,2);
plot(t2,y2);
xlabel('t');
ylabel('x(t)');
title('Star Wars Rogue One (recovered)');

%Play the sounds with 3 second pause
sound(y,Fs);
pause(3);
sound(y2,Fs);

