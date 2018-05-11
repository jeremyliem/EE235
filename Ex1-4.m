% FILE: Ex1.m
% NAME: Jeremy Liem
% DESCRIPTION: Filtering

% Clear all variables and close all windows

clearvars;
close all;

%define t
Fs=10;
t = 0:1/Fs:500;
%create x
x = cos(0.1*t);

%Fourier Transform
N=8192;
x_fft = fftshift(fft(x,N));
x_abs = abs(x_fft);

w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

%Plot x vs t on 1st subplot and x_abs vs w on 2nd subplot
figure(1);
subplot(2,2,1);
plot(t,x);
xlim([100 400]);
ylim([-2 2]);
xlabel('t');
ylabel('x(t)');
title('x(t) vs t');

subplot(2,2,2);
plot(w,x_abs);
xlim([-0.5 0.5]);
xlabel('jw');
ylabel('X(jw)');
title('X(jw) vs jw');

%define H(jw)
H_fft = 3./(3+i*w);
H_abs = abs(H_fft);

%Plotting H(jw)
figure(2);
plot(w,H_abs);
xlim([-25 25]);
xlabel('w');
ylabel('|H(jw)|');
title('|H(jw)| vs w');

%find y_fft
y_fft=x_fft .* H_fft;

%convert back to t domain
y_ifft = ifft(fftshift(y_fft), N);
y = real(y_ifft);

%Compute t_y
t_y = (0:(N-1))*(1/Fs); 
%Plotting in 3rd subplot
figure(1);
subplot(2,2,3);
plot(t_y,y);
xlim([100 400]);
ylim([-2 2]);
xlabel('t');
ylabel('y(t)');
title('y(t) vs t [using IFFT]');

%compute using lsim function
b=[3];
a=[1 3];

y=lsim(b,a,x,t);
% Plot in fourth subplot
subplot(2,2,4);
plot(t,y);
xlim([100 400]);
ylim([-2 2]);
xlabel('t');
ylabel('y(t)');
title('y(t) vs t [using lsim]');
