module type COMP =
sig
  type t
  val (<) : t -> t -> bool
  val (>) : t -> t -> bool
  val (=) : t -> t -> bool
  val string_of_t : t -> string
end

module IntComp : (COMP with type t = int) =
struct
  type t = int

  let (<) = (<)
  let (>) = (>)
  let (=) = (=)
  let string_of_t = string_of_int
end


module type PAIR =
sig
  type elt
  type t

  val newpair : elt -> elt -> t
  val first : 'a * 'b -> 'a
  val second : 'a * 'b -> 'b
  val ascending : elt * elt -> elt * elt
  val descending : elt * elt -> elt * elt
  val string_of_pair : t -> string
end

module Pair (C : COMP) : PAIR
  with type elt = C.t with type t = C.t * C.t =
struct
  type elt = C.t
  type t = elt * elt

  let newpair (f : C.t) (s : C.t) = (f, s)
  let first (f, _) = f
  let second (_, s) = s
  let order (f, s) ~func = if (func f s) then (f, s) else (s, f)
  let ascending = order ~func:C.(<)
  let descending = order ~func:C.(>)

  let string_of_pair (f, s) = "(" ^ (C.string_of_t f) ^ ", " ^ (C.string_of_t s) ^ ")"
end

module IntPair = Pair(IntComp)

(* module I = IntPair *)
open IntPair

let tint () =
  let p1 = newpair 1 2 in
  
  print_endline (string_of_pair p1);
  print_endline ("first = " ^ (IntComp.string_of_t (first p1)));
  print_endline ("Ascending = " ^ string_of_pair (ascending p1));
  print_endline ("Descending = " ^ string_of_pair (descending p1))


type date = {  day : int; month : int; year : int }

module DateComp : (COMP with type t = date) =
struct
  type t = date

  let (<) d1 d2 =
    if      d1.year < d2.year then true
    else if d1.year > d2.year then false
    else if d1.month < d2.month then true
    else if d1.month > d2.month then false
    else if d1.day < d2.day then true
    else false
  let (=) d1 d2 = d1.day = d2.day && d1.month = d2.month && d1.year = d2.year
  let (>) d1 d2 = (not (d1 = d2)) && (not (d1 < d2))
 
  let string_of_t d = "Date (" ^ (string_of_int d.day) ^
                            ", " ^ (string_of_int d.month) ^
                            ", " ^ (string_of_int d.year) ^ ")"
end

module DatePair = Pair(DateComp)

let tdate () =
  let d1 = {day = 21; month = 3; year = 2022}
  and d2 = {day = 1; month = 4; year = 2022} in
  let open DatePair in
  let p1 = newpair d1 d2 in
  print_endline (string_of_pair p1);
  print_endline ("first = " ^ (DateComp.string_of_t (first p1)));
  print_endline ("Ascending = " ^ string_of_pair (ascending p1));
  print_endline ("Descending = " ^ string_of_pair (descending p1))
