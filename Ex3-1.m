%FILE: Ex3.m
%NAME: Hankoo Lee/Jeremy Liem
%DESCRIPTION: Audio File Realignment

clearvars;
close all;

load s1.mat; %load data file s3.mat

%Create h1
h1 = zeros(4*Fs + 1,1);
h1(1*Fs + 1) = 1;
t_h1 = (0:length(h1)-1)*(1/Fs);

%Convolution
y1 = conv(x1,h1);
t_y1 = (0:length(y1)-1)*(1/Fs);


%Create h2
h2 = zeros (4*Fs +1,1);
h2(1)=10;
t_h2 = (0:length(h2)-1)*(1/Fs);


%Convolution
y2 = conv(x2,h2);
t_y2 = (0:length(y2)-1)*(1/Fs);


%Create h3
h3 = zeros (4*Fs +1,1);
h3(2*Fs+1)= 1;
t_h3 = (0:length(h3)-1)*(1/Fs);

%Convolution
y3 = conv(x3,h3);
t_y3 = (0:length(y3)-1)*(1/Fs);

% Recover signal y
if length(y1)>length(y2) && length(y1)>length(y3)
    z2 = zeros(length(y1)-length(y2),1);
    y2 = [y2;z2];
    z3 = zeros(length(y1)-length(y3),1);
    y3 = [y3;z3];
    
elseif length(y2)>length(y1) && length(y2)>length(y3)
    z1 = zeros(length(y2)-length(y1),1);
    y1 = [y1;z1];
    z3 = zeros(length(y2)-length(y3),1);
    y3 = [y3;z3];

elseif length(y3)>length(y1) && length(y3)>length(y2)
    z1 = zeros(length(y3)-length(y1),1);
    y1 = [y1;z1];
    z2 = zeros(length(y3)-length(y2),1);
    y2 = [y2;z2];

end

% Add three signals to produce y
y = y1+y2+y3
t_y = (0:length(y)-1)*(1/Fs);


%Plot the graph
figure;
subplot(1,1,1);
plot(t_y,y);
xlim([0 5]);
ylim([-2 2]);
xlabel('t');
ylabel('y(t)');
title('Recovered Audio File');

sound(y, Fs);