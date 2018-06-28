 clc;
 clear all;
 close all;
 
 x1=[0 0 1 1];
 x2=[0 1 0 1];
 w1=1;
 w2=1;
 t=2;
 x3=[0 1 2 3 4 5 6 7 8 9];
 
 for i=1:4
     y(i)=(x1(i)*w1)+(x2(i)*w2);
     if(y(i)>=t)
         y(i)=1;
     else
         y(i)=0;
     end;
 end;
disp(y);
scatter(x1,x2);
hold on;

y1=-(w1/w2)*(x3-1.1);
axis([0 2 0 2]);
plot(x3,y1);