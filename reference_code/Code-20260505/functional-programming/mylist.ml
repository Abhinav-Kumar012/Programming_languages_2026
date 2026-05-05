type mylist =
        Empty
  | NonEmpty of int * mylist

let rec sumlist = function
   Empty -> 0
 | NonEmpty(h, t) -> h + (sumlist t)

let rec length = function
   Empty -> 0
 | NonEmpty(h, t) -> 1 + (length t)

let l1 = NonEmpty(1, NonEmpty(2, Empty))

let main () =
        let s = (sumlist l1) in (print_endline (string_of_int s));
        let n = (length l1) in (print_endline (string_of_int n))

let _ = main ()
