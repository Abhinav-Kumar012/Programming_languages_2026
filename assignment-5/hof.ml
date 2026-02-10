let rec myfilter f l = match l with
  [] -> []
  | h::t -> let newtail = (myfilter f t) in if f (h) then h::newtail else newtail


let tail_map f l = 
  let rec iter f l acc = match l with 
    [] -> acc
    | h::t -> iter f t ((f (h))::acc)
  in let rev_list = iter f l []
  in List.rev rev_list
      

(* home work *)
let tail_filter f l = 
  let rec iter f l acc = match l with 
    [] -> acc
    | h::t -> if f (h) then iter (f) (t) (h::acc) else iter (f) (t) (acc)
  in let rev_list = iter f l [] 
  in List.rev rev_list

let tail_fold_left f init l = 
  let rec iter f l acc = match l with 
    [] -> acc
    | h::t -> iter (f) (t) (f (acc) (h))
  in iter f l init

let tail_fold_right f l init = 
  let rec iter f l acc = match l with 
    [] -> acc
    | h::t -> iter (f) (t) (f (h) (acc))
  in iter f (List.rev l) init


let tail_rev l = 
  let rec iter l rev_list = match l with 
    [] -> rev_list
    | h::t -> iter t (h::rev_list)
  in iter l []

let tail_append list1 list2 = 
  let rec iter list1 list2 acc = match (list1,list2) with 
    ([],[]) -> acc
    | (h::t,_) -> iter (t) (list2) (h::acc)
    | ([],h::t) -> iter ([]) (t) (h::acc)
  in let rev_list = iter list1 list2 []
  in List.rev rev_list

let l1 = [1;2;3;4;5]
let l2 = [6;7;8;9;10]


let _ = tail_map (fun z -> print_string((string_of_int z) ^ " ")) (tail_map (fun x -> x*x) l1)
let _ = print_endline ""
let _ = tail_map (fun z -> print_string((string_of_int z) ^ " ")) (tail_append l1 l2)
let _ = print_endline ""
let _ = tail_map (fun z -> print_string((string_of_int z) ^ " ")) (tail_filter (fun x -> x mod 2 = 0) l1)
let _ = print_endline ""
let _ = tail_map (fun z -> print_string((string_of_int z) ^ " ")) (tail_rev l1)
let _ = print_endline ""
let _ = print_int (tail_fold_left ( * ) 1 l1)
let _ = print_endline ""
let _ = print_int (tail_fold_right ( + ) l1 0)
let _ = print_endline ""
