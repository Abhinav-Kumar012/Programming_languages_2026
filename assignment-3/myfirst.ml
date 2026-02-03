let rec findlist l e = 
  match l with 
    | [] -> false
    | h::t -> if h = e then true else findlist t e

let rec fact n = 
  match n with 
  | 0 | 1 -> 1
  | p -> p * fact (p-1)

let rec fib n =
  if n < 2 then 
    n 
  else 
    fib (n-1) + fib (n-2)

let _ = let s = fact 5 in (print_int s)
let _ = let s = fib 10 in (print_int s)