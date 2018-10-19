#include <P18F452.h>
#pragma config OSC=HS
#pragma config PWRT=OFF
#pragma config WDT=OFF
#pragma config DEBUG=OFF, LVP=OFF 

#define SW1 PORTCbits.RC1	
#define SW2 PORTCbits.RC2
#define buzz PORTBbits.RB0				
void MSDelay(unsigned int);
short int k;
void main(void)
  {  
    	
    TRISD = 0x00;				
 while(1)
 		{	
    	for (k=0x01;k<=0x80;k=k<<1)			
      	   	{     
        	PORTD = k;
         	MSDelay(150); 
      		}
 		for (k=0x80;k>=0x01;k=k>>1)			
      	   	{     
        	PORTD = k;
         	MSDelay(150); 
      		}
    	} 
      

}

void MSDelay(unsigned int itime)
  {
    unsigned int i,j;
    for(i=0;i<itime;i++)
      for(j=0;j<165;j++);
  }


