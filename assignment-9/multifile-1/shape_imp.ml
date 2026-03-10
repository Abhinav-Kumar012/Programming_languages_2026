module type SHAPE = sig
  type shape = Rectangle of float * float | Square of float | Circle of float
  val area : shape -> float
end
module Shape : SHAPE = struct 
  type shape = Rectangle of float * float | Square of float | Circle of float
  let pi = 3.1415 
  let area s = match s with 
  | Rectangle(l,b) -> l *. b
  | Square(s) -> s *. s
  | Circle(r) -> pi*.r*.r

end

let main () = Printf.printf "%f\n" (Shape.area (Rectangle (10.,5.)))

let _ = main ()