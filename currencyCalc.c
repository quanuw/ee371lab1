#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Chnage 
void main() {
	setbuf(stdout, NULL);
	int whatToDo = 0;
	float money = 0;
	float exchangeRate = 0;
	printf("\n");
	printf("Enter an option.\n");
	printf("1. convert dollars to foreign currency.\n");
	printf("2. convert foreign currency to dollars.\n");
	printf("Please enter an option: ");
	scanf(" %d", &whatToDo);
	if (whatToDo == 1) {
		printf("Enter amount in money: ");
		scanf(" %f", &money);
		printf("What is the exchange rate? ");
		scanf(" %f", &exchangeRate);
		printf("%.2f equals %.2f in the foreign currency.\n", money, money * exchangeRate);
	} else if (whatToDo == 2) {
		printf("Enter amount in foreign currency: ");
		scanf(" %f", &money);
		printf("What is the exchange rate? ");
		scanf(" %f", &exchangeRate);
		printf("%.2f equals %.2f in US dollars.\n", money, money * exchangeRate);
	} else {
		printf("Please choose option 1 or 2.\n");
	}
}