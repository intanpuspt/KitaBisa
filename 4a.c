#include <stdio.h>

void main()
{
    int n, a = 2, i;

    printf("\nEnter the first N prime numbers :  ");
    scanf("%d", &n);
    
    while(n){
        for(i = 2; i <= a; i++)
            if(a % i == 0)
                break;
        
        if(i == a){
            printf("%d, ", a);
            n--;
        }
        a++;
    }
}