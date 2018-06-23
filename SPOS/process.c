/* Includes */
#include <unistd.h>     /* Symbolic Constants */
#include <sys/types.h>  /* Primitive System Data Types */ 
#include <errno.h>      /* Errors */
#include <stdio.h>      /* Input/Output */
#include <sys/wait.h>   /* Wait for Process Termination */
#include <stdlib.h>     /* General Utilities */
 
int main()
{
    pid_t childpid; /* variable to store the child's pid */
    int status;     /* parent process: child's exit status */

    /* only 1 int variable is needed because each process would have its
       own instance of the variable
       here, 2 int variables are used for clarity */
        
    /* now create new process */
    childpid = fork();
    
    if (childpid >= 0) /* fork succeeded */
    {
    	if (childpid == 0) /* fork() returns 0 to the child process */
        {
        	printf("CHILD: I am the child process!\n");
            	printf("CHILD: Here's my PID: %d\n", getpid());
            	printf("CHILD: My parent's PID is: %d\n", getppid());
                printf("CHILD: Sleeping for 1 second...\n");	
	    	sleep(1); 
      	    	printf("Child: Now, I woke up and am executing date command \n\n");
      	    	execl("/bin/date", "date", 0, (char*)0);
            	perror("execl() failure!\n\n");

        }
        else /* fork() returns new pid to the parent process */
        {
        	printf("PARENT: I am the parent process!\n");
            	printf("PARENT: Here's my PID: %d\n", getpid());
	        printf("PARENT: The value of my copy of childpid is %d\n", childpid);
            	printf("PARENT: I will now wait for my child to exit.\n");
            	wait(&status); /* wait for child to exit, and store its status */
            	printf("PARENT: Child's exit code is: %d\n", WEXITSTATUS(status));
            	printf("PARENT: Goodbye!\n");             
            	exit(0);  /* parent exits */       
        }
    }
    else /* fork returns -1 on failure */
    {
    	perror("fork"); /* display error message */
        exit(0); 
    }
}


OUTPUT:
PARENT: I am the parent process!
CHILD: I am the child process!
PARENT: Here's my PID: 2282
PARENT: The value of my copy of childpid is 2283
CHILD: Here's my PID: 2283
PARENT: I will now wait for my child to exit.
CHILD: My parent's PID is: 2282
CHILD: Sleeping for 1 second...
Child: Now, I woke up and am executing date command 

Sun Sep 18 14:20:04 IST 2016
PARENT: Child's exit code is: 0
PARENT: Goodbye!

