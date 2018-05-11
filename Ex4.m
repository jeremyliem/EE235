%File: Ex4.m
%Name: Hankoo Lee
%Description: Deciphering Received Message in Digital Communication System

clearvars;
close all;

load CommsSignals.mat;

load Ex4.mat;

t_r = (0:length(r)-1)*(1/Fs);

%Plot the graph
figure;
plot(t_r,r);
xlabel('t');
ylabel('r(t)');
title('Ex4.mat Signal');

% Matrix and row vector
rm_rows = size(rm,1);
message_bits = zeros(1,rm_rows);

% Matlab for loop
for i = 1:rm_rows
    signal = rm(i,:);
    symbol = decode(signal,1,Fs,x0,x1);
    message_bits(i)= symbol;
    
end

% Display the values of message_bits
message_bits
    


