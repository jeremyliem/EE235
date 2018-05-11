%File: Ex2.m
%Name: Jeremy Liem
%Description: Classifying Touch-Tone Telephone Signals

clearvars;
close all;
%Create time sample from 0 to 0.25(exclusive).
Fs=8000;
t = 0:(1/Fs):0.25-(1/Fs);
% Create d4,d5,d8,d9
d4=sin(2*pi*770*t)+sin(2*pi*1209*t);
d5=sin(2*pi*770*t)+sin(2*pi*1336*t);
d8=sin(2*pi*852*t)+sin(2*pi*1336*t);
d9=sin(2*pi*852*t)+sin(2*pi*1477*t);
%call function classify for each d4 d5 d8 d9
num=classify(d4,Fs)
num1=classify(d5,Fs)
num2=classify(d8,Fs)
num3=classify(d9,Fs)

%test what happen if d4 has extra zeros
z = zeros(1, 0.25*Fs + 1);
d4_z=[d4 ;z];
num4 =classify(d4_z,Fs)
