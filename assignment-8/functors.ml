module type COMP = sig
  type t

  val ( < ) : t -> t -> bool
  val ( > ) : t -> t -> bool
  val ( = ) : t -> t -> bool
  val string_of_t : t -> string
end

module type SET = sig
  type elt
  type t

  val empty : t
  val insert : elt -> t -> t
  val member : elt -> t -> bool
  val remove : elt -> t -> t
  val elements : t -> elt list
end

module Set (C : COMP) : SET with type elt = C.t with type t = C.t list = struct
  type elt = C.t
  type t = elt list

  let empty = []

  let rec insert e s =
    match s with
    | [] -> [ e ]
    | h :: t ->
        if C.( = ) h e then s
        else if C.( < ) h e then h :: insert e t
        else e :: s

  let rec member e s =
    match s with
    | [] -> false
    | h :: t ->
        if C.( = ) h e then true else if C.( < ) h e then member e t else false

  let rec remove e s =
    match s with
    | [] -> []
    | h :: t ->
        if C.( = ) h e then t else if C.( < ) h e then h :: remove e t else s

  let elements s = s
end

module IntComp : COMP with type t = int = struct
  type t = int

  let ( < ) = ( < )
  let ( > ) = ( > )
  let ( = ) = ( = )
  let string_of_t = string_of_int
end

module IntSet = Set (IntComp)

module StringComp : COMP with type t = string = struct
  type t = string

  let ( < ) = ( < )
  let ( > ) = ( > )
  let ( = ) = ( = )
  let string_of_t x = x
end

module StringSet = Set (StringComp)

type date = { day : int; month : int; year : int }

module DateComp : COMP with type t = date = struct
  type t = date

  let ( < ) d1 d2 =
    if d1.year < d2.year then true
    else if d1.year > d2.year then false
    else if d1.month < d2.month then true
    else if d1.month > d2.month then false
    else if d1.day < d2.day then true
    else false

  let ( = ) d1 d2 = d1.day = d2.day && d1.month = d2.month && d1.year = d2.year
  let ( > ) d1 d2 = (not (d1 = d2)) && not (d1 < d2)

  let string_of_t d =
    "Date(" ^ string_of_int d.day ^ ", " ^ string_of_int d.month ^ ", "
    ^ string_of_int d.year ^ ")"
end

module DateSet = Set (DateComp)

let main () =
  let seti =
    IntSet.empty |> IntSet.insert 1 |> IntSet.insert 1 |> IntSet.insert 3
    |> IntSet.insert 2 |> IntSet.remove 3
  and setd =
    DateSet.empty
    |> DateSet.insert { day = 1; month = 4; year = 2004 }
    |> DateSet.insert { day = 2; month = 12; year = 2004 }
    |> DateSet.insert { day = 1; month = 4; year = 2004 }
    |> DateSet.insert { day = 24; month = 7; year = 2004 }
  and sets =
    StringSet.empty |> StringSet.insert "a" |> StringSet.insert "c"
    |> StringSet.insert "b" |> StringSet.remove "d" |> StringSet.insert "wax"
  in
  print_endline
    (String.concat ", " (List.map IntComp.string_of_t (IntSet.elements seti)));
  print_endline (string_of_bool (IntSet.member 3 seti));
  print_endline
    (String.concat ", " (List.map DateComp.string_of_t (DateSet.elements setd)));
  print_endline
    (string_of_bool (DateSet.member { day = 24; month = 7; year = 2004 } setd));
  print_endline
    (String.concat ", "
       (List.map StringComp.string_of_t (StringSet.elements sets)));
  print_endline (string_of_bool (StringSet.member "wax" sets))

let _ = main ()
