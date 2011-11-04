// HENG LOW WEE
// U096901R
// CS2104 Tut 10 Question 1

#include <stdio.h>
#include <setjmp.h>

int no_exception = 0;
int exception1 = 1;
int exception2 = 2;
int exception3 = 3;

struct Exception {
	int exception_type;
	char * msg;
};

struct Exception e;
jmp_buf * pop();
jmp_buf * push();

struct ExceptionExample {
	
};

// void ExceptionExample_first (struct Exception * e, int a, int b) {
	
// }

// void ExceptionExample_second (struct Exception * e, int b) {
// 	if (e->b==1) 
// 	if (e->b==2)
// 	printf("In second\n");
// }

int main (int argc, char *argv[]) {
	if (!setjmp(*push())) {
		first(atoi(argv[1],atoi(argv[2])));
		printf("This might not get printed\n");
	}
	else {
		switch ( Exception.exception_type ) {
			case exception1:
				printf(Exception.msg);
				goto finally_clause;

			case exception2:
				printf(Exception.msg);
				goto finally_clause;

			default:
				break;

			finally_clause:
				if (Exception.exception_type != no_exception) {
					longjmp(pop(),1);
				}
		}	
	}
	return 0;
}