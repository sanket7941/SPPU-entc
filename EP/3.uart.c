#include  <lpc22xx.h>
#include  "lcd.h"		 

void UART0_SendByte(unsigned char data)	  
{  
   	U0THR = data;				    
   	while((U0LSR&0x40)==0); 
  	//while(U0LSR!=0x60);	
 
void UART0_recievedStr()
{
	while(!(U0LSR & 0x01));	  
    UART0_SendByte(U0RBR); 
	lcd_display(U0RBR);    
}

void  Init_UART0(void)				
{  //setup FIFO control
   U0LCR = 0x83;		            						
   U0DLL = 98;					
   U0LCR = 0x03;  	

void UART_msg(unsigned char *msg)
{
	while(*msg)
	{
	UART0_SendByte(*msg);
	msg++;
	}
}			


void  main(void)
 {  
   Init_LCD();
   Lcd_Msg(1,0,"Received Data");
   PINSEL0 = 0x00000005;		    
   Init_UART0();
   UART_msg("WELCOME TO VIIT PUNE\n\r ");
   lcd_command(0x0C0);
   while(1)	
   {  	
	    UART0_recievedStr();
      	delay();
   }
}
