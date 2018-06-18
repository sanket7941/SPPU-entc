%Program for Circular convolution for 4 point sequence & Linear Convolution & 8 point sequence(Zero padding)showing alising effect Property

clear all;
clc;
N=input('Sequence length=');
x1=input('enter the first seq=');
x2=input('enter the second seq=');

subplot(321);
stem(abs(x1));
title('Input first sequence');

subplot(322);
stem(abs(x2));
title('Input second sequence')


for m=1:N
    C(m)=0;
    for n=1:N
        i=m-n+1;
        if(i<=0)
            i=N+i;
        end
            C(m)=C(m)+x1(n)*x2(i);
    end
end

subplot(323);
stem(abs(C));
title('Circular convolution');

n1=length(x1);
n2=length(x2);

N=n1+n2-1;
L=[zeros(1,N)];

for i=1:n1
    for k=1:n2
        a(i,k)=x1(k)*x2(i);
        L(i+k-1)=L(i+k-1)+a(i,k);
    end
end


subplot(324);
stem(abs(L));
title('Linear convolution');

x3=[x1 zeros(1,N-n1)];
x4=[x2 zeros(1,N-n2)];

for m=1:N
    RC(m)=0;
    for n=1:N
        i=m-n+1;
        if(i<=0)
            i=N+i;
        end
            RC(m)=RC(m)+x3(n)*x4(i);
    end
end
subplot(325);
stem(abs(RC));
title('Reconvolution-apending zeros to input sequence')