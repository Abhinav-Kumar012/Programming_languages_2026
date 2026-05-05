#include <stdio.h>
#include <stdlib.h>

struct Shape;


/********** Base class *************/
typedef struct Shape {
    void  * *vtable;
} Shape;

void  print(struct Shape * shape) {
    void **vtable = shape->vtable;
    void (*p) (Shape *) = vtable[0];
    (*p)(shape);
}

float area(struct Shape *shape) {
    void **vtable = shape->vtable;
    float (*p) (Shape *) = vtable[1];
    return (*p)(shape);
}

void delete(struct Shape *shape) {
    void **vtable = shape->vtable;
    float (*p) (Shape *) = vtable[2];
    (*p)(shape);
}
/**************Square class********************/
typedef struct Square {
    void **vtable;
    float length;
} Square;

void printSquare(Shape * s) {
    Square *c = (Square *)s;
    printf("I'm a square with length %f!\n", c->length);
}

float squareArea(Shape * s) {
    Square *c = (Square *)s;
    return c->length * c->length;
}

void deleteSquare(Shape * s) {
    free(s->vtable);
    free(s);
}

/* constructor */
Shape * newSquare(float l) {
    Square *c       = (Square *) malloc(sizeof(Square));
    c->vtable = malloc(3 * sizeof(void *));
    c->vtable[0]     = printSquare;
    c->vtable[1]     = squareArea;
    c->vtable[2]     = deleteSquare;
    c->length        = l;
    return (Shape *)c;
}
///**************Rectangle class********************/
typedef struct Rectangle {
    void **vtable;
    float length;
    float breadth;
} Rectangle;

void printRectangle(Shape * s) {
    Rectangle * c = (Rectangle *)s;
    printf("I'm a rectangle with length = %f and breadth = %f!\n", c->length, c->breadth);
}

float rectangleArea(Shape * s) {
    Rectangle * c = (Rectangle *)s;
    return (c->length) * (c->breadth);
}

void deleteRectangle(Shape * s) {
    Rectangle * c = (Rectangle *)s;
    free(c->vtable);
    free(c);
}

/* Rectangle Constructor */
Shape * newRectangle(float l, float b) {
    Rectangle *c       = (Rectangle *) malloc(sizeof(Rectangle));
    c->vtable = malloc(3 * sizeof(void *));
    c->vtable[0]     = printRectangle;
    c->vtable[1]     = rectangleArea;
    c->vtable[2]     = deleteRectangle;
    c->length        = l;
    c->breadth       = b;
    return (Shape *)c;
}





























int main() {
    Shape *shape = newSquare(2.0);    
    print(shape);
    printf("Square area = %f.\n", area(shape));
    delete(shape);
    
    shape = newRectangle(2.0, 3.0);    
    print(shape);
    printf("Rectangle area = %f.\n", area(shape));
    delete(shape);

    return 0;
}
