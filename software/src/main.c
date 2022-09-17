#include <stdlib.h>
#include <stdio.h>
#include "detection.h"


int main(int argc, char *argv[])
{
     if(DETECT_Init() == EXIT_FAILURE)
    {
        return EXIT_FAILURE;
    }

    printf("Great Success!\n");
    return EXIT_SUCCESS;
}