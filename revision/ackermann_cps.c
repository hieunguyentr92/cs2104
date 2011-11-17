#include <stdio.h>

int ackermann (int m, int n) {
	if (m==0) return n+1;
	else if (m>0 && n==0) return ackermann(m-1,1);
	else return ackermann(m-1, ackermann(m,n-1));
}

int ackermann_cps (int m, int n) {
	int aux (int m, int n, int(*j)(int)) {
		int j1 (int ret) {
			return j(ret);
		}
		if (m==0) return j(n+1);
		else if (m>0 && n==0) return aux(m-1, 1, j1);
		else return aux(m-1, aux(m,n-1,j1), j1);
	}
	int identity(int x) { return x; }
	return aux(m, n, identity);
}

int main () {
	printf("ackermann(3,2) = %d\n", ackermann(3,2));
	printf("ackermann_cps(3,2) = %d\n", ackermann_cps(3,2));
	return 1;
}