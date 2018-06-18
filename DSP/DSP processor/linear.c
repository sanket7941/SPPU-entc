#include<stdio.h>
int x[15],h[15],y[15];
main()
{
int i,j,m,n;
printf("\n Enter value for m");
scanf("%d",&m);
printf("\n Enter value for n");
scanf("%d",&n);
printf("Enter values for input x(n)\n");
for(i=0;i<m;i++)
scanf("%d",&x[i]);
printf("Enter values for input h(n)\n");
for(i=0;i<n;i++)
scanf("%d",&h[i]);
//Padding of Zeros//
for(i=m;i<=m+n-1;i++)
x[i]=0;
for(i=n;i<=m+n-1;i++)
h[i]=0;
//Convolution Operation//
for(i=0;i<m+n-1;i++)
{
y[i]=0;
for(j=0;j<=i;j++)
{
y[i]=y[i]+(x[j]*h[i-j]);
}
//Displaying the Output//
}
for(i=0;i<m+n-1;i++)
printf("\n The value of Output y[%d]=%d",i,y[i]);
}
