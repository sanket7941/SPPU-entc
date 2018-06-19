#include<lpc22xx.h>

 #define data 0x03fc0000
 #define rs  0x00010000
 #define en  0x00020000



void delay(void)
{
  int i,j;
for(i=0;i<1000;i++)
for(j=0;j<1000;j++);
}



void lcd_data (unsigned char data)
{
    IOSET0=rs;
	IOSET0=data<<18;
	IOCLR0=~data<<18;
	IOSET0=en;
	delay();
	IOCLR0=en;
}


void lcd_command(unsigned char command)
{
 	IOCLR0=rs;
	IOSET0=command<<18;
	IOCLR0=~command<<18;
	IOSET0=en;
	delay();
	IOCLR0=en;
	
}




void lcd_init()
{
	lcd_command(0x38);
	lcd_command(0x0E);
	lcd_command(0x06);
	lcd_command(0x01);
	lcd_command(0x80);
}





void lcd_msg(unsigned char row,unsigned char col,unsigned char *msg)
{
	if(row==1)
	row=0x80;
	else
	row=0xc0;
	lcd_command(row|col);			  
	while(*msg)						  
	{
	 	lcd_data(*msg);
		msg++;

	}

}

