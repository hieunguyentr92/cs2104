// HENG LOW WEE
// U096901R
// Problem Set 5 Problem 3
#include <stdio.h>

// pseudo coding

// function declaration
float halfInterval(char *f, float x1, float x2, float esp);

// main function
float main (int argc, char** argv) {
	char[] f = your function;
	float x1 = <value>;
	float x2 = <value>;
	float esp = <value>;
	float (*ptr)(char *f, float x1, float x2, float esp);
	
	return (*halfInterval)(f,x1,x2,esp);
}

// function definition
float (*halfInterval)(char *f,float x1,float x2,float esp) {
	if (absolute(x1-x2) < esp) {
		return (x1+x2)/2;
	}
	else if ((f x1)*(f (x1+x2)/2) <= 0) {
		return (*halfInterval)(f, x1, ((x1+x2)/2), esp);
	}
	else if ((f x2)*(f (x1+x2)/2) <= 0) {
		return (*halfInterval)(f, ((x1+x2)/2), x2, esp);
	}
}