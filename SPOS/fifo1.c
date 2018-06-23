#include<stdio.h>

int main()
{
	int res_set[10],cur_loc,loc,loc1,page_seq[30],res_set_size,page_no,flg,fault_cnt;
	char opt='Y';
	do
	{
		cur_loc=-1;
		fault_cnt=0;
		printf("\nEnter the size of the resident set : ");
		scanf("%d",&res_set_size);
		for(loc=0;loc<res_set_size;loc++)
			res_set[loc]=-1;
		printf("\nEnter the number of pages in the page sequence : ");
		scanf("%d",&page_no);
		for(loc=0;loc<page_no;loc++)
		{
			printf("\nEnter page %d :",loc+1);
			scanf("%d",&page_seq[loc]);
		}
		for(loc1=0;loc1<page_no;loc1++)
		{
			flg=-1;
			if(cur_loc!=-1)
			{
				for(loc=0;loc<res_set_size;loc++)
					if(res_set[loc]==page_seq[loc1])
						//printf("\n \tPage hit");
						break;
				if(loc==res_set_size)
				{
					fault_cnt++;
                                        flg=0;
					if(cur_loc==res_set_size-1)
						cur_loc=0;
					else
						cur_loc++;
					res_set[cur_loc]=page_seq[loc1];
				}
			}
			else
			{
				fault_cnt++;
                                flg=0;
				cur_loc++;
				res_set[cur_loc]=page_seq[loc1];
			}
			printf("\n\nPage being referred : %d ",page_seq[loc1]);
			printf("\nRound %d :",loc1+1);
			for(loc=0;loc<res_set_size;loc++)
				printf("  %d",res_set[loc]);
			if(flg!=-1)
				printf("\t%d Faults now",fault_cnt);
		}
		printf("\nDo you want to continue????????? (Y/N) :");
		scanf("%s",&opt);
	}while(opt=='y' || opt=='Y');
}

/*
OUTPUT:
Enter the size of the resident set : 3

Enter the number of pages in the page sequence : 8

Enter page 1 :
1

Enter page 2 :2

Enter page 3 :3

Enter page 4 :4

Enter page 5 :4

Enter page 6 :5

Enter page 7 :6

Enter page 8 :7


Page being referred : 1 
Round 1 :  1  -1  -1	1 Faults now

Page being referred : 2 
Round 2 :  1  2  -1	2 Faults now

Page being referred : 3 
Round 3 :  1  2  3	3 Faults now

Page being referred : 4 
Round 4 :  4  2  3	4 Faults now

Page being referred : 4 
Round 5 :  4  2  3

Page being referred : 5 
Round 6 :  4  5  3	5 Faults now

Page being referred : 6 
Round 7 :  4  5  6	6 Faults now

Page being referred : 7 
Round 8 :  7  5  6	7 Faults now
Do you want to continue????????? (Y/N) :n
/*
