clearvars;
close all;

%load data file
load CommsSignals.mat;

%convolution y1 and y0
y1 = (1/Fs) * conv(x1, x1);
y0 = (1/Fs) * conv(x1, x0);

t = (0:length(x1)-1)*(1/Fs);

y1_corr = y1(t(end) * Fs + 1)
y0_corr = y0(t(end) * Fs + 1)

%load noise file
load Noise.mat;

r = x1 + n;
t_r = (0:length(r)-1)*(1/Fs);

%Plot the graph
figure;
subplot(2,1,1);
plot(t_r,r);
xlim([0 2]);
xlabel('t');
ylabel('r(t)');
title('r(t) = x1(t) + n(t)');

%Using Convolution
yr1 = (1/Fs) * conv(r, x1);
yr0 = (1/Fs) * conv(r, x0);
t_yr = (0:length(yr1)-1)*(1/Fs);

%2nd subplot
subplot(2,1,2);
hold on;
plot(t_yr,yr1,'m');
plot(t_yr,yr0,'r');

xlabel('t');
ylabel('yr');
title('yr1 and yro graph');
legend('yr1','yr0');

%correlation
t_xr = (0:length(x1)-1)*(1/Fs);
yr1_corr = yr1(t_xr(end) * Fs + 1)
yr0_corr = yr0(t_xr(end) * Fs + 1)
