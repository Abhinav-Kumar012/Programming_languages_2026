let rec is_odd n =
  if n = 1 then true else if n < 0 then false else is_even (n - 1)

and is_even n = if n = 0 then true else if n < 0 then false else is_odd (n - 1)

let is_even_mod n = is_even (abs n)
let is_odd_mod n = is_odd (abs n)
let main () = Printf.printf "%b\n" (is_odd_mod (-13))
let _ = main ()
