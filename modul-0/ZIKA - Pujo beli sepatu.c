#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() {
    int n;
    int a, b, c, d;

    // Baca n
    if (scanf("%d", &n) != 1) return 0;

    // Baca a, b, c, d (bisa dipisah spasi/enter; scanf akan tetap bisa)
    if (scanf("%d %d %d %d", &a, &b, &c, &d) != 4) return 0;

    // Kalikan dan cetak dalam format 2x2
    printf("%d %d\n", a * n, b * n);
    printf("%d %d\n", c * n, d * n);

    return 0;
}
