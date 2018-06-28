clc;
clear all;
close all;

A=xlsread('I:\Git Hub\soft-computing\Crab.xls');
[ma,na]=size(A);
arg=input('Enter the number of arguments: ');
for i=1:ma
    for j=1:arg
        x(i,j)=A(i,j);
    end
end
        
[m1,n1]=size(x);
m=max(x);

for i=1:m1
    for j=1:n1
        x(i,j)=x(i,j)/m(1,j);
    end
end

for i=1:ma
    for j=1:(na-arg)
        t(i,j)=A(i,j+arg);
    end
end

[m2,n2]=size(t);
a=0.3;
hn=input('Enter the number of hidden layer neurons: ');
ep=input('Enter the number of epoch: ');
mmm=input('Enter the minimum mse:');
v=(-0.5) + 1.*rand(n1,hn);
v0=(-0.5) + 1.*rand(1,hn);
w=(-0.5) + 1.*rand(hn,n2);
w0=(-0.5) + 1.*rand(n2,1);
for r=1:ep
    for i=1:m1
        X=x(i:i,:);
        T=t(i:i,:);
        z_in=X*v+v0;
        z=1./(1+(exp(-z_in)));
        y_in=z*(w)+(w0');
        y=1./(1+(exp(-y_in)));
        mse1=0;
        for k=1:n2
            d(1,k)=(T(1,k)-y(k))*(y(k))*(1-y(k));
            mse1=mse1+((T(1,k)-y(k))^2);
        end
        mse(r)=(0.5*mse1)/r;
        plot(mse);
        
    

        din=d*w';
        din1=din';
        for j=1:hn
            delta(j)=din1(j)*z(j)*(1-z(j));
        end
        for k=1:n1
            for l=1:hn
                dv(k,l)=a*delta(l)*X(k);
            end
        end
        v=v+dv;
        dv0=a*delta;
        v0=v0+dv0;
        dw=a*(d')*z;
        w=w+(dw');
        dw0=a*d;
        w0=(dw0')+w0;
    end 
    if(r>1)
        if(mse(r)>mse(r-1))
            break;
        end
        end
        if(mse(r)<mmm)
            break;
        end
end


tp=0;
tn=0;
fp=0;
fn=0;
for i=(round(m1/2)+1):m1 
        X=x(i:i,:);   
        T=t(i:i,:);
        z_in=X*v+v0;
        z=1./(1+(exp(-z_in)));
        y_in=z*(w)+(w0');
        y=1./(1+(exp(-y_in)));
     for j=1:na-arg
        if(y(j)>0.5)
         y(j)=1;
     else
         y(j)=0;
        end
     end
     for j=1:na-arg
         if(y(j)==1)&&(T(j)==1)
             tp=tp+1;
         elseif(y(j)==0)&&(T(j)==0)
             tn=tn+1;
         elseif(y(j)==1)&&(T(j)==0)
             fp=fp+1;
         else
             fn=fn+1;
         end
     end
end
sprintf('confusion matrix is:')
cm=[tp fp;fn tn]; disp(cm);
sprintf('Accuraccy is:')
accuraccy=(tp+tn)/(tp+tn+fp+fn);disp(accuraccy);
sprintf('True positive rate is:')
tpr=tp/(tp+fn);disp(tpr);
sprintf('False positive rate is:')
fpr=fp/(fp+tn);disp(fpr);
sprintf('Specificity is:')
spc=1-fpr;disp(spc);
sprintf('Positive prediction value is:')
ppv=tp/(tp+fp);disp(ppv);
sprintf('Negative prediction value is:')
npv=tn/(tn+fn);disp(npv);
sprintf('False discovery rate is:')
fdr=fp/(fp+tp);disp(fdr);
 



% Output:

% Enter the number of arguments: 6
% Enter the number of hidden layer neurons: 20
% Enter the number of epoch: 200
% Enter the minimum mse:0.001
% 
% ans =
% 
% confusion matrix is:
% 
%     96     4
%      4    96
% 
% 
% ans =
% 
% Accuraccy is:
% 
%     0.9600
% 
% 
% ans =
% 
% True positive rate is:
% 
%     0.9600
% 
% 
% ans =
% 
% False positive rate is:
% 
%     0.0400
% 
% 
% ans =
% 
% Specificity is:
% 
%     0.9600
% 
% 
% ans =
% 
% Positive prediction value is:
% 
%     0.9600
% 
% 
% ans =
% 
% Negative prediction value is:
% 
%     0.9600
% 
% 
% ans =
% 
% False discovery rate is:
% 
%     0.0400
% 
% r
% 
% r =
% 
%     38
