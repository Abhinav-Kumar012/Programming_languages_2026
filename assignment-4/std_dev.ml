let l1 = [ 1.; 2.; 3. ]
let average_list l = List.fold_left ( +. ) 0. l /. float_of_int (List.length l)

let variance_list l =
  List.fold_left ( +. ) 0.
    (let avg = average_list l in
     List.map (fun x -> (x -. avg) ** 2.) l)
  /. float_of_int (List.length l)

let std_dev l = sqrt (variance_list l)
let pass_std_dev l p = std_dev (List.filter (fun x -> x > p) l)

let _ =
  let omega = pass_std_dev l1 1. in
  print_float omega
