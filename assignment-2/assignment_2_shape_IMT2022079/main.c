#include <stdio.h>
#include <stdlib.h>
#include "shape.h"
#include "rectangle.h"
#include "circle.h"

void printAreas(Shape **shapes, int n) {
    for (int i = 0; i < n; i++) {
        printf("Shape area = %f\n", areaOfShape(shapes[i]));
    }
}

int main() {
    Shape *shapes[] = {
        newRectangle(20.0f, 10.0f),
        newSquare(10.0f),
        newCircle(5.0f)
    };

    int count = sizeof(shapes) / sizeof(shapes[0]);

    printAreas(shapes, count);

    for (int i = 0; i < count; i++) {
        free(shapes[i]);
    }

    return 0;
}
