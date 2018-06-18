%Program for Time Reversal property of DFT.
 clear all;
clc;

N=input('Sequence length=');
x1=input('enter the input seq=')
subplot(221);
stem(abs(x1));
title('Input Sequence');
c=zeros(N);

for k=1:N
    for n=1:N
        w=exp((-2*pi*i*(k-1)*(n-1))/N);
        x(n)=w;
    end
    c(k,:)=x;
end


X1=c*x1'%DFT of input sequence
subplot(222);
stem(abs(X1));
title('DFT of Input Sequence');



n = 0:N-1;
n= mod(-n,N);
X2=x1(n+1)
subplot(223);
stem(abs(X2));
title('Time reversal sequence');

X3=c*X2'

subplot(224);
stem(abs(X3));
title('DFT of Time Reversal sequence');