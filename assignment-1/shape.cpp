#include <iostream>
#include <cmath>

using namespace std;
class Shape {
public:
    virtual void print() = 0;
    virtual float area() = 0;
    virtual float circumference() = 0;
    virtual ~Shape() {}
};

class Square : public Shape {
private:
    float length;
public:
    Square(float l) { length = l; }
    void print ()   { cout << endl << "I'm square." << endl; }
    float area ()   { return length * length; }
    float circumference() {
        return 4*length;
    }
    ~Square() {} 
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
    float circumference(){
        return 2*(length + breadth);
    }
    ~Rectangle() {} 
};
class Circle : public Shape {
    private:
        float radius;
    public:
    Circle(float r){ radius = r; }
    void print(){ cout << endl << "I'm a Circle" << endl; }
    float area (){
        return M_PI*radius*radius;
    }
    float circumference(){
        return 2*M_PI*radius;
    }
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
    shape = new Circle(8.0);
    shape->print();
    cout << "Area of circle = " << shape->area() << endl;
    delete(shape);
    return 0;
}
