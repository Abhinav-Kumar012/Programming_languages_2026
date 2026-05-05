type tree =
  | Leaf
  | Node of int * forest

and forest =
  | Empty
  | Cons of tree * forest

let example_tree =
  Node (10,
    Cons (
      Node (5, Empty),
      Cons (
        Node (3,
          Cons (Leaf, Empty)
        ),
        Empty
      )
    )
  )



































let rec sum_tree t =
  match t with
  | Leaf -> 0
  | Node (v, f) -> v + sum_forest f

and sum_forest f =
  match f with
  | Empty -> 0
  | Cons (t, rest) -> sum_tree t + sum_forest rest


