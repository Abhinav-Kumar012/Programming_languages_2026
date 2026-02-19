module type COMP = sig
  type t

  val ( < ) : t -> t -> bool
  val ( > ) : t -> t -> bool
  val ( = ) : t -> t -> bool
  val string_of_t : t -> bytes
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
