#include <LPC22xx.H>
#include "lcd.h"
int val,val1,temp,tempb,i,adcdata,p;     
char adc_data[4],data1;
main(void)
{ 
        Init_LCD();
	Lcd_Msg(1,1,"value="); 
	PINSEL1 &= 0xFF0FFFFF;			
	PINSEL1 |= 0x00400000;
	   
  	VPBDIV= 0x02;  			 
    
  	ADCR=0x00210701;      
        while(1)
	{  
    
	lcd_command(0x86);                           
	adcdata=(ADDR & 0x0000FFC0);     
        adcdata=adcdata>>6;                      
        p=(adcdata & 0x300);
        p=p>>8;	      
        data1= p+0x30;                  
        lcd_display(data1);
        p=(adcdata & 0x0f0);
 	p=p>>4;
  	if(p<0x0a)          
        data1=p+(0x30);                 
        else
        data1=p+(0x57);                  
 	lcd_display(data1);
  	p=(adcdata & 0x00f);
 	if(p<0x0a)
  	data1=p+(0x30);
        else
        data1=p+(0x57);
 	lcd_display(data1); 

	} 
}

