#include "LPC1768_Includes.h"
void delay(unsigned int time)
{
unsigned int i,j;
for(i=0;i<time;i++)
	for(j=0;j<2000;j++);
}


int main()
{
unsigned int period = 100000,i;

PINSEL3 = 0x00020000;		
PCONP = 1<<6;			  	
PWM1CTCR = 0x00000000;		
PWM1PR = 0x00;				
PWM1MCR =  0x00000002;		
PWM1MR0 =  period;			
PWM1PCR =  0x00002000;		
PWM1TCR =  0x00000009;		
while(1)
{
	for(i=0;i<0;i++)
	{
		PWM1MR5 = i*period/10;		
		PWM1LER = 0x00000020;
		delay(1000);
	}
}
return 0;
}
