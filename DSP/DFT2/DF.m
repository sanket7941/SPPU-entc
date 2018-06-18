
clear all;
clc;

N=input('Sequence length is=');
x1=input('Enter the sequence=');

c= zeros(N);

for k=1:N
     for n=1:N
         w=exp((-2*pi*j*(k-1)*(n-1))/N);
         x(n)=w;
     end
     c(k,:)=x;
end
 
 
r=c*x1'
 
stem(abs(r));
title('DFT of input sequence')
