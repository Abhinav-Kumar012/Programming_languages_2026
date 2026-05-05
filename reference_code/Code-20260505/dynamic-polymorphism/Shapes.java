public class Shapes {

	public static void main(String[] args) {
		Rectangle r1 = new Rectangle(10, 5);
		//System.out.println(r1);
		//System.out.println(r1.area());
		Rectangle r2 = new Square(10);
		//System.out.println(r2);
		//System.out.println(r2.area());
		Circle c1 = new Circle(10);
		//System.out.println(c1);
		//System.out.println(c1.area());
		Shape[] shapes = {r1, r2, c1};
		printShapes(shapes);
	}

	public static void printShapes(Shape[] shapes) {
		for(Shape s : shapes) {
			System.out.println(s.details());
		}
	}
}

abstract class Shape {

	public abstract float area();
	public String details() {
		return "Shape(" + this.toString() + ", " + this.area() + ")";
	}
}

class Rectangle extends Shape {
	protected final float length;
	protected final float breadth;

	public Rectangle(float length, float breadth) {
		this.length = length;
		this.breadth = breadth;
	}

	public float area() {
		return this.length * this.breadth;
	}

	public String toString() {
		return "Rectangle(" + this.length + ", " + this.breadth + ")";
	}
}

class Square extends Rectangle {

	public Square(float length) {
		super(length, length);
	}

	public String toString() {
		return "Square(" + this.length + ")";
	}
}

class Circle extends Shape {
	private float radius;
	private static float PI = 3.141f;

	public Circle(float radius) {
		this.radius = radius;
	}

	public String toString() {
		return "Circle(" + this.radius + ")";
	}

	public float area() {
		return Circle.PI * this.radius * this.radius;
	}
}
