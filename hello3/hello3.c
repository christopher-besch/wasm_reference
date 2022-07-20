#include <emscripten/emscripten.h>
#include <stdio.h>

int main()
{
    printf("Hello World!\n");
}

#ifdef __cplusplus
extern "C" {
#endif

EMSCRIPTEN_KEEPALIVE void my_func(int argc, char** argv)
{
    printf("my_func called\n");
}

#ifdef __cplusplus
}
#endif
