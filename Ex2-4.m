% FILE: Ex2.m
% NAME: Jeremy Liem
% DESCRIPTION: Amplitude Modulation

% Clear all variables and close all windows

clearvars;
close all;

%load Morse Code file
load MorseCode.mat;

t_morse=(0:length(dash)-1)*(1/Fs);

%Plot dash vs t and dot vs t
figure(1);
subplot(2,1,1);
plot(t_morse,dash);
ylim([-40 40]);
xlabel('t');
ylabel('dash');
title('dash vs t');

subplot(2,1,2);
plot(t_morse,dot);
ylim([-40 40]);
xlabel('t');
ylabel('dot');
title('dot vs t');

%compute X in morse code and dash
x=[dash,dot dot,dash];
t= (0:length(x)-1)*(1/Fs);

%Fourier Transform
N=8192;
x_fft = abs(fftshift(fft(x,N)));

w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

%Plot x(t) vs t and x_fft vs t.
figure(2);
subplot(2,1,1);
plot(t,x);
xlabel('t');
ylabel('x(t)');
title('Letter X')

subplot(2,1,2);
plot(w,x_fft);
xlim([-1000 1000]);
xlabel('w');
ylabel('X(jw)');
title('Letter X in freq domain');

%Amplitude Modulation
y = x.*cos(500*t);

%Fourier Transform
N=8192;
y_fft = abs(fftshift(fft(y,N)));

%Plot y(t) vs t and plot y_fft vs w
figure(3);
subplot(2,1,1);
plot(t,y);
xlabel('t');
ylabel('y(t)');
title('y(t) vs t');

subplot(2,1,2);
plot(w,y_fft);
xlim([-1000 1000]);
ylim([0 10000]);
xlabel('w');
ylabel('Y(jw)');
title('Y(jw) vs w');