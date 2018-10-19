//name sanket naik


#include <P18F452.h>
#include "lcd.h"
#define COL PORTB
#define ROW PORTB
unsigned char colloc,rowloc;
unsigned char keypad[4][4] = {
							 {'0','1','2','3'},
                             {'4','5','6','7'},
                             {'8','9','A','B'},
                             {'C','D','E','F'}
							 };

void main(void)
{
	TRISB=0x00;				//Initialize PORTB as output port
   	Init_LCD();

 	Lcd_Msg(1,0,"PRAVIN G GAWANDE");
 	Lcd_Msg(2,0,"ROLL NO.:");

	COL = 0xF0; 		//initialize columns as input

	while(1)
     {
      do
        {
         ROW = 0xF0;			//Ground all rows
         colloc = COL;			//read all columns
         colloc &= 0xF0;		//mask unused bits in colloc,get only column bits
        }while(colloc != 0xF0);	//if any key press, check for all keys open
         
	
       	do //all keys open
      	{
  			do
            {
      		 MSDelay(20);		//call some delay
             colloc = COL;		//read all columns
             colloc &= 0xF0;    //mask unused bits in colloc,get only column bits                     
            }while(colloc == 0xF0);//check for any  keys pressed
          	
         MSDelay(20);			//if key pressed wait for debouncing
         colloc = COL;			//once again read all columns to check same key detection after debouncing
         colloc &= 0xF0;		//mask unused bits in colloc,get only column bits
        }while(colloc == 0xF0);	//check for any  keys pressed,confirmation of same key
         
//Ground each row step by step to detect the key from respective row//
         while(1)
            {
             ROW = 0xFE; 		//ground  row zero i.e. 11111110
             colloc = COL;		//read column from that respective row zero
             colloc &= 0xF0;	//mask unused bits in colloc,get only column bits
             if(colloc != 0xF0) //if key detected from row zero
               {
                rowloc = 0;		//get the address of row zero location
                break;			//go to find out actual ke from row zero location
               }
                ROW = 0xFD; 	//if key not detected from row zero gruond next row 1 i.e.11111101
                colloc = COL;	//read column from that respective row one
                colloc &= 0xF0;	//mask unused bits in colloc,get only column bits
                if(colloc != 0xF0)	//if key detected from row one
                  {
                   rowloc = 1;	//get the address of row one location 
                   break;		//go to find out actual ke from row one location
                  }
                   ROW = 0xFB;	//if key not detected from row one ground next row 2 i.e.11111011 
                   colloc = COL;//read column from that respective row two
                   colloc &= 0xF0;
                   if(colloc != 0xF0)	//if key detected from row one
                     {
                      rowloc = 2;		//get the address of row two location
                      break;			//go to find out actual ke from row one location
                     }
                      ROW = 0xF7;//if key not detected from row two ground next row 3 i.e.11110111
                      colloc = COL;		//read column from that respective row three
                      colloc &= 0xF0;
                      rowloc = 3;		//get the address of row three location
                      break;
                     }
                                                            
      	if(colloc == 0xE0)  		//check whether key from zero column
      	LCD_Data(keypad[rowloc][0]);  //get the ASCII code of that key and send it to LCD                                  
 
      	if(colloc == 0xD0)		//check whether key from first column
      	LCD_Data(keypad[rowloc][1]);	//get the ASCII code of that key and send it to LCD
                                                            
		if(colloc == 0xB0)		//check whether key from second column
        LCD_Data(keypad[rowloc][2]);	//get the ASCII code of that key and send it to LCD
                                                            
		if(colloc == 0x70)		//check whether key from last column
        LCD_Data(keypad[rowloc][3]);	//get the ASCII code of that key and send it to LCD
      }
	}