// HENG LOW WEE
// U096901R
// Tut 7 Ex 1

#include <stdio.h>

int eax, ebx, ecx, edx, esi, edi;
unsigned char M[10000];

void exec() {
	
}

int pascal (int n, int k) {
	if (n==0 || n==k) return 1;
	return pascal(n-1,k) + pascal(n-1,k-1);
}

int main() {
	printf("C pascal(10,5) = %d\n", pascal(10,5));
	exec();
	return 0;
}