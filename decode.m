%File: decode.m
%Name: Hankoo Lee
%Description: Decode function

function[s]= decode(x,d,Fs,x0,x1)
%compute convolution for y0 and correlation for y0.
y0 = (1/Fs) * conv(x,x0);
y0_corr = y0(d*Fs+1); 
%compute convolution for y1 and correlation for y1.
y1 = (1/Fs)*conv(x,x1);
y1_corr = y1(d*Fs+1);
%if else statement.
if y1_corr>y0_corr
    s=1;
else
    s=0;
end