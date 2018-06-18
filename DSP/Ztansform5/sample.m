clear all;
clc;
close all;

num_coefficient=[1 0 0];% num_coefficient of transfer function
dem_coefficient=[1 -1.2732 0.81];% dem_coefficient of transfer function

Z1=1;
i=1;
for w=0:0.1:pi
  H1(Z1)=(num_coefficient(i)*exp(-j*w)*exp(-2*j*w)+num_coefficient(i+1)*0+num_coefficient(i+2)*0)/(dem_coefficient(i)*1+dem_coefficient(i+1)*exp(-j*w)+dem_coefficient(i+2)*exp(-2*j*w));
  Z1=Z1+1;
end
subplot(311);
plot(abs(H1));
title('Magnitude of Transfer function');
subplot(312);
plot(angle(H1));
title('Magnitude of Transfer function');
 subplot(313);
 zplane(num_coefficient,dem_coefficient);% poles and zeros of transfer function

num_root=roots(num_coefficient)% roots of numerator coefficient
dem_root=roots(dem_coefficient)%roots of denominator coefficient

%check stability condition of transfer function
mag_poles=abs(dem_root);
i=1;
if (mag_poles(i)<1)
  'System is stable'
  i=i+1;
  elseif(mag_poles(i)==1)
    'System is marginally stable' 
     i=i+1;
      else
       'System is unstable'
       i=i+1
end     

figure;
freqz(num_coefficient,dem_coefficient);% magnitude and phase of transfer function using freqz function

