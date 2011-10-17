#include <stdio.h>
#include <stdlib.h>

int eax, ebx, ecx, edx, esi, edi ;
unsigned char M[10000] ;

void exec() {
	eax = *(int*)&M[ebx] ; // gets the first element and assigns to eax
	printf("eax = %d\n", eax);
	edx = ebx ;
	loop:
		edx += 1 ;
		if ( edx < ecx ) goto then_branch;
		goto return_p ;
	then_branch:
		esi = *(int*)&M[edx] ;
		if ( esi < eax ) goto then_branch2 ;
		goto loop ;
	then_branch2:
		eax = esi ;
		goto loop ;
	return_p:{}
}

int main() {
	// assume 'a' is the given array of integers
	// assume ecx is given
	int a[] = {11,51,23,66,34};
	ecx = 5;
	ebx = (int*)memcpy(M[2000], a, ecx*4);
	printf("ebx = %d\n", ebx);
	//printf("ebx = %d\n", ebx);
	// multiply by 4 because int is 4bytes
	exec();
	printf("Mininum = %d\n", eax);
	return 0;
}