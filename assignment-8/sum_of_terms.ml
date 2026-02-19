let sum ~zero ~term ~a ~next ~b ~plus =
  let rec iter i acc =
    if i > b then acc else (iter [@ocaml.tailcall]) (next i) (plus acc (term i))
  in
  iter a zero

let sumnum = sum ~zero:0 ~term:(fun x -> x) ~next:(fun x -> x + 1) ~plus:( + )

let sumcube =
  sum ~zero:0 ~term:(fun x -> x * x * x) ~next:(fun x -> x + 1) ~plus:( + )

let sumpi =
  sum ~zero:0.
    ~term:(fun x -> 1. /. (x *. (x +. 2.)))
    ~next:(fun x -> x +. 4.)
    ~plus:( +. )

let sumchars ~a ~b =
  sum ~zero:String.empty
    ~term:(fun x -> Char.chr x)
    ~next:(fun x -> x + 1)
    ~plus:(fun acc x -> acc ^ String.make 1 x)
    ~a:(Char.code a) ~b:(Char.code b)

let main () =
  let res = sumnum ~a:1 ~b:10
  and res2 = sumcube ~a:1 ~b:10
  and res3 = sumpi ~a:1. ~b:50000.
  and res4 = sumchars ~a:'a' ~b:'z' in
  print_endline ({|sumnum ~a:1 ~b:10 = |} ^ string_of_int res);
  print_endline ({|sumcube ~a:1 ~b:10 = |} ^ string_of_int res2);
  print_endline
    ({|8. *. (sumpi ~a:1. ~b:50000.) = |} ^ string_of_float (res3 *. 8.));
  prerr_endline ({|sumchars ~a:'a' ~b:'z' = |} ^ res4)

let _ = main ()
