clear all;
clc;

f1=input('enter 1st freqency=');
f2=input('enter 2nd freqency=');
fs=input('enter sampled freqency=');
a=input('enter amplitude=');


%plot sign wave
t=0:0.009:2;%sampled frequency is 1/0.009=111.111
for(i=1:length(t))
    x1(i)=a*sin(2*pi*f1*t(i));
    x2(i)=a*sin(2*pi*f2*t(i));
end
subplot(321);
plot(t,x1);
subplot(322);
plot(t,x2);

N=30;
n=1:N;

for(i=1:length(n))
    x3(i)=a*sin(2*pi*f1/fs*n(i));
    x4(i)=a*sin(2*pi*f2/fs*n(i));
end
subplot(323);
stem(n,x3);
subplot(324);
stem(n,x4);

%to find fft for differentiate alising
x5=fft(x3);
subplot(325);
stem(n,x5);
x6=fft(x4);
subplot(326);
stem(n,x6);




