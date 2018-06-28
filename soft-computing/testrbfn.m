clear;clc;close all;
x1=[1 1 0 0];
x2=[1 0 1 0];
z=[1 1 1 1]
t=[0 1 1 0];

c1=[0.1 0.1];
c2=[1 1];

for j=1:1:2
for i=1:4
    phi(j,i)=exp(-(sqrt((x1(i)-c1(1))^2+(x2(i)-c1(2))^2))^2);
    phi(j,i)=exp(-(sqrt((x1(i)-c2(1))^2+(x2(i)-c2(2))^2))^2);
end
subplot(221)
 plot(x1(1),x2(1),'or','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;
plot(x1(2),x2(2),'ob','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;
plot(x1(3),x2(3),'ob','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;


plot(x1(4),x2(4),'or','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;

   


subplot(222)
plot(phi(),phi(j)
plot3(phi(1,1),phi2(1),z,'or','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;
plot3(phi1(2),phi2(2),z,'ob','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;
plot3(phi1(3),phi2(3),z,'ob','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;
plot3(phi1(4),phi2(4),z,'or','MarkerSize',10,'MarkerFaceColor',[0 0 1]);hold on;
grid on
axis square


