module type STACK = sig
  type 'a t            (* abstract type *)

  val empty : 'a t
  val push  : 'a -> 'a t -> 'a t
  val pop   : 'a t -> 'a t
  val top   : 'a t -> 'a
  val is_empty : 'a t -> bool
end

module Stack : STACK = struct
  type 'a t = 'a list    (* actual implementation *)

  let empty = []

  let push x s = x :: s

  let pop = function
    | [] -> failwith "Empty stack"
    | _ :: xs -> xs

  let top = function
    | [] -> failwith "Empty stack"
    | x :: _ -> x

  let is_empty s = (s = [])

  (* Internal helper - NOT exposed *)
  let size s = List.length s
end
