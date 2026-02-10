type 'a binarytree = Node of 'a * 'a binarytree option * 'a binarytree option

let rec search x e =
  match x with
  | None -> false
  | Some (Node (v, l, r)) -> if v = e then true else search l e || search r e

let rec no_of_nodes x =
  match x with
  | None -> 0
  | Some (Node (_, l, r)) -> 1 + no_of_nodes l + no_of_nodes r

let t1 =
  Some
    (Node
       ( 1,
         Some
           (Node (2, Some (Node (3, None, None)), Some (Node (5, None, None)))),
         Some (Node (4, None, None)) ))

let _ =
  let n = no_of_nodes t1 in
  print_endline (string_of_int n);
  let found = search t1 5 in
  print_endline (string_of_bool found)
