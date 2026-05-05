#include <stdio.h>
#include <stdlib.h>

struct Shape;


/********** Base class *************/
typedef struct Shape {
	void  (*print) (struct Shape *);
	float (*area)  (struct Shape *);
	void  (*delete)(struct Shape *);

	void  *derivedObject;
} Shape;

/**************Square class********************/
typedef struct Square {
	float length;
} Square;

void printSquare(Shape * s) {
	Square *c = (Square *)s->derivedObject;
	printf("I'm a square with length %f!\n", c->length);
}

float squareArea(Shape * s) {
	Square *c = (Square *)(s->derivedObject);
	return c->length * c->length;
}

void deleteSquare(Shape * s) {
	Square * c = (Square *)(s->derivedObject);
	free(s);
	free(c);
}

/* constructor */
Shape * newSquare(float l) {
	Shape  *p       = (Shape *)  malloc(sizeof(Shape));
	Square *c       = (Square *) malloc(sizeof(Square));
	p->derivedObject = c;
	p->print         = printSquare;
	p->area          = squareArea;
	p->delete        = deleteSquare;
	c->length        = l;
	return p;
}
/**************Rectangle class********************/
typedef struct Rectangle {
	float length;
	float breadth;
} Rectangle;

void printRectangle(Shape * s) {
	Rectangle * c = s->derivedObject;
	printf("I'm a rectangle with length = %f and breadth = %f!\n", c->length, c->breadth);
}

float rectangleArea(Shape * s) {
	Rectangle * c = (Rectangle *)(s->derivedObject);
	return (c->length) * (c->breadth);
}

void deleteRectangle(Shape * s) {
	Rectangle * c = (Rectangle *)(s->derivedObject);
	free(s);
	free(c);
}

/* Rectangle Constructor */
Shape * newRectangle(float l, float b) {
	Shape * p       = (Shape *)malloc(sizeof(Shape));
	Rectangle *c    = (Rectangle *)malloc(sizeof(Rectangle));
	p->derivedObject = c;
	p->print         = printRectangle;
	p->area          = rectangleArea;
	p->delete        = deleteRectangle;
	
	c->length      = l;
	c->breadth     = b;

	return p;
}

int main() {
	Shape *shape = newSquare(2.0);	
	shape->print(shape);
	printf("Square area = %f.\n", shape->area(shape));
	shape->delete(shape);
	
	shape = newRectangle(2.0, 3.0);	
	shape->print(shape);
	printf("Rectangle area = %f.\n", shape->area(shape));
	shape->delete(shape);

	return 0;
}
