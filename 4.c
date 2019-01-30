#include <stdio.h>
int isprime(int n)
{
	int j=2,flag=0;
	while(j<n)
	{
		while(n%j==0)
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
		return 1;
	}
	else 
		return 0;
		flag=0;
}
int nearestprime(int n)
{
	int i=n,j=n,res;
	while(j!=0)
	{
		if(isprime(i++))
		{
			res=i;
			return res;
		}
		if(isprime(j--))
		{
			res=j;
			return res;
		}
	}
}
int main()
{
	int n=9;
	int c=3,v;
	printf("1.for checking prime \n 2.for checking odd or even\n3.nearestprime\n");

	switch (c)
	{
		case 1:
			if(isprime(n)==1)
			{
				printf("%d is prime",n);
			}
			else{
				printf("%d is not prime",n);
			}
			break;
		case 2:
			if(n%2==0)
			{
				printf("%d is even",n);
			}
			else{
				printf("%d is odd",n);
			}
			break;
		case 3:
				
				v=nearestprime(n);
				printf("%d nearestprime",v);
		default:
			printf("Enter valid choice");
			break;
	}
}