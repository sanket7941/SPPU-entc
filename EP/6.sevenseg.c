#include "LPC1768_Includes.h" 

#define SEG1   1<<8				 
#define SEG2   1<<9

#define ONE     0x06			 
#define TWO     0x5B
#define THREE   0x4F
#define FOUR    0x66
#define FIVE    0x6D
#define SIX     0x7D
#define SEVEN   0x07
#define EIGHT   0x7F
#define NINE    0x6F
#define ZERO    0x3F


void delay(unsigned int time)
{
unsigned int i,j;
	for(i = 0; i < time ;i++ )
	{
		for(j = 0; j < 5000 ; j++);
	}
}


int main(void)
{
unsigned char segData[10] = {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE};

unsigned char i = 15,j;
  
  PINSEL0  = 0;		
  FIO0DIR = 0x3FF;	
  FIO0SET = 0x3FF;	
 while(1)
	{
	for(i =0 ; i < 99 ; i++ )
	{
		for(j=0; j<30; j++)
		{
			FIO0SET = SEG1;			  
			FIO0CLR = SEG2;

	
			FIO0CLR = segData[i/10];	
			delay(20);					
			FIO0SET = segData[i/10];

			FIO0CLR = SEG1;				
			FIO0SET = SEG2;

			FIO0CLR = segData[i%10];	
			delay(20);					
			FIO0SET = segData[i%10];
		}

	}
 }
return 0;
}
