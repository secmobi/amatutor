#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void donuts() {
	puts("Donuts...");
	exit(0);
}

void vuln(char *arg) {
	char buff[10];
	strcpy(buf, arg);
}

int main(int argc, char **argv) {
	vuln(argv[1]);
	return 0;
}
