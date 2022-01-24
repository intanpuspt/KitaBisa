#include <stdio.h>

int main(void) {
    int angka;
    char huruf[20];
 
    printf("Angka: ");
    scanf("%d",&angka);

    printf("Huruf: ");
    scanf("%s",&huruf);
    
    printf("\n");
    printf("[%d:%s]", angka, huruf);
    printf("\n");
    
    return 0;
}