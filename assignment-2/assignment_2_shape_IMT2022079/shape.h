#ifndef SHAPE_H
#define SHAPE_H

typedef struct Shape Shape;

typedef struct Vtable {
    float (*area)(Shape *);
} Vtable;

struct Shape {
    Vtable *vtableptr;
};

float areaOfShape(Shape *s);
#endif
