#include <stdlib.h>
#include "rectangle.h"

float rectangleArea(Shape *s) {
    Rectangle *r = (Rectangle *)s;
    return r->length * r->breadth;
}

Vtable rectVtable = {
    rectangleArea
};

Shape *newRectangle(float l, float b) {
    Rectangle *r = (Rectangle *)malloc(sizeof(Rectangle));
    r->length = l;
    r->breadth = b;
    r->baseShape.vtableptr = &rectVtable;
    return (Shape *)r;
}

Shape *newSquare(float side) {
    return newRectangle(side, side);
}