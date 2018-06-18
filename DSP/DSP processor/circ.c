#include <stdio.h>
int n1,n2,i,j,n,c,x[10]=0,h[10]=0,y[10]=0,a[10]=0;
main()
{
printf("Enter the length of the sequence n1: ");
scanf("%d",&n1);
printf("Enter the length of the sequence n2: ");
scanf("%d",&n2);
printf("Enter the first sequence: ");
for(i=0;i<n1;i++)
{
scanf("%d",&x[i]);
}
printf("Enter the second sequence: ");
for(i=0;i<n2;i++)
{
scanf("%d",&h[i]);
}
if(n1>n2)
n=n1;
else
n=n2;
a[0]=h[0];
for(i=1;i<n;i++)
{
a[i]=h[n-i];
}
for(j=0;j<n;j++)
{
y[j]=0;
c=x[0];
for(i=0;i<n;i++)
{
y[j]=(y[j]+(x[i]*a[i]));
x[i]=x[i+1];
}
x[n-1]=c;
printf("result is %d /n",y[j]);
}
}