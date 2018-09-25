#include <stdio.h>

static const char delta = 'a' - 'A'; // Here delta is static.

void Capitalize(char *word)
{
//    int foo = 1;
    word[0] -= delta;
}

int main(int argc, const char * argv[])
{
    void *myRef = NULL;
    printf("%p\n", myRef);
    
    //    int foo[100];
    //
    //    for (int i = 0; i < 200; i++) {
    //        printf("%d\n", foo[i]);
    //    }
    
    printf("Hello World!\n");
    
    char *hi = "hello";
    char *bye = "hello";
    char *yay = "woo";
    char whee[] = "hello";
    
    Capitalize(whee);
    printf("%s\n", whee);
    
//    int goo, *foo, *bar, **baz;
}

