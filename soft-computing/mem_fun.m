clc;
clear all;
close all;

a=20;
b=60;
c=80;
for x=1:100
    y(x)=max(min(((x-a)/(b-a)),((c-x)/(c-b))),0);
end
subplot(3,2,5);
plot(y);
title('Triangular MF');
ylabel('Membership grade');

a=10;
b=20;
c=60;
d=95;
for x=1:100
    e=(x-a)/(b-a);
    f=(d-x)/(d-c);
    A=[e 1 f];
    y(x)=max(min(A),0);
end
subplot(3,2,2);
plot(y);
title('Trapezoidal MF');
ylabel('Membership grade');

s=20;
c=50;
for x=1:100
    y(x)=exp(-((x-c)^2)/(2*s*s));
end
subplot(3,2,3);
plot(y);
title('Gaussian MF');
ylabel('Membership grade');

a=20;
b=4;
c=50;
for x=1:100
    y(x)=1/(1+(((x-c)/a)^(2*b)));
end
subplot(3,2,4);
plot(y);
title('General Bell shaped MF');
ylabel('Membership grade');

a=2;
c=5;
for x=1:20
    y1(x)=1/(1+exp(-a*(x-c)));
end
subplot(3,2,1);
plot(y1);
title('Sigmoidal MF');
ylabel('Membership grade');

