clc;
close all;

x=-1:0.1:1;
t=100*x+7*randn(1,);
%subplot(2,1,1);

%title('points');

w=0;b=0;

for j=1:50
    for i=1:20
        y=x(i)*w+b;
        e(i)=t(i)-y;
        e1(i)=e(i)^2;
        dw=0.01*x(i)*e(i);
        db=0.01*e(i);
        w=w+dw;
        b=b+db;
    end
    mse(j)=sum(e1)/20;
end
y1=w*x+b;
subplot(2,1,1);
hold on;
plot(x,y1);
scatter(x,t);
title('line common points')
subplot(2,1,2);
plot(mse);
title('MSE')
