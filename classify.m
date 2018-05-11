%File: classify.m
%Name: Jeremy Liem
%Description: classify funciton

function[num] = classify(x,Fs)

TF =[941 1336;697 1209;697 1336;697 1477; 770 1209;770 1336; 770 1477; 852 1209; 852 1336; 852 1477];
%Find absolute value of x. 
N=4096;
X_fft=fftshift(fft(x,N));
X_abs=abs(X_fft);

w_period = 2*pi*Fs/N;
w = (-N/2:(N/2)-1)*w_period;
%Find index greater than 900 and find frequency)
index_tone = find(X_abs >900);
freq_tone = (w(index_tone)/(2*pi));
%Extract freq from 3 to 4.
pos_freq = freq_tone([3:4]);
%create zero vector
total_error = zeros(10,1);
%For loop for finding the total error.
for i=1:length(total_error);
    abs_error = abs(pos_freq-TF(i,:));
    total_error(i) = abs_error(1)+abs_error(2);    
end
%find minimum error and its index
[min_e,index_min_e] = min(total_error);
%compute num by subtracting 1;
num = index_min_e-1;
