#include "config.h"
#include "stdlib.h"
#include "key.h"
#include "lcd.h"
#include<LPC21xx.H>

#define	TaskStkLengh 64			
 		
OS_STK	TaskStk1 [TaskStkLengh];		
OS_STK	TaskStk2 [TaskStkLengh];		
OS_STK	TaskStk3 [TaskStkLengh];	

void 	Task1(void *pdata);		
void    Task2(void *pdata);	
void    Task3(void *pdata);	

int main (void)
{

	IODIR1=0x00ff0000;	// LEDs

	OSInit ();	
	OSTaskCreate (Task3,(void *)0, &TaskStk3[TaskStkLengh - 1], 3);
	OSTaskCreate (Task1,(void *)0, &TaskStk1[TaskStkLengh - 1], 5);
	OSTaskCreate (Task2,(void *)0, &TaskStk3[TaskStkLengh - 1], 4);
			
	OSStart ();
	return 0;															
}


void Task2 (void *pdata)
{					 
	pdata = pdata;
	TargetInit();
	LCDInit();
	clrscreen();
	lcdcmd(0x80);
	DisplayLCD("Task2 running",20);
	delay_lcd();
}
 
void Task3 (void *pdata)
{					 
	pdata = pdata;
	TargetInit ();
	LCDInit();
	clrscreen();
	lcdcmd(0x80);
	DisplayLCD("Task3 running",20);
	delay_lcd();
	
	LED_FLASHING();
	OSTimeDly(100);
	Task1(0);
			

} 
  
void Task1 (void *pdata)
{
	pdata = pdata;
	LCDInit();
	clrscreen();
	lcdcmd(0x0c0);
	DisplayLCD("Task1 running",20);
	delay_lcd();

	LED_RUNNING_LIGHT();
	OSTimeDly(100);
		
}

