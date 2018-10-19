#include <P18f452.h>

#pragma config OSC=HS		
#pragma config PWRT=OFF		
#pragma config WDT=OFF
#pragma config DEBUG=OFF, LVP=OFF 
#define mybit PORTCbits.RC4

void main (void)
{
TRISCbits.TRISC4=0;
while(1)
{
T0CON=0x08;					//Timer 0, 16 bit mode,no prescalar
TMR0H=0xff;
TMR0L=0xf2;
T0CONbits.TMR0ON=1;			//Turn ON timer
while(INTCONbits.TMR0IF==0);//wait for TF0 to roll over
T0CONbits.TMR0ON=0;			//stop timer 0
INTCONbits.TMR0IF=0;		//clear timer flag for next round
mybit=~mybit;				//complement bit
}
}