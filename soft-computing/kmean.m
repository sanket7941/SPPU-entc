clc;
clear all;
close all;

o=[1 2 4 5;1 1 3 4];
c=[1 1;2 1];
[m1,n1]=size(o);
counter=0;
while(1)
 counter=counter+1;   
 for i=1:m1
     for j=1:n1
        C=c(i:i,:); 
        O=o(:,j:j)';
        a=C-O;
        a=a.*a;
        s=sum(a);
        d(i,j)=sqrt(s);
     end
 end
 m=min(d);
for i=1:m1
    for j=1:n1
        if(d(i,j)==m(1,j))
            g(i,j)=1;
        else
            g(i,j)=0;
        end
    end
end

for i=1:m1
    G=g(i:i,:);
    for j=1:n1
        if(G(j)==1)
            q(i,j)=j;
        
        else
            q(i,j)=0;
        end
    end
end

nn=0;
for i=1:m1
    Q=q(i:i,:);
    for(j=1:n1)
        if(Q(j)>0)
            X(j,:)=o(:,j:j)';
            nn=nn+1;
        else
            X(j,:)=[0 0];
        end
    end
    cn(i,:)=sum(X)/nn;
    nn=0;
end
if(cn==c)
    break;
else
    c=cn;
end
end

% 
% Output:
% c =
% 
%     1.5000    1.0000
%     4.5000    3.5000
