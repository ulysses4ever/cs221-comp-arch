// demodiv.c
// Divide each element in array and print.
//
// To build:
//      gcc -m32 demodiv.c
//
// To generate assembly:
//      gcc -S -m32 demodiv.c -masm=intel -fno-asynchronous-unwind-tables
//
// To disassemble binary:
//       objdump -d --disassembler-options=intel a.out > demodiv.s

#include <stdio.h>

int a[] = {8,-3,-6,1};

int one() {return 1;}

int main() {
    int i, *p;
    for (i = 0, p = a; i < 4; ++i, ++p)
        printf("%d\n",*p / one());
}
