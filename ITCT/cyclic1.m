clc;
clear all;
close all;

n=input('enter the value of n');
k=input('enter the no of k');

for i=0:((2^k)-1)
    d=i;
    n1=1;
    while(d~=0)
        b(n1)=rem(d,2);
        msg(i+1,n1)=b(n1);
        d=floor(d/2);
        n1=n1+1;
    end
end

g=input('generator poly coefficient');
g1=gf(g,1);  % GF(g,M) creates a Galois field array from g
               % in the field GF(2^M), for 1<=M<=16

z=zeros(2^k,n-k);
msg=[msg z];  %zeroes are appended
msg1=gf(msg,1); %2^1 bits i.e 0,1

for i=1:2^k
    [q,r]=deconv(msg1(i,:),g1);
    r=double(r.x);
    parity(i,:)=r;
end
 code=rem((msg+parity),2);
 
 %DECODING
 
 ep=eye(n);
ep =[zeros(1,n);ep];
ep1=gf(ep,1);

for i=1:n+1
    [q r]=deconv(ep1(i,:),g1);
    r=double(r.x);
    syn(i,:)=r;
end

rec=input('enter recieved bits');
rec1=gf(rec,1);
[q r]=deconv(rec1,g1);
r = double(r.x);
syn1=r;

for i = 1:n+1
    if(syn1==syn(i,:))
        ep(i,:);
        corrected =rem((rec+ep(i,:)),2);
    end
end
 