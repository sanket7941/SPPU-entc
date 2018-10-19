#include <P18f452.h>

#pragma config OSC=HS		
#pragma config PWRT=OFF		
#pragma config WDT=OFF
#pragma config DEBUG=OFF, LVP=OFF 

void main (void)
{
TRISD=0X00;
RCSTA = 0x90;				//Enable serial port and receiver
SPBRG = 12;					//9600 baud rate with crystal =8 MHz
TRISCbits.TRISC7=1;			//Rx as a input


while(1)
{

while (PIR1bits.RCIF==0);  //wait until all gone
PORTD=RCREG;

}
}