module type Opearatble = sig
  type t

  val ( + ) : t -> t -> t
  val ( * ) : t -> t -> t
end

module IntOp : Opearatble with type t = int = struct
  type t = int

  let ( + ) = ( + )
  let ( * ) = ( * )
end

module FloatOp : Opearatble with type t = float = struct
  type t = float

  let ( + ) = ( +. )
  let ( * ) = ( *. )
end
