clc;
close all;
clear all;      

for n = 0:15
    if n==0
        a1=1;
    else if n==1
          y(n)= 0.5*a1+2^n;
         else
          y(n)=0.5*y(n-1)+2^n;
     end
   end
end
y=([a1 y]);

subplot(321);
stem(abs(y));
subplot(322);
stem(angle(y));

num=[1 0];
den=[1 -0.5];

[r p c]=residue(num,den);


for n = 0:15
   h(n+1)=p^n;
   x(n+1)=2^n;
end

z=conv(x,h);

subplot(323);
stem(abs(z));
subplot(324);
stem(angle(z));

m=length(x); 
n=length(h); 
x=[x,zeros(1,n)]; 
h=[h,zeros(1,m)]; 

for i=1:n+m-1 
    y2(i)=0; 
    for j=1:m 
        if(i-j+1>0) 
           y2(i)=y2(i)+x(j)*h(i-j+1); 
        end 
    end 
end

subplot(325);
stem(abs(y2));
subplot(326);
stem(angle(y2));



