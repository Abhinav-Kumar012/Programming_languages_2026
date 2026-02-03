#include "shape.h"

float areaOfShape(Shape *s) {
    return s->vtableptr->area(s);
}