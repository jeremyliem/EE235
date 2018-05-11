% FILE: Ex1.m
% NAME: Jeremy Liem
% DESCRIPTION: Time Scale Operation
% Clear all variables and close all windows
clearvars;
close all;

load train.mat;
t_y =(0:length(y)-1)*(1/Fs);
figure;

%Plotting normal train file
subplot(3,1,1);
plot(t_y,y)
xlim([0 4]);
ylim([-2 2]);
xlabel('t')
ylabel('y(t)')
title('Train sound')
%TimeScale it by 2!
[y1,t_y1]= timescale(y,Fs,2);
subplot(3,1,2);
plot(t_y1,y1); %plot y(2t)
xlim([0 4]);
ylim([-2 2]);
xlabel('t');
ylabel('y1(t)'); 
title('y(2t)');
%TimeScale it by 0.5!
[y2,t_y2]= timescale(y,Fs,0.5);
subplot(3,1,3);
plot(t_y2,y2); %plot y(0.5t)
xlim([0 4]);
ylim([-2 2]);
xlabel('t');
ylabel('y2(t)'); 
title('y(0.5t)');

% Sound all 3 signals with time pause of 4
sound(y,Fs)
pause(4)
sound(y1,Fs)
pause(4)
sound(y2,Fs)

