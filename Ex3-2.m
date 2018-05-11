%File: Ex3.m
%Name: Hankoo Lee
%Description: Correlation and decoding signal

clearvars;
close all;

load CommsSignals.mat;

s1 = decode(x1,1,Fs,x0,x1)
s0 = decode(x0,1,Fs,x0,x1)