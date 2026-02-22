let fib_tail n =
  if n <= 0 then 0
  else if n = 1 then 1
  else
    let rec aux b c i = if i = 0 then c else aux c (b + c) (i - 1) in
    aux 1 1 (n - 2)

let main () =
  print_int (fib_tail 8);
  print_newline ()

let _ = main ()
