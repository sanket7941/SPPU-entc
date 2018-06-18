
close all;
clear all;
clc;

%Low pass filter
fc=input('enter cuttoff frequency=');%2500
fs=input('enter sampling frequency=');%20000
N=input('enter length of sequence=');%10
M=N;

for n=1:N
        if(n~=M)
            hd(n)=sin(((2*pi*fc)/fs)*(n-M))/(pi*(n-M));%LPF for n not equal to M
            
        else
            hd(n)=(2*pi*fc)/(fs*pi);% LPF for n equal to M
            
        end
        n=n+1;
end       

           
'select the window: 1.Rectangular 2.Bartlett(triangular) 3.Blackmann 4.Hamming 5.Hanning'

k=input('enter window choice=');

switch(k)

 case 1
      for n=1:1:M-1
            w(n)=1;%Rectangular window
      end

case 2
      for n=1:1:M-1
          w(n)=1-(2*(abs(n-((M-1)/2)))/(M-1));%Bartlett(triangular)Window
      end
     
case 3
      for n=1:1:M-1
          w(n)=0.42-0.5*cos((2*pi*n)/(M-1))+0.8*(cos(4*pi*n)/(M-1));%Blackmann Window
      end

case 4
     for n=1:1:M-1
         w(n)=0.54-0.46*cos((2*pi*n)/(M-1));%Hamming Window
     end

case 5
      for n=1:1:M-1 
          w(n)=0.5*(1-cos((2*pi*n)/(M-1)));% Hanning Window
      end
     
end
  
  for n=1:1:M-1
      h(n)=hd(n)*w(n);%low pass filter coefficient and different window
  end
    
  freqz(h);   
  
  figure;
  freqz(w);