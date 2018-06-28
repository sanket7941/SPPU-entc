 clc;
 clear all;
 close all;
 
 x1=[1 1 -1 -1];
 x2=[1 -1 1 -1];
 w1=0;
 w2=0;
 b=0;
 t=[1 -1 -1 -1];
 x3=[0 1 2 3 4 5 6 7 8 9];
 
 for i=1:4
     y(i)=t(i);
     w1=w1+(x1(i)*y(i));
     w2=w2+(x2(i)*y(i));
     b=b+y(i);
 end
 
disp(b);
disp(w1);
disp(w2);

scatter(x1,x2);
hold on;

y1=-(w1/w2)*(x3-0.5);
axis([-2 2 -2 2]);
plot(x3,y1);