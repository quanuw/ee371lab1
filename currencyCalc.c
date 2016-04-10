/*
REQUIREMENTS:
	Abstract: A program that will convert a given currency to an amount in a foreign
	currency using a given exchange rate.

	Introduction: Design a currency calculator.

	Inputs: Exhange rate to convert between currencies and initial amount of money.

	Outputs: Value of foreign currency.

	Major Functions: Convert currency.

Specifications:
	Abstract: Converts currencies given a exchange rate an intial currency amount
	as floats.

	Introduction: In order to convert currecies efficiently we will design a
	calculator that converts currencies with 2 decimal precision.

	Inputs: Exchange rates and initial amount of currency as floats. Floats will
	be restricted to a max of 3.4028234664e+38 and minimum of 1.1754943508e-38.

	Outputs: Amount of foreign or US currency as a float with 2 decimal precision.

	Major Function: A currency converting program that allows the user to convert
	from USD to foreign currency or vice versa. Program will also ask for Exchange
	rate and initial amount.
*/



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
