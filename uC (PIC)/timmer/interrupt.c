#include <P18f452.h>

#pragma config OSC=HS		
#pragma config PWRT=OFF		
#pragma config WDT=OFF
#pragma config DEBUG=OFF, LVP=OFF 
#define mybit PORTCbits.RC4

void timer0_isr(void);

#pragma interrupt my_isr
void my_isr(void)
{
	if(INTCONbits.TMR0IF==1)
		timer0_isr();
}


#pragma code high_priory=0x08
void high_priory(void)
{
	_asm
	GOTO my_isr
	_endasm
}
#pragma code

void main (void)
{
TRISCbits.TRISC4=0;

T0CON=0x06;					//Timer 0, 16 bit mode,no prescalar
TMR0H=0x06;
TMR0L=0x1b;

INTCONbits.TMR0IF==0;		//clear timer0 flag
INTCONbits.TMR0IE=1;		//enable timer 0 interrupt
T0CONbits.TMR0ON=1;			//start timer 0


INTCONbits.PEIE=1;			//Enable all peripheral interrupt
INTCONbits.GIE=1;			//Enable all interrupt globally
while(1);
}

void timer0_isr(void)
{

mybit=~mybit;

TMR0H=0x06;
TMR0L=0x1b;
INTCONbits.TMR0IF=0;

}
