#include <stdio.h>

unsigned long long memo[35];  
unsigned long long catalan(int n) {
    if (n == 0) return 1;
    if (memo[n] != 0) return memo[n]; 

    unsigned long long result = 0;
    for (int i = 0; i < n; i++) {
        result += catalan(i) * catalan(n - 1 - i);
    }

    memo[n] = result; 
    return result;
}

int main() {
    int N;
    if (scanf("%d", &N) != 1) return 0;
    if (N < 1 || N > 34) {
        printf("Error: Jumlah cakram harus antara 1 sampai 34\n");
        return 0;
    }

    unsigned long long hasil = catalan(N);
    printf("Total cara menyusun %d cakram adalah %llu\n", N, hasil);

    return 0;
}
