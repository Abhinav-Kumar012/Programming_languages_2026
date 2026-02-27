type user = { first : string; last : string; is_admin : bool }

let full_name ({ first = f; last = l } : user) = f ^ " " ^ l
let full_name2 usr = usr.first ^ " " ^ usr.last

let split_list (l : ('a * 'b) list) : 'a list * 'b list =
  let la = ref [] and lb = ref [] in
  let rec iter l =
    match l with
    | [] -> (la, lb)
    | (ha, hb) :: t ->
        la := ha :: !la;
        lb := hb :: !lb;
        (iter [@ocaml.tailcall]) t
  in
  let lx, ly = iter l in
  (List.rev !lx, List.rev !ly)

let print_list ~func_to_string l =
  print_endline (String.concat ", " (List.map func_to_string l))

let anon = fun x y -> (x, y) (*it works??*)

let main () =
  let p, q = List.init 10 (fun x -> (x * x, x * 2)) |> split_list in
  print_list ~func_to_string:string_of_int p;
  print_list ~func_to_string:string_of_int q

let _ = main ()
