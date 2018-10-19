
#include <P18F452.h>
#pragma config OSC=HS
#pragma config PWRT=OFF
#pragma config WDT=OFF
#pragma config DEBUG=OFF, LVP=OFF

#define RS PORTCbits.RC0
#define RW PORTCbits.RC1
#define EN PORTCbits.RC2


void MSDelay(unsigned int itime)
{
unsigned int i;
unsigned char j;
for(i=0;i<itime;i++)
for(j=0;j<165;j++);
}

void LCD_command(char command)
{
MSDelay(100);
RS=0;
RW=0;
PORTD=command;
EN=1;
MSDelay(10);
EN=0;
}

void LCD_Data(char data)
{
MSDelay(100);
RS=1;
RW=0;
PORTD=data;
EN=1;
MSDelay(10);
EN=0;
}

void Lcd_Msg(unsigned char ROW,unsigned char COL, unsigned char *Message)
	{
 	if(ROW == 1)
	ROW =0x80;

	else 
 	ROW =0xC0;
 
   	LCD_command(ROW|COL);
 	while(*Message)
 	{
   	LCD_Data(*Message);
  	Message++;
  	}
  	}

void Init_LCD(void)
	{
	LCD_command(0x38); 
	LCD_command(0x0e); 
	LCD_command(0x01); 
	LCD_command(0x07);	
 	}


