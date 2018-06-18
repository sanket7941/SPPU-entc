clear all;
clc;
close all;

a=input('enter value of a=');

L=1;
for w=0:0.1:pi
  H(L)=(1/(1-a*exp(-j*w)));
  L=L+1;
end
subplot(521);
stem(abs(H));
title('Magnitude of 1/1-az-1');
subplot(522);
stem(angle(H));
title('Phase of 1/1-az-1');

N=20;
L=1;
for w2=0:0.1:pi
    h(L)=0;
    for n=0:N
        h(L)= h(L)+((1/2)^n)*(exp(-j*w2*n));
    end
    H1(L)=h(L);
    L=L+1;
end

subplot(523);
stem(abs(H1));
title('Magnitude of summation of (1/2)^n Z^-n');

subplot(524);
stem(angle(H1));
title('Phase of summation of (1/2)^n Z^-n');

syms z n 
z1=ztrans(a^n);
m=1;
for w1=0:0.1:pi
    Z(m)=subs(z1,exp(j*w1));
    m=m+1;
end    

subplot(525);
stem(abs(Z));
title('Magnitude of ztransform using ztrans function');
subplot(526);
stem(angle(Z));
title('Phase of ztransform using ztrans function');

I=iztrans(z1);
p=1;
for n=0:N
    Z1(p)=subs(I,n);
    p=p+1;
end    
subplot(527);
stem(abs(Z1));
title('Magnitude of Inverse ztransform using iztrans function');

subplot(528);
stem(angle(Z1));
title('Magnitude of Inverse ztransform using iztrans function');


% long division methode inverse z transform
num=[1 0 0];        % refer page 319 of Mitra for example 
den=[1 -.5 ]; %increase zeros in num and see result , decrease zeros and see
[q1,r1]= deconv(num,den); %in first case quotient will be as per ans in second remainder can be 

%Partial fraction methode inverse Z transform
d=[1 0]; e=[1 -.5];   %e matrix is coeff of y  d for x  give increasing powers of z-1
[r p c]=residue(d,e);

for i =1:5
    seq(i)=c+(r(1)*(p(1)^(i-1)));
end

%plot poles and zeros
b=input('enter numerator coefficients =');
c=input('enter denominator coefficients =');
subplot(529);
zplane(b,c);

