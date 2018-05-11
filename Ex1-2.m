%FILE: Ex1.m
%NAME: Hankoo Lee
%DESCRIPTION: Excersice 1

clearvars;
close all;

% create vector of ones called x1
Fs = 8000;
x1 = ones(1, 1*Fs +1); 
x0 = -x1;

%Using Convolution
y1 = (1/Fs) * conv(x1, x1);
y0 = (1/Fs) * conv(x1, x0);

%Corresponding time samples
t_y = (0:length(y1)-1)*(1/Fs);

%Plot the graph
figure;
subplot(2,1,1);
plot(t_y,y1);
xlabel('t');
ylabel('y1(t)');
title('y1(t)=x1(t)*x1(t)');

subplot(2,1,2);
plot(t_y,y0);
xlabel('t');
ylabel('y0(t)');
title('y0(t)=x1(t)*x0(t)');
