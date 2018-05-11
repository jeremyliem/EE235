%File: Ex1.m
%Name: Jeremy Liem
%Description: Identifying Frequency Content of a Signal

clearvars;
close all;

% create vector t
Fs = 8000;
t = 0:(1/Fs):0.25-(1/Fs);

% Create signal vector d0
d0 = sin(2*pi*941*t) + sin(2*pi*1336*t);

sound (d0,Fs);
pause (1);
sound (d0, Fs);

%Plot the graph
figure;
subplot(2,1,1);
plot(t,d0);
xlabel('t');
ylabel('d0');
title('Signal d0');

% Create fft function
N = 4096;
D0_fft = fftshift(fft(d0,N));

% Compute magnitude of D0_fft
D0_abs = abs(D0_fft);

% Define frequency
w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;

%Plot the graph
subplot(2,1,2);
plot(w,D0_abs);
xlim([-9000 9000]);
ylim([0 1000]);
xlabel('w');
ylabel('D0_abs');
title('D0_abs vs. w');

% Identify the indices
index_tone0 = find(D0_abs > 900);
freq_tone0 = w(index_tone0)/(2*pi)
