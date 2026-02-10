type 'a mylist = Empty | NonEmpty of 'a * 'a mylist

let rec sumlist = function Empty -> 0 | NonEmpty (h, t) -> h + sumlist t
let rec length = function Empty -> 0 | NonEmpty (h, t) -> 1 + length t
let l1 = NonEmpty (1, NonEmpty (2, Empty))
let l2 = NonEmpty ("one", NonEmpty ("two", Empty))

let main () =
  let s = sumlist l1 in
  print_endline (string_of_int s);
  let n = length l1 in
  print_endline (string_of_int n);
  let n2 = length l2 in
  print_endline (string_of_int n2)

let _ = main ()
