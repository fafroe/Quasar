#include "detection.h"
#include "acquisition.h"
#include <stdlib.h>
#include <stdio.h>

static vector_2D_t DETECT_GetDirection(int *sumBuffer);
static void DETECT_CalculateSums(tile_t (*tiles)[]);
static int DETECT_GetTiles(tile_t (*tiles)[], image_t *image);
static position_t DETECT_GetTilePosition(unsigned int index);
static void DETECT_FillTileData(tile_t *tile, image_t *image);
static void DETECT_CopyRawToImage(unsigned char *srcBuffer, image_t *destBuffer);
static void DETECT_ConvertTileToASCIfile(tile_t *tile);
static void DETECT_ConvertImageToASCIfile(image_t *image);

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
    DETECT_ConvertImageToASCIfile(&image);
    DETECT_GetTiles(&tiles, &image);
    //DETECT_CalculateSums(&tiles);

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
static void DETECT_CalculateSums(tile_t (*tiles)[])
{
    unsigned int tileCounter = 0, valueCounter = 0;

    while(tileCounter < QCONF_DETECT_TILE_QUANTITY)
    {
        valueCounter = 0;
        (*tiles)[tileCounter].grayScaleSum = 0;
        while(valueCounter < QCONF_DETECT_TILE_SIZE)
        {
            (*tiles)[tileCounter].grayScaleSum += (*tiles)[tileCounter].image[valueCounter];
            valueCounter++;
        }
        printf("%f\n", (*tiles)[tileCounter].grayScaleSum );
        tileCounter++;
    }
    printf("\n");
}


static int DETECT_GetTiles(tile_t (*tiles)[], image_t *image)
{
    unsigned int i = 0;
    position_t tilePosition;

    // while(i < QCONF_DETECT_TILE_QUANTITY)
    while(i < 3)
    {
        (*tiles)[i].id = i;

        tilePosition = DETECT_GetTilePosition(i);
        (*tiles)[i].position.x = tilePosition.x;
        (*tiles)[i].position.y = tilePosition.y;
 
        DETECT_FillTileData(&(*tiles)[i], image);

        i++;
    }

    return i;
}


/**
 * @brief Gets the Position of a Tile in an image
 * 
 * @param index position in an image counting from top left (0) to top right,
 *            second left to second right and so on
 * @return position_t the position of the tile
 */
static position_t DETECT_GetTilePosition(unsigned int index)
{
    position_t position;

    position.x = QCONF_DETECT_TILE_SIZE_X * index;
    position.y = QCONF_DETECT_TILE_SIZE_Y * index;

    return position;
}

/**
 * @brief Copys the respective data from the image to the given tile
 * 
 * @param tile Pointer to a tile to fill with data
 * @param image Pointer to a image where the data is copied from
 */
static void DETECT_FillTileData(tile_t *tile, image_t *image)
{
    unsigned long imageIterator = tile->id * QCONF_DETECT_TILE_SIZE;

    for(unsigned int tileIterator = 0; tileIterator < QCONF_DETECT_TILE_SIZE; tileIterator++)
    {
        tile->image[tileIterator] = image->image[imageIterator];

        imageIterator++;
        if(tileIterator % QCONF_DETECT_TILE_SIZE_X == 0)
        {
            imageIterator += (QCONF_DETECT_TILE_RESOLUTION - 1) * QCONF_DETECT_TILE_SIZE_X;
        }
    }
    DETECT_ConvertTileToASCIfile(tile);
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

static int DETECT_ConvertToAsciGreyScale(char* destBuffer, unsigned char srcBuffer[], int size, int width)
{
	int i = 0;
	const char lookupTable[9] = {" .-+*o0@#"};
	//const char lookupTable[8] = {"@0o*+-. "};

    do {
        destBuffer[i] = lookupTable[srcBuffer[i]/32];
        if(i % width == 0) destBuffer[i] = '\n';
        i++;
    } while(i < size);

	return i;
}

static void DETECT_ConvertTileToASCIfile(tile_t *tile)
{
    char writeBuffer[QCONF_DETECT_TILE_SIZE];
    FILE *fp;
    char filename[32];

    sprintf(filename, "debug/tile_%i", tile->id);
    fp = fopen(filename, "w");

    DETECT_ConvertToAsciGreyScale(writeBuffer, tile->image, QCONF_DETECT_TILE_SIZE, QCONF_DETECT_TILE_SIZE_X-1);
    fwrite(writeBuffer, 1, QCONF_DETECT_TILE_SIZE, fp);

    fclose(fp);
}

static void DETECT_ConvertImageToASCIfile(image_t *image)
{
    char writeBuffer[QCONF_IMAGE_SIZE];
    FILE *fp;
    char filename[32];

    sprintf(filename, "debug/image");
    fp = fopen(filename, "w");

    DETECT_ConvertToAsciGreyScale(writeBuffer, image->image, QCONF_IMAGE_SIZE, QCONF_IMAGE_FORMAT_X-1);
    fwrite(writeBuffer, 1, QCONF_IMAGE_SIZE, fp);

    fclose(fp);
}