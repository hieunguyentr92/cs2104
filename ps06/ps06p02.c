// HENG LOW WEE
// U096901R
// Problem Set 6 Problem 2

#include <stdio.h>
// builds a string showing the sequence of moves that
// solves the towers of hanoi puzzle -- moving all discs // from peg 'a' to peg 'b' using peg 'c' as aux
// n is the number of discs, and assumed to be less than 10 
void hanoi(char ** p, int n, int a, int b, int c) {
	if ( n == 0 ) return ;
	hanoi(p,n-1,a,c,b) ;
	**p = '0'+(char)a ;
	(*p) ++ ;
	**p = ' ' ;
	(*p) ++ ;
	**p = 't' ;
	(*p) ++ ;
	**p = 'o' ;
	(*p) ++ ;
	**p = ' ' ;
	(*p) ++ ;
	**p = '0'+(char)b ;
	(*p) ++ ;
	**p = '\n' ;
	(*p) ++ ;
	hanoi(p,n-1,c,b,a) ;
}

int eax,ebx,ecx,edx,esi,edi;
unsigned char M[10000];

void exec() {
	// do something
}

int main() {
	char a[1000] ; // string buffer
	char *p = a ; // current position in string 
	hanoi(&p,4,1,2,3) ; // build the string of moves for 4 discs 
	*p = '\0' ; // terminate the string
	printf(a) ; // string could be printed, but not in VAL code

	exec();
	return 0;
} 