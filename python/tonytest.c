
#include <stdio.h>

int testme(const char * input, int ll, char * output) {
	printf("testme is called! %s\n",input);

	output[0] = 99;

	return 42;
}
