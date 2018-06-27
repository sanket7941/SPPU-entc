#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/fcntl.h>
#include <sys/time.h>
#include <string.h>

#include "abd_gpio.h"

#define ON  1
#define OFF 0

gpio_t PortB; 			//gpio data structure

int device_handle;		//device file descriptor(handle)


/*
abd_led_op function:this function will allow the user to switch the  led ON or OFF
Parameters:
unsigned char led_num : the number of the led to switch ON or OFF
unsigned char opr : '0' for OFF and '1' for ON
*/
int abd_led_op(unsigned char led_num, unsigned char opr)
{
     	device_handle = open("/dev/gpio", O_RDWR); 	//open the /dev/gpio device file if success then return the file handle

        if(device_handle == -1 ) 			//if opening file not successful then return the error and quit
	{
               printf("LED gpio device not found \n");
               return -1;
        }

	 ioctl(device_handle,GPIO_SEL,&PortB); 		// the ioclt to use the pins attached to LEDs as gpio
/*
	switch case: options for the led
	case 0: switch all leds
	case 1: switch led LD1
	case 2: switch led LD2
	.
	.
	case 8: switch led LD8		
*/
        switch (led_num)
	{
       case 0:
             PortB.pin  = PB16 | PB17 | PB18 | PB19 | PB20 | PB21 | PB22 | PB23 ; // leds LD1 tru LD8
       		break;

		case 1:
			PortB.pin = PB16;	//led LD1
			break;
		case 2:
			PortB.pin = PB17;	//led LD2
			break;
		case 3:
			PortB.pin = PB18;	//led LD3
			break;
		case 4:
			PortB.pin = PB19;	//led LD4
			break;
		case 5:
			PortB.pin = PB20;	//led LD5
			break;
		case 6:
			PortB.pin = PB21;	//led LD6
			break;
		case 7:
			PortB.pin = PB22;	//led LD7
			break;
		case 8:			
			PortB.pin = PB23;	//led LD8
			break;
	}

        ioctl(device_handle,GPIO_DIR_OUT,&PortB); 		//ioctl to set the direction of the port pins connecting the led
	if (opr == ON)
        	ioctl(device_handle, GPIO_CLEAR, &PortB);	//ioctl to turn ON the LEDs
	else if (opr == OFF)
        	ioctl(device_handle, GPIO_SET, &PortB);		//ioctl to turn OFF the LEDs
        close(device_handle);					//close the file descriptor 
}



int main()
{

 PortB.port = PORT_B;		//use the PORT B as GPIO 
 abd_led_op(0, OFF);		// turn off all leds
 
 printf("\n\nLED BLINKING\n\n");

  while (1)
 {
  abd_led_op(0, ON);		//switch all leds ON
  usleep(100000);
  abd_led_op(0, OFF);		//switch all leds OFF
  usleep(100000);
 }

return 0;
}


