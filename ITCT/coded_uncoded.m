%TE ETC ( 2012 course)    ITCT ASST 8

% Performance comparison of coded and uncoded systems
% Probability of error Pb Vs Eb/ No
% Reference: Book : Digital Communications by B.Sklar
%______________________________________________________________________
clc;
n1=15;k1=11; %For (15,11)LBC
n2=7;k2=4; %For (7,4)Hamming code
n3=31;k3=26;

Ebno=1:1:30; % X-axis parameter Eb/No in  dB

%To find code symbol energy per noise spectral density from information bit
%energy per noise spectral 

%using Ec/No=(k/n)*Eb/No

Ecno1=k1*Ebno/n1; % for (15,11)code
Ecno2=k2*Ebno/n2; % for (7,4)code
Ecno3=k3*Ebno/n3; % for (31,26)code

% For Error control coded system using (n,k)Hamming codes
% For performance over a Gaussian channel using coherently demodulated
% BPSK,Channel symbol error probability is expressed in terms of Ec/No
%p=Q(sqrt(2*Ec/No

% Using the relation, Q(x)=0.5*erfc(x/sqrt(2))
%For (n1,k1)=(15,11)

p1=0.5*erfc(sqrt(2*Ecno1)/sqrt(2));% Relation between Q function and erfc(x)

% Bit Error probability Pb expressed in terms of channel symbol error
% probability(transition probability on the binary symmetric channel)

Pbc1=p1-p1.*(1-p1).^(n1-1);
disp(Pbc1);

%For (n2,k2)=(7,4)

x2=2*Ecno2;
p2=0.5*erfc(sqrt(x2)/sqrt(2));
Pbc2=p2-p2.*(1-p2).^(n2-1);

%For (n3,k3)=(31,26)
x3=2*Ecno3;
p3=0.5*erfc(sqrt(x3)/sqrt(2));
Pbc3=p3-p3.*(1-p3).^(n3-1);

% Foruncoded system
y=2*Ebno;
puc=0.5*erfc(sqrt(y)/sqrt(2));

figure(1);
loglog(Ebno, puc,'b-',Ebno, Pbc1,'r-',Ebno,Pbc2,'gr-',Ebno, Pbc3,'m-');

title('Plot of Performance comparison of coded and uncoded system');
legend('Uncodedsystem','Hamming (15,11)','Hamming (7, 4)','Hamming (31, 26)','Best');
xlabel('Eb/No in dB');ylabel('Pb ,Decoded bit error probality');

%Conclusion: Error control coded systems perform better than uncoded system
%The figure shows that---1) Pbi.e decoded bit error probability  falls  as Eb/no
% increases and 
%2) As (n,k) values increases, Pb decreases faster.

