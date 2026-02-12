let dbl_list = List.map (fun x -> 2 * x)
let pick_the_odds = List.filter (fun x -> x mod 2 = 1)

let main () =
  let l1 = [ 1; 2; 3; 4; 5 ] in
  print_endline
    (String.concat ", "
       (List.map (fun x -> string_of_int x) (pick_the_odds l1)))

let _ = main ()
