#include "config.h"
#include "stdlib.h"
#include "LPC21XX.h"
#include "lcd.h"
#include "key.h"

OS_STK Task1Stack[100];
OS_STK Task2Stack[100];

void Task1(void *pdata);
void Task2(void *pdata);

OS_EVENT *Message_Queue1;

const char *msg[5]={"Message 1",
     		    "Message 2",
     		    "Message 3",
     		    "Message 4",
     		    "Message 5"  };

char key;

void Delay( void)
{
	int i,j;
	for(i=0;i<1000;i++)
	for(j=0;j<1000;j++);
}

int main(void)
{
	char *msg,*start[10];
	keyinit();
	LCDInit();
	clrscreen();
	OSInit();
	Message_Queue1 = OSQCreate ((void **)&msg, 6);
	OSTaskCreate(Task1,(void*)0,&Task1Stack[99],3);
	OSTaskCreate(Task2,(void*)0,&Task2Stack[256],4);
	OSStart();
	return 0;
}

void Task1(void *pdata)
{
	int i;
	char key, txmsg[8]="VIITPUNE";
 	pdata=pdata;

	while(1)
	{
		clrscreen();
		DisplayLCD("press any key",16);

		while((key=keyread())==0);
		key=key+0x030;

		lcdcmd(0xC0);
		lcddata(key);
		Delay();

		txmsg[4]=key;
		OSQPost(Message_Queue1,(void*)msg[i]);
	
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
		rxmsg = (unsigned char*)OSQPend(Message_Queue1,0,&err);   
		clrscreen();
		lcdcmd(0x80);
		DisplayLCD("TASK1:Messg recd",16); 
		lcdcmd(0xC9);
		DisplayLCD(rxmsg,5);
		while((key=keyread())!=15);

		OSTimeDly(100);
	}
}

