#ifndef CIRCLE_H
#define CIRCLE_H

#include "shape.h"

typedef struct Circle {
    Shape baseShape;
    float radius;
} Circle;


Shape *newCircle(float r);

#endif
