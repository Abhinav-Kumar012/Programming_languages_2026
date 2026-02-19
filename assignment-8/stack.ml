module type STACK = sig
  type 'a t (* abstract type *)

  val empty : 'a t
  val push : 'a -> 'a t -> 'a t
  val pop : 'a t -> 'a t
  val top : 'a t -> 'a
  val is_empty : 'a t -> bool
end

module Stack : STACK = struct
  type 'a t = 'a list

  let empty = []
  let push e s = e :: s
  let pop s = match s with [] -> failwith "empty stack" | _ :: t -> t
  let top s = match s with [] -> failwith "empty stack" | h :: _ -> h
  let is_empty = List.is_empty
end

let main () =
  let st = Stack.empty |> Stack.push 1 |> Stack.push 2 |> Stack.push 3 in
  print_endline (string_of_int (Stack.top st));
  let st2 = Stack.pop st in
  print_endline (string_of_bool (Stack.is_empty st2))

let _ = main ()
