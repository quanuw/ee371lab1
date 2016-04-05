// This program allows the user to convert an amount of curreny given an exchange rate.

#include <stdio.h>
#include <stdlib.h>

// pre:
// post: outputs the converted currency given an int option to decide conversion direction.
void currencyConverter(int option) {
	float money;
	float exRate;
	printf("Enter amount in %s: ", option == 1 ? "dollars" : "foreign currency");
	scanf(" %f", &money); 
	printf("What is the exchange rate? "); 
	scanf(" %f", &exRate);
	printf("%.2f equals %.2f in %s.", money, money * exRate, 
			option == 1 ? "US dollars" : "the foreign currecy");
}

// pre:
// post: converts a certain amount of currency into a foreign currency.
// prompts for an int input to determine output.
void main() {
	setbuf(stdout, NULL);
	int whatToDo = 0;
	printf("\n");
	printf("Enter an option.\n");
	printf("1. convert dollars to foreign currency.\n");
	printf("2. convert foreign currency to dollars.\n");
	printf("Please enter an option: ");
	scanf(" %d", &whatToDo);
	if (whatToDo == 1 || whatToDo == 2) {
		currencyConverter(whatToDo);
	} else { // user must input a 1 or 2.
		printf("Please choose option 1 or 2.\n");
	}
}

