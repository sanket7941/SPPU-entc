clc;
clear all;
close all;
m=input('Enter the highest degree of primitive polynomial ');
pr=primpoly(m);
disp('Primitive polynomial ');
pr
k=input('Enter the no of msg bits ');
n=(2^m)-1;
mp=[];

for i=1:n
    t=gftuple(i-1,m);
    tp(i,:)=t;
    s=0;
    for j=1:m
        s=s+t(j)*(2^(j-1));
    end
    b(i,:)=s;
    g=gf(s,m);
    mp1=minpol(g);
    mp=[mp;mp1];
end
disp('Minimal polynomial ');
mp
f=[tp,b];
disp('Gen.poly. and error correction capability:');
[g,tp]=bchgenpoly(n,k);
disp('The generator polynomial elements are ');
g
disp('The error correcting capability is tc= ');
tp

%Encoding & decoding
num=1;
msg=gf(randint(num,k));
disp('The msg bits are:');
msg
code=bchenc(msg,n,k);
disp('The encoded bits are:');
code

noisycode=code+randerr(num,n,1:tp);
disp('The corrupted codeword is ');
noisycode

[newmsg,err,ccode]=bchdec(noisycode,n,k);
ccode
if ccode==code
    disp('All errors were corrected');
end

if newmsg==msg
    disp('The code was decoded successfully');
end

% OUTPUT

Enter the highest degree of primitive polynomial 4
Primitive polynomial(s) = 

D^4+D^1+1
Primitive polynomial 
pr =
     19

Enter the no of msg bits 7
Minimal polynomial 
mp = GF(2) array. 
 
Array elements = 
 
           0           0           0           1           1
           1           0           0           1           1
           1           0           0           1           1
           1           1           1           1           1
           1           0           0           1           1
           0           0           1           1           1
           1           1           1           1           1
           1           1           0           0           1
           1           0           0           1           1
           1           1           1           1           1
           0           0           1           1           1
           1           1           0           0           1
           1           1           1           1           1
           1           1           0           0           1
           1           1           0           0           1

Gen.poly. and error correction capability:
The generator polynomial elements are 
g = GF(2) array. 
 
Array elements = 
  Columns 1 through 8

           1           1           1           0           1           0           0           0

  Column 9

           1
The error correcting capability is tc= 
tp =
     2
msg = GF(2) array. 
 
Array elements = 
 
           1           1           0           0           1           0           0
 
The encoded bits are:
code = GF(2) array. 
Array elements = 
  Columns 1 through 8

           1           1           0           0           1           0           0           0

  Columns 9 through 15

           1           1           1           1           0           1           0

The corrupted codeword is 
noisycode = GF(2) array. 
Array elements = 
  Columns 1 through 8

           1           1           0           0           1           0           0           0

  Columns 9 through 15

           1           1           1           1           0           1           
 
ccode = GF(2) array. 
Array elements = 
  Columns 1 through 8

           1           1           0           0           1           0           0           0

  Columns 9 through 15

           1           1           1           1           0           1           0

All errors were corrected
The code was decoded successfully
>> 