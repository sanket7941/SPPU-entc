#include "LPC214x.h"
#include "UART.h"

#define EEPROM_Addr 0xA0
#define I2Cwrite	0x00
#define I2Cread		0x01

#define I2C_ENABLE 	1 << 6
#define I2C_START	1 << 5																			              
#define I2C_STOP 	1 << 4
#define I2C_SI		1 << 3
#define I2C_AACK  	1 << 2

unsigned char status,i;
unsigned char write_array[10] = {0x04,0x2A,0x63,0x9D,0x10,0xB6,0x82,0x94,0x39,0xC5};
unsigned char read_array[10];


void I2CInit(void)
{
	PINSEL0 &= 0xFFFFFF0F;		
	PINSEL0 |= 0x00000050;
	
	I2C0CONCLR  = I2C_ENABLE | I2C_START | I2C_STOP | I2C_SI | I2C_AACK;	
	
	
	I2C0SCLH = 0x4B ;							
	I2C0SCLL = 0x4B ;							
	I2C0CONSET = I2C_ENABLE ;					
}										


void I2CStart(void)
{
int status;	
I2C0CONCLR = (I2C_START | I2C_STOP | I2C_SI | I2C_AACK); 	
I2C0CONSET = (I2C_ENABLE );					 		  		
I2C0CONSET = (I2C_START);					  				
while(!((status=I2C0CONSET)& 0x08));
}


void I2CStop(void)
{	
 I2C0CONSET = I2C_STOP;	
 I2C0CONCLR = I2C_START | I2C_SI | I2C_AACK;				
}


void I2Csend(unsigned char data)
{	
	I2C0DAT = data;
	I2C0CONCLR = I2C_START | I2C_STOP ;					 
	I2C0CONCLR = I2C_SI;									
	while(!((status=I2C0CONSET)& 0x08));
}

unsigned char I2Cget(unsigned int ack)
{
 unsigned char data;

I2C0CONCLR = (I2C_START | I2C_STOP );					
I2C0CONSET = (I2C_AACK);
I2C0CONCLR = I2C_SI;									
while(!((status=I2C0CONSET)& 0x08));
data = I2C0DAT;
return data;
}


int main()
{
UartInit(9600);
printf("\nI2C EEPROM\n\n");
I2CInit();
printf("Writing Data.....\n");
for(i=0;i<10;i++)
	printf("write_array[%d] = 0x%02X\n",i,write_array[i]);		   

 
I2CStart();
I2Csend(EEPROM_Addr | I2Cwrite);
I2Csend(0x13);		   		
I2Csend(0x49);					
for(i=0;i<10;i++)
	I2Csend(write_array[i]); 	
I2CStop();


I2CStart();
I2Csend(EEPROM_Addr | I2Cwrite);
I2Csend(0x13);				
I2Csend(0x49);			 	

printf("\nReading.....\n");

I2CStart();
I2Csend(EEPROM_Addr | I2Cread);
for(i=0;i<10;i++)
	read_array[i] = I2Cget(i); 
I2CStop();
for(i=0;i<10;i++)
	printf("read_array[%d] = 0x%02X\n",i,read_array[i]);		


while(1);	 		
return 0;
}
