%FILE: Ex2.m
%NAME: Jeremy Liem/ Hankoo Lee
%DESCRIPTION: Revisiting Time Delay Transformation

clearvars;
close all;

load train.mat; %load data file train.mat

x = y;
t_x=(0:length(x)-1)*(1/Fs);

%Create h1
h1 = zeros(4*Fs + 1,1);
h1(1*Fs +1)= 1;
t_h1 = (0:length(h1)-1)*(1/Fs);

%Convolution
y1 = conv(x,h1);
t_y1 = (0:length(y1)-1)*(1/Fs);


%Plot the graph
figure;
subplot(3,1,1);
plot(t_x,x);
xlim([0 6]);
ylim([-2 2]);
xlabel('t');
ylabel('x(t)');
title('Train sound file');

subplot(3,1,2);
plot(t_h1,h1);
xlim([0 6]);
ylim([-2 2]);
xlabel('t');
ylabel('h1(t)');
title('h1(t) graph');

subplot(3,1,3);
plot(t_y1,y1);
xlim([0 6]);
ylim([-2 2]);
xlabel('t');
ylabel('y1(t)');
title('y1(t) graph');

%Create h2
h2 = zeros(4*Fs + 1,1);
h2(3*Fs +1)= 1;
t_h2 = (0:length(h2)-1)*(1/Fs);

%Convolution
y2 = conv(x,h2);
t_y2 = (0:length(y2)-1)*(1/Fs);

%Plot the graph
figure;
subplot(3,1,1);
plot(t_x,x);
xlim([0 6]);
ylim([-2 2]);
xlabel('t');
ylabel('x(t)');
title('Train sound file');

subplot(3,1,2);
plot(t_h2,h2);
xlim([0 6]);
ylim([-2 2]);
xlabel('t');
ylabel('h1(t)');
title('h1(t) graph');

subplot(3,1,3);
plot(t_y2,y2);
xlim([0 6]);
ylim([-2 2]);
xlabel('t');
ylabel('y2(t)');
title('y2(t) graph');
