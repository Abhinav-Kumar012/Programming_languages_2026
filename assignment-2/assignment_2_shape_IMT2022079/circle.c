#include <stdlib.h>
#include "circle.h"
#include <math.h>

#define PI 3.141f

float circleArea(Shape *s) {
    Circle *c = (Circle *)s;
    return M_PI * c->radius * c->radius;
}


Vtable CircVtable = {
    circleArea
};

Shape *newCircle(float r) {
    Circle *c = (Circle *)malloc(sizeof(Circle));
    c->radius = r;
    c->baseShape.vtableptr = &CircVtable;
    return (Shape *)c;
}
