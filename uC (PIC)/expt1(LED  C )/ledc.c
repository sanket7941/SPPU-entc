#include <P18F452.h>
#pragma config OSC=HS
#pragma config PWRT=OFF
#pragma config WDT=OFF
#pragma config DEBUG=OFF, LVP=OFF 

#define SW1 PORTCbits.RC1	
#define SW2 PORTCbits.RC2
#define buzz PORTBbits.RB0				
void MSDelay(unsigned int);
short int i,j;
void main(void)
  {  
    TRISCbits.TRISC1 = 1;
	TRISCbits.TRISC2 = 1;
	TRISBbits.TRISB0 = 0;		
    TRISD = 0x00;				
 while(1)
 {	
 if((SW1 == 1)&& (SW2== 0))
      {
	   buzz=1;
                for (i=0x01;i<=0x80;i=i<<1)			
      	   {     
	
        	PORTD = i;
         	MSDelay(150); 
      	}
      } 
      
 else if((SW1 == 0)&& (SW2== 1))
      { 
             buzz=0; 
             for (i=0x80;i>=0x01;i=i>>1)			
      	{   
       	 PORTD = i;
     	 MSDelay(150);   
      	}
      }
	else 
	for (i=0x80,j=0x01 ;i>=0x01 && j<=0x80; i=i>>1, j=j<<1)			
    	{   
	buzz=0;         
	PORTD = i|j;
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


