#include <iostream>

using namespace std;
class Shape {
public:
    virtual void print() = 0;
    virtual float area() = 0;
};

class Square : public Shape {
    private: float length;
public:
         Square(float l) { length = l; }
    void print ()        { cout << endl << "I'm square." << endl; }
    float area ()        { return length * length; } 
};

class Rectangle : public Shape {
private:
    float length;
    float breadth;
public: 
    Rectangle(float l, float b) {
        length = l;
        breadth = b;
    }
    void print() { cout << endl << "I'm a rectangle." << endl; }
    float area() {    return length * breadth; } 
};

int main() {
    Shape *shape;
    
    shape = new Square(2.0);
    shape->print();
    cout << "Area of square = " << shape->area() << endl;
    delete(shape);

    shape = new Rectangle(2.0, 3.0);
    shape->print();
    cout << "Area of rectangle = " << shape->area() << endl;
    delete(shape);

    return 0;
}
