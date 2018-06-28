clc;
clear all;
close all;

x=(1:100);

a=20;
b=2;
c=0;
for i=1:100
    young(i)=1/(1+(((x(i)-c)/a)^(2*b)));
end
%subplot(2,1,1);
%text(20,0.8,'young','color',[1 0 0]);
hold on;

a=30;
b=3;
c=100;
for i=1:100
    old(i)=1/(1+(((x(i)-c)/a)^(2*b)));
end
%subplot(2,1,1);
%plot(x,old,'b');
text(80,0.8,'old','color',[0 0 1]);
title('Primary linguistic variables');
xlabel('age');
ylabel('membership grade');
hold on;

a=20;
b=2;
c=70;
for i=1:100
    more_or_less_old(i)=1/(1+(((x(i)-c)/a)^(2*b)));
end
%subplot(2,1,2);
%text(70,0.8,'more or less old');
hold on;

for i=1:100
    not_young_and_not_old(i)=min(1-young(i),1-old(i));
end
%subplot(2,1,2);
%plot(x,not_young_and_not_old);
text(40,0.8,'not young and not old');
hold on;

for i=1:100
    young_but_not_too_young(i)=min(young(i),1-(young(i)^2));
end
%subplot(2,1,2);
%plot(x,young_but_not_too_young);
text(15,0.4,'young but not too young');
hold on;

for i=1:100
    extremly_old(i)=old(i)^8;
end
%subplot(2,1,2);
%text(90,0.9,'extremly old');
title('Composite linguistic variables');
xlabel('age');
ylabel('membership grade');
hold on;

A=input('Enter your age:');

T=[more_or_less_old(A) not_young_and_not_old(A) young_but_not_too_young(A) extremly_old(A)];
m=max(T);
for i=1:4
    if(T(i)==m)
        no=i;
    end
end

if(no==1)
    sprintf('You are more or less old')
elseif(no==2)
    sprintf('You are not young and not old')
elseif(no==2)
     sprintf('You are young but not too young')
else
    sprintf('You are extremly old')
end
% 
% Output:
% Enter your age:21
% 
% ans =
% 
% You are not young and not old
% 
