type shape = Rectangle of float * float | Square of float | Circle of float
let pi = 3.1415 
let area s = match s with 
  | Rectangle(l,b) -> l *. b
  | Square(s) -> s *. s
  | Circle(r) -> pi*.r*.r