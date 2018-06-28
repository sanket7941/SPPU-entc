 clc;
 clear all;
 close all;
 
 x1=[0 0 1 1];
 x2=[0 1 0 1];
 w1=1;
 w2=-1;
 t=1;
 
 for i=1:4
     z1(i)=(x1(i)*w1)+(x2(i)*w2);
     if(z1(i)>=t)
         z1(i)=1;
     else
         z1(i)=0;
     end;
 end;
 
 w1=-1;
 w2=1;
 t=1;
 
 for i=1:4
     z2(i)=(x1(i)*w1)+(x2(i)*w2);
     if(z2(i)>=t)
         z2(i)=1;
     else
         z2(i)=0;
     end;
 end;
 
 w1=1;
 w2=1;
 t=1;
 
 for i=1:4
     y(i)=(z1(i)*w1)+(z2(i)*w2);
     if(y(i)>=t)
        y(i)=1;
     else
         y(i)=0;
     end;
 end;
 disp(y);
