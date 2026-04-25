let reverse l =
  let rec iter acc l = match l with [] -> acc | h :: t -> iter (h :: acc) t in
  iter [] l

let tail_append list1 list2 =
  let rec iter acc list1 list2 =
    match (list1, list2) with
    | [], [] -> List.rev acc
    | h :: t, _ -> (iter [@ocaml.tailcall]) (h :: acc) t list2
    | [], h :: t -> (iter [@ocaml.tailcall]) (h :: acc) [] t
  in
  iter [] list1 list2

let average_list l = List.fold_left ( +. ) 0. l /. float_of_int (List.length l)

let variance_list l =
  let avg = average_list l in
  List.fold_left ( +. ) 0. (List.map (fun x -> (x -. avg) ** 2.) l)
  /. float_of_int (List.length l)

let std_dev l = sqrt (variance_list l)
let pass_std_dev l = std_dev (List.filter (fun x -> x > 30.) l)

let tail_fold_left f init l =
  let rec iter acc l =
    match l with [] -> acc | h :: t -> (iter [@ocaml.tailcall]) (f acc h) t
  in
  iter init l

(* let rec sum ~zero ~term ~a ~next ~b ~plus =

 if (a > b) then zero

 else      ( plus

           (term a)

           ( sum 

             ~zero:zero

             ~term:term

             ~a:(next a)

             ~next:next

             ~b:b

             ~plus:plus

            )

         )
let sumchars =
let zero = ""
and term x = (Char.escaped x)
and next x = char_of_int ((int_of_char x) + 1)
and plus x y = x ^ y
in
sum ~zero:zero ~term:term ~next:next ~plus:plus *)

let sum ~zero ~term ~a ~next ~b ~plus =
  let rec iter i acc =
    if i > b then acc else (iter [@ocaml.tailcall]) (next i) (plus acc (term i))
  in
  iter a zero

let sumchars ~a ~b =
  sum ~zero:String.empty
    ~term:(fun x -> Char.chr x)
    ~next:(fun x -> x + 1)
    ~plus:(fun acc x -> acc ^ String.make 1 x)
    ~a:(Char.code a) ~b:(Char.code b)

let main () =
  (* let p = sumchars ~a:(Char.chr 0) ~b:(Char.chr 255) in  *)
  let p = sumchars ~a:'a' ~b:'z' in
  (* print_endline (String.concat ";" (List.map string_of_int p)) *)
  Printf.printf "%s\n" p

let () = main ()
