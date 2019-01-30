#include<stdio.h>
int main()
{
	int i=2,a[50],flag=0,j;
	while(i<100)
	{
		j=2;
		while(j<i)
		{
			while(i%j==0)
			{
				flag=1;
				break;
				j++;
			}
			if(flag==1)
			{
				break;
			}
			j++;
		}
		if(flag==0)
		{
			printf("%d ",i);
		}
		flag=0;
		i++;
	}
}