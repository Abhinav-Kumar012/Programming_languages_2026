#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct Shape Shape;

typedef struct {
    float (*area)(Shape *);
    void  (*destroy)(Shape *);
} ShapeVTable;

struct Shape {
    ShapeVTable *vptr;
};

float shape_area(Shape *s) {
    return s->vptr->area(s);
}

void shape_destroy(Shape *s) {
    s->vptr->destroy(s);
}

typedef struct {
    Shape base;       
    float length;
    float breadth;
} Rectangle;

float rectangle_area(Shape *s) {
    Rectangle *r = (Rectangle *)s;
    return r->length * r->breadth;
}

void rectangle_destroy(Shape *s) {
    free(s);
}

ShapeVTable rectangle_vtable = {
    rectangle_area,
    rectangle_destroy
};

Shape *new_rectangle(float l, float b) {
    Rectangle *r = (Rectangle *)malloc(sizeof(Rectangle));
    r->base.vptr = &rectangle_vtable;
    r->length = l;
    r->breadth = b;
    return (Shape *)r;
}

Shape *new_square(float side) {
    return new_rectangle(side, side);
}

typedef struct {
    Shape base;
    float radius;
} Circle;

float circle_area(Shape *s) {
    Circle *c = (Circle *)s;
    return M_PI * c->radius * c->radius;
}

void circle_destroy(Shape *s) {
    free(s);
}

ShapeVTable circle_vtable = {
    circle_area,
    circle_destroy
};

Shape *new_circle(float r) {
    Circle *c = (Circle *)malloc(sizeof(Circle));
    c->base.vptr = &circle_vtable;
    c->radius = r;
    return (Shape *)c;
}

void printArea(Shape *s) {
    printf("Shape area = %f\n", shape_area(s));
}

void printAreas(Shape **shapes, int n) {
    for (int i = 0; i < n; i++) {
        printArea(shapes[i]);
    }
}

int main() {
    Shape *shapes[] = {
        new_rectangle(20.0f, 10.0f),
        new_square(10.0f),
        new_circle(5.0f)
    };

    int count = sizeof(shapes) / sizeof(shapes[0]);

    printAreas(shapes, count);

    for (int i = 0; i < count; i++) {
        shape_destroy(shapes[i]);
    }

    return 0;
}
