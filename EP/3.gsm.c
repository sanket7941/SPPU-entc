#include<lpc22xx.h>		 

#define 	Fosc            12000000                    
#define 	Fcclk           (Fosc * 5)                  
#define 	Fcco            (Fcclk * 4)                 
#define 	Fpclk           (Fcclk / 4) * 1             

#define 	UART_BPS		9600	 
#define 	UART_STRING1  	"GPGGA" 
#define     End_Str          0x1A	
#define     End_Line         0x0D	  


unsigned char ATC1[20] = {'A','T','+','C','S','C','S','=','"','G','S','M','"','\n',};
unsigned char ATC2[20] = {'A','T','+','C','M','G','F','=','1','\n',};
unsigned char ATC3[23] = {'A','T','+','C','M','G','S','=','"','+','9','1','9','6','5','7','7','9','9','0','6','"','\n',};
unsigned char Msg1[24] = "This is My GSM Practical" ;
 

void Delay()
{
int i,j;
 for(i=0;i<1000;i++)
 for(j=0;j<1000;j++);
}

void UART0_SendByte(unsigned char data)	  
{  
   U0THR = data;				    
   while((U0LSR&0x40)==0);    
}

void UART0_SendString(unsigned char *Str)	  
{  
   do{
   UART0_SendByte(*Str);
   Str++;
   }while(*Str);    
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


unsigned char UART0_recievedStr()
{
while(!(U0LSR & 0x1));
return U0RBR;
}

Init_GSM()
	{				
	UART0_SendString(ATC1);
	UART0_SendByte(End_Line);
	Delay();
	UART0_SendString(ATC2);
	UART0_SendByte(End_Line);
	Delay();
	UART0_SendString(ATC3);
	UART0_SendByte(End_Line);
	Delay();
	UART0_SendString(Msg1);
	Delay();
	UART0_SendByte(End_Str);  	 
	}
int  main(void)
{  
   PINSEL0 = 0x00050005;		    
   Init_UART0();
   Init_GSM();
   while(1);
}




