#include <stdio.h>

int main() {
    char a,b,c,d,e,f,g,h,i,j,k;
    scanf("%c%c%c%c%c%c%c%c%c%c%c",&a,&b,&c,&d,&e,&f,&g,&h,&i,&j,&k);

    int spasi=0;
    if(a==' '||b==' '||c==' '||d==' '||e==' '||f==' '||g==' '||h==' '||i==' '||j==' '||k==' ') spasi=1;

    if(a==k && b==j && c==i && d==h && e==g) {
        if(spasi) printf("SP4C3 R3FL3CT10N\n");
        else printf("M1RR0R M4ST3R\n");
    } else if(a==k && b==j && c==i && d==h) {
        printf("4LM0ST 4 M1RR0R\n");
    } else if(a==k && b==j && c==i) {
        printf("4LM0ST 4 M1RR0R\n");
    } else if(a==k && b==j) {
        printf("N34R M1SS\n");
    } else if(a==k) {
        printf("N34R M1SS\n");
    } else {
        printf("CH40S D3T3CT3D\n");
    }
    return 0;
}
