clc;
close all;
clear all;
k=input('Enter the no. of messege bit= ');
n=input('Enter the no. of codeword bit= ');
row=k;
col=n-k;
sprintf('Enter the parity matrix: %d X %d',row,col);
p=input('Enter the parity matrix');
id=eye(k);
G=[id p];
disp('The generater matrix is:');
disp(G);
m=2^k;
for(i=0:2^k-1)
    d=i;
    j=1;
    while(d~=0)
        b(j)=rem(d,2);
        msg(i+1,j)=b(j);
        d=floor(d/2);
        j=j+1;
    end
end
msg=fliplr(msg);
code=msg*G;                                                                                                                                  
code=rem(code,2);
wgt=sum(code');
wgt=wgt';
sprintf('Messeges\t\tCodewords\t\tWeight')
for i=1:m
    fprintf(' ')
    fprintf('%d', msg(i,:))
    fprintf('     \t\t')
    fprintf('%d', code(i,:))
    fprintf('     \t\t')
    fprintf('%d\n', wgt(i))
end
wgt(1)=max(wgt)
Hd=min(wgt);
sprintf('The error detection capability of the code is: %d',(Hd-1))
sprintf('The error correction capability of the code is: %d',floor((Hd-1)/2))


p=p';
id=eye(n-k);
H=[p id];
H=H';
sprintf('The parity check matrix is:')
disp(H);
err(1,:)=zeros(1,n)
temp=eye(n)
err=[err ; temp]
synd=err*H;
sprintf('Err Pattern\t\t\tSyndroms')
for i=1:(n+1)
    fprintf(' ')
    fprintf('%d',err(i,:))
    fprintf('     \t\t')
    fprintf('%d',synd(i,:))
    fprintf('\n')
end
fprintf('\n')
y=input('Enter the received codewords= ');

crt=y*H;
crt=rem(crt,2)
for i=1:n+1
    if(synd(i,:)==crt)
        err(i,:)
        crw=rem(y+err(i,:),2)
    end
end

---------OUTPUT 1-----------

Enter the no. of messege bit= 4
Enter the no. of codeword bit= 7
Enter the parity matrix[1 1 0;0 1 1;1 1 1;1 0 1]
The generater matrix is:
     1     0     0     0     1     1     0
     0     1     0     0     0     1     1
     0     0     1     0     1     1     1
     0     0     0     1     1     0     1


ans =

Messeges		Codewords		Weight

 0000     		0000000     		0
 0001     		0001101     		3
 0010     		0010111     		4
 0011     		0011010     		3
 0100     		0100011     		3
 0101     		0101110     		4
 0110     		0110100     		3
 0111     		0111001     		4
 1000     		1000110     		3
 1001     		1001011     		4
 1010     		1010001     		3
 1011     		1011100     		4
 1100     		1100101     		4
 1101     		1101000     		3
 1110     		1110010     		4
 1111     		1111111     		7

wgt =

     7
     3
     4
     3
     3
     4
     3
     4
     3
     4
     3
     4
     4
     3
     4
     7


ans =

The error detection capability of the code is: 2


ans =

The error correction capability of the code is: 1


ans =

The parity check matrix is:

     1     1     0
     0     1     1
     1     1     1
     1     0     1
     1     0     0
     0     1     0
     0     0     1


err =

     0     0     0     0     0     0     0


temp =

     1     0     0     0     0     0     0
     0     1     0     0     0     0     0
     0     0     1     0     0     0     0
     0     0     0     1     0     0     0
     0     0     0     0     1     0     0
     0     0     0     0     0     1     0
     0     0     0     0     0     0     1


err =

     0     0     0     0     0     0     0
     1     0     0     0     0     0     0
     0     1     0     0     0     0     0
     0     0     1     0     0     0     0
     0     0     0     1     0     0     0
     0     0     0     0     1     0     0
     0     0     0     0     0     1     0
     0     0     0     0     0     0     1


ans =

Err Pattern			Syndroms

 0000000     		000
 1000000     		110
 0100000     		011
 0010000     		111
 0001000     		101
 0000100     		100
 0000010     		010
 0000001     		001

Enter the received codewords= [1 0 0 0 1 1 0]

crt =

     0     0     0


ans =

     0     0     0     0     0     0     0


crw =

     1     0     0     0     1     1     0

-------------OUTPUT 2-------------
Enter the no. of messege bit= 3
Enter the no. of codeword bit= 6
Enter the parity matrix[1 1 1;1 1 0;1 0 1]
The generater matrix is:
     1     0     0     1     1     1
     0     1     0     1     1     0
     0     0     1     1     0     1


ans =

Messeges		Codewords		Weight

 000     		000000     		0
 001     		001101     		3
 010     		010110     		3
 011     		011011     		4
 100     		100111     		4
 101     		101010     		3
 110     		110001     		3
 111     		111100     		4

wgt =

     4
     3
     3
     4
     4
     3
     3
     4


ans =

The error detection capability of the code is: 2


ans =

The error correction capability of the code is: 1


ans =

The parity check matrix is:

     1     1     1
     1     1     0
     1     0     1
     1     0     0
     0     1     0
     0     0     1


err =

     0     0     0     0     0     0


temp =

     1     0     0     0     0     0
     0     1     0     0     0     0
     0     0     1     0     0     0
     0     0     0     1     0     0
     0     0     0     0     1     0
     0     0     0     0     0     1


err =

     0     0     0     0     0     0
     1     0     0     0     0     0
     0     1     0     0     0     0
     0     0     1     0     0     0
     0     0     0     1     0     0
     0     0     0     0     1     0
     0     0     0     0     0     1


ans =

Err Pattern			Syndroms

 000000     		000
 100000     		111
 010000     		110
 001000     		101
 000100     		100
 000010     		010
 000001     		001

Enter the received codewords= [1 0 1 1 0 0]

crt =

     1     1     0


ans =

     0     1     0     0     0     0


crw =

     1     1     1     1     0     0

>> 