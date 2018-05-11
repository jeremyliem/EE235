% FILE: Ex4.m
% NAME: Jeremy Liem
% DESCRIPTION: Decoding a Morse Code Message.

clearvars;
close all;

load Ex4.mat;

figure;
%decoding b and a for filtering purposes
b=[2*10^9];
a=[240 3*10^4 2.2*10^6 10^8 2*10^9];

%for loop to decode each letter and graph it
for i=1:3
    c= cos(1000*i*t);
    z= y.*c;
    xr = lsim(b,a,z,t);
    subplot(3,1,i);
    plot(t,xr);
    xlabel('t');
    ylabel('xr(t)');
    title(['m',num2str(i),'(t)']);
end
