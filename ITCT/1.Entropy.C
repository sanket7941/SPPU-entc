
#include<stdio.h>
#include<conio.h>
#include<math.h>
#include<stdlib.h>

int i,j,r,c;
float a[5][5],b[5],d[5];
float Hxy=0,Hx=0,Hy=0,mutual=0;

void main()
{
	clrscr();

	printf("\nEnter number of rows & columns of Joint Matrix");
	scanf("%d%d",&r,&c);

	printf("\nEnter Matrix Elements");

	for(i=0;i<r;i++)
	{
		for(j=0;j<c;j++)
		{
			scanf("%f",&a[i][j]);
		}
	}

	for(i=0;i<r;i++)
	{
		for(j=0;j<c;j++)
		{
			printf("  %f  ",a[i][j]);
		}
		printf("\n");
	}

	for(i=0;i<r;i++)   //input probability px
	{
		b[i]=0;
		for(j=0;j<c;j++)
		{
			b[i]=b[i]+a[i][j];
		}
	}

	for(j=0;j<c;j++)   //output probability py
	{
		d[j]=0;
		for(i=0;i<r;i++)
		{
			d[j]=d[j]+a[i][j];
		}
	}

	printf("\n\n");
	for(i=0;i<r;i++)
	printf(" %f ",b[i]);

	printf("\n");
	for(i=0;i<c;i++)
	printf(" %f ",d[i]);

	for(i=0;i<r;i++)  //input entropy
	{
		Hx=Hx+((b[i]*log10(1/b[i]))/log10(2));
	}
	printf("\nInput Entropy %f",Hx);

	for(j=0;j<c;j++)   //output entropy
	{
		Hy=Hy+((d[j]*log10(1/d[j]))/log10(2));
	}
	printf("\nOutput Entropy %f",Hy);

	for(i=0;i<r;i++)    //joint matrix entropy
	{
		for(j=0;j<c;j++)
		{
			Hxy=Hxy+((a[i][j]*log10(1/a[i][j]))/log10(2));
		}
	}
	printf("\nEntropy of Joint Matrix %f",Hxy);

	mutual = Hx+Hy-Hxy;    //mi
	printf("\n\nM.I = %f",mutual);

	if(Hx==Hy&&Hy==Hxy)
	{
		printf("\nIdeal channel");
	}
	else if(mutual==0)
		printf("|nUseless Channel");
	else
		printf("\nLossy Chhanel");


	getch();
}

/*

Enter number of rows & columns of Joint Matrix2 2

Enter Matrix Elements.5 .25 .08 .16
  0.500000    0.250000
  0.080000    0.160000


 0.750000  0.240000
 0.580000  0.410000
Input Entropy 0.805413
Output Entropy 0.983192
Entropy of Joint Matrix 1.714525

M.I = 0.074079
Lossy Chhanel*/
