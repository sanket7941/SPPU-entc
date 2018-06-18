%Program for circular freqency shift DFT Property

clear all;
clc;
N=input('Sequence length=');
x1=input('enter the seq=');
L=input('enter the value of shift = ');

c=zeros(N);

for k=1:N
    for n=1:N
        w=exp((-2*pi*i*(k-1)*(n-1))/N);
        x(n)=w;
    end
    c(k,:)=x;
end


r=c*x1'

subplot(211);
stem(abs(r));
title('Input sequence DFT');

for n=1:N
    w=exp((2*pi*j*(n-1)*(L))/N);
    x2(n)=w;
end


r1=x2.*x1;% shifted sequence multiplied with input sequence
r2=c*r1'% shifted sequence DFT
subplot(212);
stem(abs(r2));
title('shifted sequence DFT');
 