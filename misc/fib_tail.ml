let fib_tail n =
  if n <= 0 then 0
  else if n = 1 then 1
  else
    let rec aux a b c i = if i = 0 then c else aux b c (b + c) (i - 1) in
    aux 0 1 1 (n - 2)

let main () =
  begin
    print_int (fib_tail 3);
    print_newline ();
  end

let _ = main ()
