#include <stdio.h>

int konversiJam(int totalMenit) {
    return totalMenit / 60;
}

int sisaMenit(int totalMenit) {
    return totalMenit % 60;
}

int main() {
    int totalMenit;
    if (scanf("%d", &totalMenit) != 1) return 0;

    if (totalMenit < 0 || totalMenit > 1440) return 0; 

    int jam = konversiJam(totalMenit);
    int menit = sisaMenit(totalMenit);

    printf("%d jam %d menit\n", jam, menit);

    return 0;
}
