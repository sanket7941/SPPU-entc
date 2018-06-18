clc;close all;clear all;

fp = 800;
fst = 2400;
dp =1;           % these are digital specificatons given
ds= 20;
Fs = 8000;

wp = (800/8000)*2*pi; %digital form
wst= (2400/8000)*2*pi;%digital form

%Analog(Butterworth) to digital--converted through bilinear transformation
omegap = tan(wp/2); %analog form
omegast= tan(wst/2);%analog form



[N,wc] = buttord(omegap,omegast,dp,ds,'s');
[b,a] = butter(N,wc,'s'); %butter finding numerator and denominator coeffi

[ha,wa] = freqs(b,a);%s plane frequency response



ha = 20*log10(abs(ha));% db form

plot(wa,ha);

[bz,az] = bilinear(b,a,1);

%N

figure;
freqz(bz,az);% digital form frequency response


figure;
n = 0:99;
x = sin(2*pi*n*300/Fs) +sin(2*pi*n*3000/Fs);
y = filter(bz,az,x);

subplot(211)
plot(abs(fft(x)));
subplot(212)
plot(abs(fft(y)));

