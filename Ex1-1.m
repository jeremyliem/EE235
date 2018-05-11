%FILE: Ex1.m
%NAME: Jeremy Liem/ Hankoo Lee
%DESCRIPTION: Implementing a Unit Impulse in Matlab
% Clear all variables and Close all Windows.
clearvars;
close all;

%Create d1 with Fs=8000.
Fs = 8000;
d1 = zeros(5*Fs +1,1);
d1(1)= 1;

%Create time vector of length d1.
t = (0:length(d1)-1)*(1/Fs);

%Create d2
d2 = zeros (5*Fs +1,1);
d2(3*Fs +1)=1;

%Create d3
d3 = zeros (5*Fs +1,1);
d3(4*Fs+1)= 2;

%Graphing and using hold on to plot multiple graphs
%in on figure
figure;
hold on;
%plot everything d1,d2,d3 in 1 graph.
%d1 is in blue,d2 is in red and d3 is in magenta
%limit of x is from -1 to 6
%limit of y is from 0 to 3
%legend is showplot(t,d1,'b');
plot(t,d1,'b');
plot(t,d2,'r');
plot(t,d3,'m');
xlim([-1 6]);
ylim([0 3]);
xlabel('t');
ylabel('d(t)')
title('Graph of d(t), d(t-3) and 2d(t-4)');
legend('d(t)','d(t-3)','2d(t-4)');
