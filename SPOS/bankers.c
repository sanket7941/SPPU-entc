#include<stdio.h>
void main()
	{
	int n,n1,i,I[3],j,al[5][5],max[5][5],sum[5],ava[5],need[5][5],k=0,com=0,fl,fin,pat[5];
	printf("Enter number of resources:");
	scanf("%d",&n);	
	printf("Enter resource instances:\n");
	for(i=0;i<n;i++)
		{
		scanf("%d",&I[i]);
		}
	printf("Enter number of processes:");
	scanf("%d",&n1);
	printf("Enter allocation matrix:\n");
	for(i=0;i<n1;i++)				//for rows
		{		
			for(j=0;j<n;j++)		//for columns
			{
			scanf("%d",&al[i][j]);		//for allocation matrix
			}
		}

	printf("Enter maximum chain matrix:\n");
	for(i=0;i<n1;i++)			//maximum chain
		{		
			for(j=0;j<n;j++)
			{
			scanf("%d",&max[i][j]);
			}
		}

	for(j=0;j<n;j++)			//calculates available matrix
		{
			sum[j]=0;
			for(i=0;i<n1;i++)
			{
			sum[j]=sum[j]+al[i][j];
			}
		ava[j]=I[j]-sum[j];
		}

	for(i=0;i<n1;i++)			//calculate need matrix
		{
		for(j=0;j<n;j++)
			{
			need[i][j]=max[i][j]-al[i][j];
			}
		}

	printf("\nAvailable matrix:\n");
	for(i=0;i<n;i++)			//print available matrix
		{
			printf("%d\t",ava[i]);
		}

	printf("\nNeed matrix is:\n");
	for(i=0;i<n1;i++)			//print need matrix
		{
		for(j=0;j<n;j++)
			{
			printf("%d\t",need[i][j]);
			}
			printf("\n");
		}
	
	do
	{
	for(i=0;i<n1;i++)
		{
		fl=0;
		fin=0;
		for(j=0;j<n;j++)
			{
			if(need[i][j]<=ava[j])
			fl++;
			if(need[i][j]==0)
			fin++;
			}
		if(fl==n && fin!=n)
			{
			for(j=0;j<n;j++)
			{
			ava[j]=ava[j]+al[i][j];
			max[i][j]=0;
			al[i][j]=0;
			need[i][j]=0;
			}
		com++;
		pat[k]=i;
		k++;
		break;
		}
	}
	}while(com<n1);
	printf("\nSafe sequence is: ");
	for(i=0;i<n1;i++)
	printf("P%d ",pat[i]+1);
	}


/*
OUTPUT:
Enter number of resources:3
Enter resource instances:
13
7
10
Enter number of processes:4
Enter allocation matrix:
2 1 1
7 2 3
3 2 2
1 1 3
Enter maximum chain matrix:
4 3 3
7 2 4
4 2 5
5 3 3
Available matrix:
0	1	1	
Need matrix is:
2	2	2	
0	0	1	
1	0	3	
4	2	0	

Safe sequence is: P2 P1 P3 P4
*/




