public class Shapes {
    public static void main(String[] args) {
        Shape[] shapes = {
            new Rectangle(20, 10),
            new Square(10),
            new Circle(5)
        };
        printAreas(shapes);
    }

    public static void printArea(Shape s) {
        System.out.println("Shape area = " + s.area());
    }

    public static void printAreas(Shape[] shapes) {
        for(Shape s : shapes) {
            printArea(s);
        }
    }
}

interface Shape {
    float area();
}

class Rectangle implements Shape {
    private float length;
    private float breadth;

    public Rectangle(float length, float breadth) {
        this.length = length;
        this.breadth = breadth;
    }

    public float area() {
        return this.length * this.breadth; 
    }
}

class Square extends Rectangle {
    public Square(int length) {
        super(length, length);
    }
}

class Circle implements Shape {
    private final float radius;
    public final static float PI = 3.141f;

    public Circle(float radius) {
        this.radius = radius;
    }

    public float area() {
        return Circle.PI * this.radius * this.radius;
    }
}
