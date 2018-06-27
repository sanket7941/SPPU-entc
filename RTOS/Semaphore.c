
#include"config.h"
#include"stdlib.h"
#include<LPC21XX.h>
#include<lcd.h>
#include<key.h>

OS_STK Task1Stack[100];
void Task1(void *pdata);

OS_STK Task2Stack[256];
void Task2(void *pdata);

static OS_EVENT *semaphore;

int main(void)
.
{
	//keyinit();
	LCDInit();
	lcdcmd(0x80);

	OSInit();
	semaphore=OSSemCreate(1);
	if(semaphore!=NULL)
	{
		DisplayLCD("Sema created",15);
	}
	else
	{
		DisplayLCD("Sema not created",20);
	}
    	delay();
	clrscreen();
	delay();

	OSTaskCreate(Task1,(void *)0,&Task1Stack[99],0);
	OSTaskCreate(Task2,(void *)0,&Task2Stack[255],1);

	OSStart();
	return 0;
}

void Task1(void *pdata)
{
	int n,i;
	char err;
	pdata=pdata;
	LCDInit();

	while(1)
	{
		OSSemPend(semaphore,1,&err);
		clrscreen();
		DisplayLCD("Task1:Sem taken",15);
		for(i=0;i<900000;i++);
		clrscreen();
		for(i=0;i<900000;i++);
		OSSemPost(semaphore);
		OSTimeDly(100);
	}
}

void Task2(void *pdata)
{
	int n,i;
	char err;
	pdata=pdata;
	LCDInit();

	while(1)
	{
		OSSemPend(semaphore,1,&err);
		DisplayLCD("Task1:Sem released",20);
		clrscreen();
		DisplayLCD("Task2:Sem taken",20);
		for(i=0;i<900000;i++);
		clrscreen();
		DisplayLCD("Task2: Sem released",20);
		for(i=0;i<900000;i++);
		OSSemPost(semaphore);
		OSTimeDly(100);
	}
}


