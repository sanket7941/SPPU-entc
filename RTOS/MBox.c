#include "config.h"
#include "stdlib.h"
#include "LPC21XX.h"
#include "lcd.h"
#include "key.h"


//   Keyboard Symbols     0   1    2   3
//						  4   5    6   3
//						  8	  9	   :   ;
//						  <   =    >   ? 




OS_STK Task1Stack[100];
OS_STK Task2Stack[100];

void Task1(void *pdata);
void Task2(void *pdata);

static OS_EVENT *mbox;

char key;
char *msg;

void Delay( void)
{
	int i,j;
	for(i=0;i<1000;i++)
	for(j=0;j<1000;j++);
	}

int main(void)
{
	char *msg;
	keyinit();
	LCDInit();
	clrscreen();
	OSInit();
	mbox=  (OS_EVENT *)OSMboxCreate((char *)msg);
	OSTaskCreate(Task1,(void*)0,&Task1Stack[99],3);
	OSTaskCreate(Task2,(void*)0,&Task2Stack[256],4);
	OSStart();
	return 0;
}

void Task1(void *pdata)
{
	int i;
	char key, txmsg[5]="VIIT0";
 	pdata=pdata;

	while(1)
	{
		clrscreen();
		DisplayLCD("Task1:press any key",16);

		while((key=keyread())==0);
		key=key+0x030;

		lcdcmd(0xC0);
		lcddata(key);
		Delay();

		txmsg[4]=key;
		OSMboxPost(mbox,(char *)txmsg);
		OSTimeDly(100);
	}
}

void Task2(void *pdata)
{
	unsigned char err;
	int i;
	char *rxmsg;

	pdata=pdata;
	while(1)
	{
		rxmsg = OSMboxPend(mbox,0,&err);
  		clrscreen();
		lcdcmd(0xC9);
		DisplayLCD(rxmsg,5);
		while((key=keyread())!=15);

		OSTimeDly(100);
	}
}

