#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// pre:
// post: outputs the converted currency given an int option to decide conversion direction.
void currencyConverter(int option) {
	float money;
	float exRate;
	printf("Enter amount in %s: ", option == 1 ? "dollars" : "foreign currency"); // uses ternary operator ?: to decide string to output.
	scanf(" %f", &money); // takes in the user input and stores value in the variable. needs ampersand(pointer) to avoid a segmentation fault error.
	printf("What is the exchange rate? ");
	scanf(" %f", &exRate);
	printf("%.2f equals %.2f in %s.", money, money * exRate, option == 1 ? "US dollars" : "the foreign currecy");
}

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

