#include <linux/module.h>    // included for all kernel modules
#include <linux/kernel.h>    // included for KERN_INFO
#include <linux/init.h>      // included for __init and __exit macros

MODULE_LICENSE("GPL");		
MODULE_AUTHOR("MicroEmbedded");
MODULE_DESCRIPTION("A Loadable Hello World module");

static int __init hello_init(void)	//init function for the device driver
{
    printk(KERN_INFO "Hello world!\n");	//kernel print function 
    return 0;    // Non-zero return means that the module couldn't be loaded.
}

static void __exit hello_cleanup(void)	//exit function for the device driver
{
    printk(KERN_INFO "Cleaning up module.Bye\n");
}

module_init(hello_init);
module_exit(hello_cleanup);
