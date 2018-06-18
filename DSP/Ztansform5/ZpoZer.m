clear all;
clc;
close all;

Z1=1;
for w=0:0.1:pi
  H1(Z1)=(exp(-j*w)*exp(-2*j*w))/(1-1.2732*exp(-j*w)+0.81*exp(-2*j*w));
  Z1=Z1+1;
end
subplot(221);
stem(abs(H1));
subplot(222);
stem(angle(H1));

b=[1];
c=[1 -1.2732 0.81];
subplot(223);
zplane(b,c);
title('System is stable')
figure;
freqz([1],[1 -1.2732 0.81]);


Z2=1;
for w=0:0.1:pi
  H2(Z2)=(1)/(1-1.5*exp(-j*w)+0.5*exp(-2*j*w));
  Z2=Z2+1;
end
subplot(221);
stem(abs(H2));
subplot(222);
stem(angle(H2));

b=[1];
c=[1 -1.5 0.5];
subplot(223);
zplane(b,c);
figure;
freqz([1],[1 -1.5 0.5])


Z3=1;
for w=0:0.1:pi
  H3(Z3)=(1+exp(-j*w))/(1-exp(-j*w)+0.5*exp(-2*j*w));
  Z3=Z3+1;
end
subplot(221);
stem(abs(H3));
subplot(222);
stem(angle(H3));

b=[1 1];
c=[1 -1 0.5];
subplot(223);
zplane(b,c);
figure;
freqz([1 1],[1 -1 0.5]);


Z4=1;
for w=0:0.1:pi
  H4(Z4)=(3-4*exp(-j*w))/(1-3.5*exp(-j*w)+1.5*exp(-2*j*w));
  Z4=Z4+1;
end
subplot(221);
stem(abs(H4));
subplot(222);
stem(angle(H4));

b=[3 -4];
c=[1 -3.5 1.5];
subplot(223);
zplane(b,c);
figure;
freqz([3 -4],[1 -3.5 1.5]);


Z5=1;
for w=0:0.1:pi
  H5(Z5)=(1-5*exp(-j*w)+6*exp(-2*j*w))/(1-2.5*exp(-j*w)+exp(-2*j*w));
  Z5=Z5+1;
end
subplot(221);
stem(abs(H5));
subplot(222);
stem(angle(H5));

b=[1 -5 6];
c=[1 -2.5 1];
subplot(223);
zplane(b,c);
figure;
freqz([1 -5 6],[1 -2.5 1]);


Z6=1;
for w=0:0.1:pi
  H6(Z6)=(1+3*exp(-j*w))/(1+3*exp(-j*w)+2*exp(-2*j*w));
  Z6=Z6+1;
end
subplot(221);
stem(abs(H6));
subplot(222);
stem(angle(H6));

b=[1 3];
c=[1 3 2];
subplot(223);
zplane(b,c);
figure;
freqz([1 3],[1 3 2]);

%marginally stable
Z7=1;
for w=0:0.1:pi
  H7(Z7)=(1+2*exp(-2*j*w))/(1+exp(-2*j*w));
  Z7=Z7+1;
end
subplot(221);
stem(abs(H7));
subplot(222);
stem(angle(H7));

b=[1 0 2];
c=[1 0 1];
subplot(223);
zplane(b,c);
figure;
freqz([1 0 2],[1 0 1]);



Z8=1;
for w=0:0.1:pi
  H8(Z8)=(2-1.5*exp(-j*w))/(1-1.5*exp(-j*w)+0.5*exp(-2*j*w));
  Z8=Z8+1;
end
subplot(221);
stem(abs(H8));
subplot(222);
stem(angle(H8));

b=[2 -1.5];
c=[1 -1.5 0.5];
subplot(223);
zplane(b,c);
figure;
freqz([2 -1.5],[1 -1.5 0.5]);