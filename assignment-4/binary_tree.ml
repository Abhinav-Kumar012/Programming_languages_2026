type 'a binarytree = 
  LeafNode of 'a
  | InternalNode of 'a * 'a binarytree * 'a binarytree

let rec search x e = match x with
  InternalNode(v,l,r) -> if v = e then true else (search l e) || (search r e)
  | LeafNode(v) -> if v = e then true else false

let rec no_of_nodes x = match x with 
  InternalNode(_,l,r) -> 1 + no_of_nodes l + no_of_nodes r
  | LeafNode(_) -> 1

let t1 = InternalNode(1 , InternalNode(2,LeafNode(3),LeafNode(5)),LeafNode(4))

let _ = 
  let n = no_of_nodes (t1) in print_endline (string_of_int n);
  let found = search t1 5 in print_endline (string_of_bool found);


