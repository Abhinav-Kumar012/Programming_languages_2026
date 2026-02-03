#ifndef RECTANGLE_H
#define RECTANGLE_H

#include "shape.h"

typedef struct Rectangle {
    Shape baseShape;       
    float length;
    float breadth;
} Rectangle;

Shape *newRectangle(float l, float b) ;

Shape *newSquare(float side) ;

#endif
