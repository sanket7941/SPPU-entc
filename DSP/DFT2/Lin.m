%Program for Linearity DFT Property

clear all;
clc;
N=input('Sequence length=');
x1=input('enter the first seq=');
x2=input('enter the second seq=');
a=input('enter first constant=');
b=input('enter second constant=');
c=zeros(N);
x3=a*x1; %first sequence multiplied with first constant
x4=b*x2; %second sequence multiplied with second constant
x5=x3+x4;

for k=1:N
    for n=1:N
        w=exp((-2*pi*i*(k-1)*(n-1))/N);
        x(n)=w;
       
    end
    c(k,:)=x;
end

r1=c*x1';%DFT of first sequence
r2=c*x2';%DFT of second sequence
R3=a*r1+b*r2;
R4=c*x5';

subplot(211);
stem(abs(R4));
title('DFT of {a*x1(n)+b*x2(n)}');
subplot(212);
stem(abs(R3));
title('DFT of {a*X1(K)+b*X2(K)}');

