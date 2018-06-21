clc;
close all; 
clear all;
msg=input('enter msg bits:'); 
ip=[msg zeros(1,2)];    
op=zeros(4,2);
state=zeros(4,2);
ns=0;
for i=1:length(ip) 
switch ns
    case 0
    if(ip(i)==0)
        ns=0;
        op1=0; 
        state(1,1)=ns; 
        op(1,1)=opl;
        op1;
    else
        ns=2;
        opl=3; 
        state(1,2)=ns; 
        op(1,2)=opl;
        opl;
    end
    
    case 1
    if(ip(i)==0)
        ns=0; 
        op1=3;
        state(2,1)=ns;
        op(2,1)=op1; 
        opl;
    else
        ns=2;
        op1=0;
        state(2,2)=ns;
        op(2,2)=op1;
        opl;
    end
    
    case 2
    if(ip(i)==0) 
        ns=1;
        op1=2; 
        state(3,1)=ns; 
        op(3,1)=opl;
        opl;
    else
        ns=3;
        op1=1;
        state(3,2)=ns;
        op(3,2)=opl;
        opl;
    end
    
    case 3
    if(ip(i)==0)
        ns=1;
        op1=1;
        state(4,1)=ns;
        op(4,1)=opl;
        opl;
    else
        ns=3;
        op1=2;
        state(4,2)=ns;
        op(4,2)=opl;
        opl;
    end
end
end
 
s=struct('numInputsymbols',2,'numOutputsymbols',4,'numstates',4,'nextstates',state,'outputs',op);
 
encode=convenc(ip,s);
 
err=randerr(1,length(encode),2);
 
crr=xor(encode,err);
 
decode=vitdec(encode,s,5,'term','hard');


OUTPUT:
enter msg bits:[1 1 1]
op1=
	3
op1=
	1
op1=
	2
op1=
	1
op1=
	1
encode=
	1	1	0	1	1	0	0	1	1	1
err=
	0	0	0	1	0	0	0	1	0	0
crr=
	1	1	0	0	1	0	0	0	1	1
decode=
	1	1	1	0	0


