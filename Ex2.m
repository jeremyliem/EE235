% FILE: Ex2.m
% NAME: Jeremy Liem
% DESCRIPTION: Time Shift Operation
% Clear all variables and close all windows

clearvars;
close all;
%Start the exercise.
load train.mat;
t_y =(0:length(y)-1)*(1/Fs);
figure;
%Plotting normal train file
subplot(3,1,1);
plot(t_y,y)%Plot normal sound files
xlim([0 5]);
xlabel('t')
ylabel('y(t)')
title('Train sound')
%Time shift by 3.
[y1,t_y1]= timeshift(y,Fs,3);
subplot(3,1,2);
plot(t_y1,y1); %plot y(t-3)
xlim([0 5]);
xlabel('t');
ylabel('y(t)'); 
title('y(t-3)');
%Time shift by -.0.5
[y2,t_y2]= timeshift(y,Fs,-0.5);
subplot(3,1,3);
plot(t_y2,y2); %plot y(t+0.5)
xlim([0 5]);
xlabel('t');
ylabel('y(t)'); 
title('y(t+0.5)');
%Playing the sound files with 5 second pause between each call
sound(y,Fs)
pause(5)
sound(y1,Fs)
pause(5)
sound(y2,Fs)
