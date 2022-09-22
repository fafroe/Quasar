#ifndef __DETECTION_H__
#define __DETECTION_H__

#include "quasarconfig.h"

typedef struct {
    double length;
    double direction;
} vector_2D_t;

typedef struct {
    unsigned int x;
    unsigned int y;
} position_t;

typedef struct {
    position_t position;
    unsigned char image[QCONF_DETECT_TILE_SIZE];
    double grayScaleSum;
    unsigned int id;
} tile_t;

typedef struct {
    unsigned char image[QCONF_IMAGE_SIZE];
    unsigned char writingFlag;
    unsigned char readingFlag;
} image_t;

int DETECT_Init(void);
int DETECT_Process(unsigned char* frameBuffer);

#endif /*__DETECTION_H__*/