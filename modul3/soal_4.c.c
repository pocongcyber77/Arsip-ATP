#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef long long ll;

typedef struct {
    int l, r, idx, block;
} Query;

int N, Q;
int a[100005];
Query queries[100005];
ll ans[100005];

int BIT[100005], bit_size;

void bit_update(int idx, int val) {
    while (idx <= bit_size) {
        BIT[idx] += val;
        idx += idx & -idx;
    }
}

int bit_query(int idx) {
    int s = 0;
    while (idx > 0) {
        s += BIT[idx];
        idx -= idx & -idx;
    }
    return s;
}

int cmpQuery(const void *x, const void *y) {
    Query *A = (Query*)x;
    Query *B = (Query*)y;
    if (A->block != B->block)
        return A->block - B->block;
    if (A->block & 1)
        return B->r - A->r;
    return A->r - B->r;
}

int main() {
    if (scanf("%d %d", &N, &Q) != 2) return 0;

    for (int i = 1; i <= N; i++)
        scanf("%d", &a[i]);

    for (int i = 0; i < Q; i++) {
        scanf("%d %d", &queries[i].l, &queries[i].r);
        queries[i].idx = i;
    }

    int blockSize = (int)sqrt(N);
    if (blockSize == 0) blockSize = 1;
    for (int i = 0; i < Q; i++)
        queries[i].block = queries[i].l / blockSize;

    qsort(queries, Q, sizeof(Query), cmpQuery);

    bit_size = N;
    ll curInv = 0;
    int curL = 1, curR = 0;

    for (int qi = 0; qi < Q; qi++) {
        int L = queries[qi].l;
        int R = queries[qi].r;

        while (curR < R) {
            curR++;
            int x = a[curR];
            curInv += bit_query(bit_size) - bit_query(x);
            bit_update(x, 1);
        }
        while (curR > R) {
            int x = a[curR];
            bit_update(x, -1);
            curInv -= bit_query(bit_size) - bit_query(x);
            curR--;
        }
        while (curL < L) {
            int x = a[curL];
            bit_update(x, -1);
            curInv -= bit_query(x - 1);
            curL++;
        }
        while (curL > L) {
            curL--;
            int x = a[curL];
            curInv += bit_query(x - 1);
            bit_update(x, 1);
        }

        ans[queries[qi].idx] = curInv;
    }

    for (int i = 0; i < Q; i++)
        printf("%lld\n", ans[i]);

    return 0;
}
