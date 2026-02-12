let derivative f =
  let h = 0.00001 in
  fun x -> (f (x +. h) -. f x) /. h

let dbl_derivative f = derivative (derivative f)
let id x = x ** 3.
let main () = print_endline (string_of_float ((dbl_derivative id) 3.))
let _ = main ()
