#include<LPC22xx.h>	
void delay(void)
{
	int j;
	for(j=0;j<1000000;j++);

}				
int main(void)
{
	unsigned int i;                      

  IODIR1 = 0x00FF0000;                     

  while (1) 
  {		for (i = 1<<16; i < 1<<23; i <<= 1)
   {  
      IOSET1 = i;                         
      delay(); 
	  IOCLR1 = i;                   
	  }
    for (i = 1<<23; i > 1<<16; i >>=1 ) 
	{  		IOSET1 = i;  
      delay();                             
      IOCLR1 = i;                         
    }
  }
}
																			