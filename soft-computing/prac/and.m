clc;
clear all;

x1=[0 0 1 1];
x2=[0 1 0 1];
w1=1; w2=1;
t=[0 0 1 0];% change the value for AND=2,OR=1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%AND%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:4;
    yin(i) = w1*x1(i)+ w2*x2(i);

    if(yin(i)>= 2)
        yout(i)= 1;
    else
        yout(i)= 0;
    end
       
end
disp('yout AND')
disp(yout)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%OR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:4;
    yin(i) = w1*x1(i)+ w2*x2(i);

    if(yin(i)>= 1)
        yout(i)= 1;
    else
        yout(i)= 0;
    end
       
end
disp('yout OR')
disp(yout)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ANDNOT%%%%%%%%%%%%%%%%%%%%%%%%%%%
wa1=1;wa2=-1;
for i=1:4;
    yin(i) = wa1*x1(i)+ wa2*x2(i);

    if(yin(i)>= t)
        yout(i)= 1;
    else
        yout(i)= 0;
    end
       
end
disp('yout ANDNOT')
disp(yout)
