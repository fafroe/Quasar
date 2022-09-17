#include "detection.h"
#include "acquisition.h"
#include <stdlib.h>
#include <stdio.h>

static vector_2D_t DETECT_GetDirection(int *sumBuffer);
static double DETECT_GetSum(tile_t *tile);
static int DETECT_GetTiles(tile_t *tiles, image_t image[]);
static void DETECT_CopyRawToImage(unsigned char *srcBuffer, image_t *destBuffer);

/**
 * @brief Init the Detection Module
 * 
 * @param buffer Pointer to a buffer of images
 * @return EXIT_FAILURE on failure or EXIT_SUCCESS on success 
 */
int DETECT_Init(void)
{
    if(ACQ_Init_stream() == EXIT_FAILURE)
    {
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

/**
 * @brief processes every time it gets called a image
 * @return EXIT_FAILURE on failure or EXIT_SUCCESS on success 
 */
int DETECT_Process(unsigned char* frameBuffer)
{
    static image_t image;
    tile_t tiles[QCONF_DETECT_TILE_QUANTITY];

    DETECT_CopyRawToImage(frameBuffer, &image);
    DETECT_GetTiles(tiles, &image);
    DETECT_GetSum(tiles);

    return EXIT_SUCCESS;
}

/**
 * @brief Calculates the direction of the ball in respect to its position
 * 
 * @param sumBuffer an array of sums for each tile
 * @return vector_2D_t the direction
 */
static vector_2D_t DETECT_GetDirection(int *sumBuffer)
{
    vector_2D_t direction = {0};

    return direction;
}

/**
 * @brief Calculates the Sum of the Grey-scale of a tile and image
 * 
 * @param tile double array of tiles
 * @return sum of all pixels
 */
static double DETECT_GetSum(tile_t *tile)
{
    unsigned int tileCounter = 0, valueCounter = 0;
    double tileSum = 0.0f, sum = 0.0f;

    while(tileCounter < QCONF_DETECT_TILE_QUANTITY)
    {
        while(valueCounter < QCONF_IMAGE_SIZE)
        {
            tileSum += tile[tileCounter].pData[valueCounter];
            valueCounter++;
        }
        tile[tileCounter].sum = tileSum;
        sum += tileSum;
        tileCounter++;

        printf("%f\n", tileSum);
    }
    printf("\n");
    return sum;
}

/**
 * @brief Splits a image into multiple tiles
 * 
 * @param tiles double array of tiles
 * @return amount of tiles 
 */
static int DETECT_GetTiles(tile_t *tiles, image_t image[])
{
    const unsigned int tileSize_x = QCONF_IMAGE_FORMAT_X / QCONF_DETECT_TILE_RESOLUTION;
    const unsigned int tileSize_y = QCONF_IMAGE_FORMAT_Y / QCONF_DETECT_TILE_RESOLUTION;

    unsigned int x = 0, y = 1;
    unsigned int i = 0;

    while(y < QCONF_DETECT_TILE_RESOLUTION)
    {
        tiles[i].pos_y += tileSize_y * y;
        tiles[i].pos_x += tileSize_x * x;
        tiles[i].pData = (unsigned char *)image;
        tiles[i].pData += i*64;

        x++;
        if(x == QCONF_DETECT_TILE_RESOLUTION)
        {
            y++;
            x = 0;
        }
        i++;
    }
    return i;
}

/**
 * @brief Copys the raw Image buffer to a new image type buffer
 * 
 * @param srcBuffer raw source buffer from camera stream
 * @param destBuffer destination image buffer
 */
static void DETECT_CopyRawToImage(unsigned char *srcBuffer, image_t *destBuffer)
{
    for(unsigned int i = 0; i < QCONF_IMAGE_SIZE; i++)
    {
        destBuffer->image[i] = srcBuffer[i];
    }
}