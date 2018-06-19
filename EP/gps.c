	#include  <lpc22xx.h>
	#include <string.h>
	#include "lcd.h"	
		
	#define Fosc            12000000                    
	#define Fcclk           (Fosc * 5)                  
	#define Fcco            (Fcclk * 4)                 
	#define Fpclk           (Fcclk / 4) * 1             
	#define  UART_BPS	9600	 
	
	void UART0_SendByte(unsigned char data)	  
	{  
		   U0THR = data;				    
		   while((U0LSR&0x40)==0);    
	}
	
	void  Delay(unsigned int Delay)  
	{  
		   unsigned int j,i;
		   for(j=0; j<Delay; j++) 
		   for(i=0; i<1023; i++);
	}
		
		
	void  Init_UART0(void)				
	{  
	   unsigned int Baud16;
	   U0LCR = 0x83;		            
	   Baud16 = (Fpclk / 16) / UART_BPS;  
	   U0DLM = Baud16 / 256;							
	   U0DLL = Baud16 % 256;						
	   U0LCR = 0x03;
	}
        void UART_msg(unsigned char *msg)
        {
	    while(*msg)
	    { 
		UART0_SendByte(*msg);
		msg++;
	    }
        }

        unsigned char UART0_recievedStr()
	{
	   	while(!(U0LSR & 0x1));
	   return U0RBR;
	}



        void  main(void)				
	{  			
	int n;
	unsigned char sat,temp;
	unsigned char gpgga[100],abc[20];
	unsigned char longi[100];
	unsigned char lati[100];
	

	IODIR1=0X00FF0000; 
	Init_LCD();		   
				 
	PINSEL0 = 0x00050005;		    
	PINSEL1 = 0x00000000;
	PINSEL2 = 0x00000000;
	
 	Init_UART0();
	Lcd_Msg(1,0,"LONG:");	
	Lcd_Msg(2,0,"LAT:");
		
	while(1)	
	{  
	n=0;
	temp=UART0_recievedStr();
	if(temp=='$')
	{	
		IOSET1=0x00010000;
		gpgga[n]=temp;
		n++;
				
		temp=UART0_recievedStr();
		if(temp=='G')
		{
		IOSET1=0x00020000;	
		gpgga[n]=temp;
		n++;
				
		temp=UART0_recievedStr();	
		if(temp=='P')
		{	
		IOSET1=0x00040000;
		gpgga[n]=temp;
		n++;
							
		temp=UART0_recievedStr();								
		if(temp=='G')
		{	
		IOSET1=0x00080000;
		gpgga[n]=temp;
		n++;
		
		temp=UART0_recievedStr();
		if(temp=='G')
		{	
		IOSET1=0x00100000;
		gpgga[n]=temp;
		n++;
													
		temp=UART0_recievedStr();													
	 	if(temp=='A')
	        {
	  	IOSET1=0x00200000;	
		gpgga[n]=temp;
		n++;
		}
																
		while((temp=UART0_recievedStr())!=',') ;
		while((temp=UART0_recievedStr())!=',') ;
		n=0;
		while((temp=UART0_recievedStr())!=',') 	   
		{
	         longi[n]=temp;
		 n++;	
		}  
		longi[n]='\0';
		while((temp=UART0_recievedStr())!=',') ;
		n=0;
		while((temp=UART0_recievedStr())!=',') 	   
		{
		lati[n]=temp;
		n++;	
		}  
		while((temp=UART0_recievedStr())!=',') ;
		sat=UART0_recievedStr();

		Lcd_Msg(1,5,longi);														
		Lcd_Msg(2,5,lati);

		lcd_command(0x8f);
        	lcd_display(sat);		
		}
		}
		}
		}			
		}
		Delay(10);
		}

}	
