clear all;
clc;
close all;

w = 0:.1:2*pi;
l = length(w);



a=input('enter value of a=');

for i =1:l
    b(i)=a^(i-1);
end

r=a+.2;
for i =1:l
    p(i)=r^(-(i-1));
end

p1=(b.*p);
w = 0:.1:2*pi;

for i=1:l
  H(i)=p1(i).*(exp(-j*w(i)*i));
 
end

w = 2*pi;
for i=1:l
  H2(i)=p1(i).*(exp(-j*w*i));
 
end
px=(sum(H2));


syms z n 
z1=ztrans(a^n);

I=iztrans(z1);


num=[1   0 0 0 0 0 0 0 0 ]        % refer page 319 of Mitra for example 
den=[1,-1.5 .5 ]; %increase zeros in num and see result , decrease zeros and see
[q1,r1]= deconv(num,den); %in first case quotient will be as per ans in second remainder can be 
                                          %verified
                                          
                                          
 b=[1 0 0]; a=[1 -1.5 .5];   %a matrix is coeff of y  b for x  give increasing powers of z-1
[r p c]=residuez(b,a);


for i =1:5
    seq(i)=c+(r(1)*(p(1)^(i-1)))+(r(2)*(p(2)^(i-1)));
end


b=input('enter numerator coefficients =');
c=input('enter denominator coefficients =');
zplane(b,c);

w=-pi:.01:pi;
for i =1:length(w)
    x1(i) = 1+(exp(-j*w(i)));   %lpf transfer function
end
subplot(211)
plot(abs(x1))
subplot(212)
plot(angle(x1))






