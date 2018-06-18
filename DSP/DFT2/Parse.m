%Program for  Parseval's theorem of DFT.
 N=input('Sequence length=');
x1=input('enter the first seq=');
y1=input('enter the second seq=');

c= zeros(N);

for k=1:N
     for n=1:N
         w=exp((-2*pi*j*(k-1)*(n-1))/N);
         x(n)=w;
     end
     c(k,:)=x;
end


X1=c*x1';%DFT of first sequence
Y1=c*y1';% DFT of second sequence


LHS =abs(sum(x1.*conj(y1)))
subplot(211);
stem(abs(LHS));

RHS=abs(sum(X1.*conj(Y1))/N)
subplot(212);
stem(abs(RHS));





