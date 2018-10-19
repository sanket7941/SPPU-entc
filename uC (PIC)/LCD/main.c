// name:-sanket naik
#include <P18F452.h>
#include "lcd.h"
void main(void)
{
   Init_LCD();
	while(1)
		{
 		Lcd_Msg(1,0,"all we know");
 		Lcd_Msg(2,3,"chainsmoker");
		}
	}