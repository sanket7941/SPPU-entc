clc;
clear all;
close all;

o=[0 0 1 1;0 1 0 1];
c=[0 0;1 1];
t=[0; 1; 1; 0];
[m1,n1]=size(o);
i=1;j=1;
 for i=1:m1
     for j=1:n1
        C=c(i:i,:); 
        O=o(:,j:j)';
        a=C-O;
        a=a.*a;
        s=sum(a);
        d(i,j)=sqrt(s);
        f(i,j)=exp(-(d(i,j)^2));
     end
 end
 for i=1:n1
     one(i)=1;
 end
 
fi=[f' one'];
w=((inv(fi'*fi))*fi')*t;

x=[o' one'];
y=fi*w;
scatter(f(1,:),f(2,:));
hold on;

x3=[-4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9];
y1=-(w(1)/w(2))*(x3-1);
axis([-2 2 -2 2]);
plot(x3,y1);