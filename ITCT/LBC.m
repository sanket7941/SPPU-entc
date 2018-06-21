%Experiment 3
 
clc;
clear all;
close all;
 
%encoding
n = input('n value from user');
 
k=input('Enter the value of k');
 
a= eye(k);
 
p1= input('parity matrix');
 
G =[a p1];
for(i=0:(2^k)-1)
    d=i;
    n1=1;
    
    while(d~=0)
        b(n1)=rem(d,2);
        msg(i+1,n1)=b(n1);
        d = floor(d/2);
        n1=n1+1;
    end
end
msg = fliplr(msg);
c=msg*G;
 
c= rem(c,2);
 
wt = sum(c');
 
dmin= min(wt(2:end));
 
td= dmin-1;
tc=floor((dmin-1)/2);
 
%decoding
 
p2=p1';
b=eye(n-k);
H=[p2 b];
 
H1=H';
 
e1= zeros(1,n);
e=eye(n);
e=[e1;e];
 
S=e*H1;
 
rec = input('enter rec codeword');
s1= rem((rec*H1),2);
 
for i = 1:n+1
    if(s1==S(i,:))
        e(i,:)
        corrected = rem((rec+e(i,:)),2);
    end
end
 
 
 


