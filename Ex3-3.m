% FILE: Ex3.m
% NAME: Jeremy Liem
% DESCRIPTION: Amplitude Demodulation

% Clear all variables and close all windows

clearvars;
close all;

load Ex3.mat;
z= y.*cos(500*t);

%Fourier Transform
N=8192;
z_abs = abs(fftshift(fft(z,N)));

w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

%Plot z(t) vs t and z_abs vs w.
figure(1);
subplot(2,1,1);
plot(t,z);

subplot(2,1,2);
plot(w,z_abs);
xlim([-1500 1500]);
ylim([0 10000]);

%Apply Filtering
b=[2*10^9];
a=[240 3*10^4 2.2*10^6 10^8 2*10^9];

xr=lsim(b,a,z,t);
%Fourier Transform
N=8192;
xr_abs = abs(fftshift(fft(xr,N)));

%Plot xr vs t and xr_abs vs w
figure(2);
subplot(2,1,1);
plot(t,xr);

subplot(2,1,2);
plot(w,xr_abs);
xlim([-1000 1000]);
ylim([0 10000]);


