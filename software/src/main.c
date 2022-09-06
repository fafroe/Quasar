#include <stdlib.h>
#include <stdio.h>
#include "acquisition.h"


int main(int argc, char *argv[])
{
    if(ACQ_Init_stream() == EXIT_FAILURE)
    {
        return EXIT_FAILURE;
    }

    printf("Great Success!\n");
    return EXIT_SUCCESS;
}