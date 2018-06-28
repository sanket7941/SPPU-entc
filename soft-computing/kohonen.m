clc;
clear all;
close all;

w=[0.2 0.6 0.4 0.9 0.2;0.3 0.5 0.7 0.6 0.8];
% ip=[0.3 0.4;0.4 0.3];
A=xlsread('I:\Git Hub\soft-computing\Crab.xls');
[ma,na]=size(A);
arg=input('Enter the number of arguments: ');
for i=1:ma
    for j=1:arg
        ip(i,j)=A(i,j);
    end
end
[m3,n3]=size(ip);
m=max(ip);

for i=1:m3
    for j=1:n3
        ip(i,j)=ip(i,j)/m(1,j);
    end
end


epoch=input('Enter number of epoch: ');
[m1 n1]=size(w);
[m2 n2]=size(i);
alpha=0.3;
plot(w(1,:),w(2,:),'r');
hold on;
for i=1:ma
    plot(ip(i,1),ip(i,2),'og');
    hold on;
end
        
for k=1:epoch
for i=1:m2
     for j=1:n1
        W=w(:,j:j);
        I=ip(i:i,:)';
        a=W'-I';
        a=a.*a;
        s=sum(a);
        d(i,j)=(s);
     end
end 
 
m=min(d);
for i=1:n1
    if(d(1,i)==m)
        ind=i;
    end
end

for i=1:m1
    w(i,ind)=w(i,ind)+(alpha*(ip(i)-w(i,ind)));
end

ind1=ind+1;
ind0=ind-1;

if(ind1<n1)
    for i=1:m1
    w(i,ind1)=w(i,ind1)+(alpha*(ip(i)-w(i,ind1)));
    end
end

if(ind0>0)
    for i=1:m1
    w(i,ind0)=w(i,ind0)+(alpha*(ip(i)-w(i,ind0)));
    end
end
% alpha=alpha*0.5;
end

plot(w(1,:),w(2,:),'b');