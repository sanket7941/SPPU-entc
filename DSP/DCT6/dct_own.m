clc;close all;clear all;

a= [1 2 3 4 5 6 7 8];
u=[0 1 2 3 4 5 6 7];

d=(sqrt(1/length(a)))*sum(a); %for u=0
  for y = 2:8
      sum1=0;
   for i =1:length(a)
       
            sum1=sum1+ (a(i)* cos(((2*pi*(i-1))+pi)*(u(y)/(2*length(a)))));
   end
            c(y)=(sqrt(2/length(a)))*sum1; %for u not equal to 0
  end
  c=[d,c]; %DCT
  c(2)=[]; 
  
  for i=1:length(a)
      if (abs(c(i))<1)
          d2(i)=0;
      else 
          d2(i)=c(i);%DCT
      end
  end
  
  for j=1:8
  for i = 1:8
  p(j,i)=cos(((2*pi*(i-1))+pi)*(u(j)/(2*length(a))));
  end
  end
  
for i=1:8
    subplot(4,2,i)  %plot of basis functions
    plot(p(i,:))
end

p1=2*length(a);

alpha=[0.3536 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ];
for i = 1:8
    sum1=0;
    for j = 1:8
         sum1= sum1 + ((alpha(j)*c(j)) * cos(pi*(2*(i-1)+1)*(j-1)/p1));
    end
        c1(i)=round(sum1);%IDCT
    end

for i = 1:8
    sum2=0;
    for j = 1:8
         sum2= sum2 + ((alpha(j)*d2(j)) * cos(pi*(2*(i-1)+1)*(j-1)/p1));
    end
        c2(i)=(sum2); %IDCT
end
    


  