%SOFM

clc;
close all;

w=[.2 .6 .4 .4 .2; .3 .5 .7 .6 .8];
[q,k]=size(w);
disp('Initialize weight matrix')
disp(w);
a=.3;
d=[0 0 0 0 0];
x=[.3 .4];
for i=1:q
    for j=1:k
        d(j)=d(j)+(w(i,j)-x(i))^2;
    end
end
j=find(min(d));
m=j-1;
n=j+1;
for i=m+1:n
    for j=m+1:n
        w(i,j)=w(i,j)+a*[x(i)-w(i,j)];
    end
end

 disp(i)
 disp('upadated weight')
 disp(w)
 

