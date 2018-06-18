% Circular Time-Shifting Property of DFT 

clear all;
clc;

N=input('Sequence length=');
x1=input('enter the input seq=')
L=input('enter the amount of shift = ');

c=zeros(N);

for k=1:N
    for n=1:N
        w=exp((-2*pi*j*(k-1)*(n-1))/N);
        x(n)=w;
    end
    c(k,:)=x;
end


X1=c*x1' %DFT of input sequence


n = [0:N-1]; 
n = mod(n-L,N);%rem(n-L,N)+N if (n-L) is negetive then apply rem and showes value (N+n-L)
x2= x1(n+1)% Time shfted sequence by L samples


X2=c*x2' % DFT of Time shifted sequence
subplot(211);
stem(abs(X2));
title('DFT of Time shifted sequence=RHS ')

%LHS
for k=1:N
    w=exp((-2*pi*j*(k-1)*(L))/N);
    x3(k)=w;
end


X3=X1.*x3'
subplot(212);
stem(abs(X3));
title('DFT of time shifted sequence of =LSH')





