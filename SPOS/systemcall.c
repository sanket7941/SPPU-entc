#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main()
{
	char path[50],list[20],command[20];
	printf("Enter the path of the folder\n");
	scanf("%s",&path);
	printf("enter listing command\n");
	__fpurge(stdin);
	gets(list);
	strcpy(command,list);
	printf("command=%s\n",command);
	strcat(command," ");
	printf("list of files in directory %s\n",path);
	strcat(command,path);
	system(command);
	printf("\n");

}

OUTPUT:

Enter the path of the folder
/home/student/Desktop/Karan
enter listing command
ls -l
command=ls -l
list of files in directory /home/student/Desktop/Karan
total 48
-rwxrwxr-x 1 student student 9050 Sep 18 14:13 a.out
-rw-rw-r-- 1 student student  315 Jun 27 14:55 fifth.c~
-rw-rw-r-- 1 student student  230 Jun 27 13:43 first.c~
-rw-rw-r-- 1 student student  148 Jun 27 14:22 fourth.c~
drwxrwxr-x 3 student student 4096 Jul 25 14:13 Practicals
-rw-rw-r-- 1 student student  178 Jun 27 14:00 second.c~
drwxrwxr-x 2 student student 4096 Jul  4 14:12 simple programs
-rw-rw-r-- 1 student student  424 Sep 18 14:13 systemcall.c
-rw-rw-r-- 1 student student  426 Sep 18 14:13 systemcall.c~
-rw-rw-r-- 1 student student  420 Jun 27 14:07 third.c~

