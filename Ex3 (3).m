%File: Ex3.m
%Name: Jeremy Liem
%Description: DECODING PHONE NUMBER FROM TOUCH-TONE SIGNALS
clearvars;
close all;

load phonenum.mat;

% create vector t
t_x = (0:length(x)-1)*(1/Fs);

%Plot the graph
figure;
subplot(1,1,1);
plot(t_x,x);
xlabel('x');
ylabel('t_x');
title('Signal X');

%Create row vector of zeros
phone_num = zeros(1,11);

% Using for-loop to extract tone signals
figure;
for i= 1:length(phone_num);
    start_index = (i-1)*0.5*Fs+1;
    end_index = i*0.5*Fs;
    signal = x(start_index:end_index);
    phone_num(i) = classify(signal,Fs);
    t_signal = [(start_index-1)/Fs:1/Fs:(end_index-1)/Fs];
    subplot(3,4,i);
    plot(t_signal,signal);
    str = [num2str(i), 'th Number =', num2str(phone_num(i))];
    title(str);
end

%display phone_num
phone_num
