#include <stdio.h>

typedef struct { unsigned r0,r1,r2,r3; } return_type;
extern int uml_64to128 (unsigned long long i, unsigned long long j, return_type* rcv);

int main ()
{
    unsigned long long a, b;
    return_type r;

    scanf("%llu", &a);
    scanf("%llu", &b);
    uml_64to128(a, b, &r);

    printf("0X%08x%08x%08x%08x\n", r.r3, r.r2, r.r1, r.r0);
    return 0;
}