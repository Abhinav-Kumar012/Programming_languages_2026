let x = ref 1 (* making a ref cell *)
let _ = Printf.printf "%d\n" !x;;

(* derefrencing a pointer *)

x := !x + 1 (* mutation! *);;

let _ = Printf.printf "%d\n" !x
let arr = [| 1; 2; 3 |] (* declare array *)
let _ = Printf.printf "%d\n" arr.(2);;

(* array with index access *)

arr.(2) <- 300 (* assigning value to array (mutable!) *);;

let _ = Printf.printf "%d\n" arr.(2)

type name = { fname : string; mutable surname : string } (* mutable fields! *)

let n = { fname = "abhi"; surname = "Kr" }
let _ = Printf.printf "%s\n" n.surname;;

n.surname <- "Kumar";;

let _ = Printf.printf "%s\n" n.surname;;

let i = ref 0 in
while !i < 10 do
  let _ = Printf.printf "%d " !i in
  i := !i + 1
done
;;

(* while loop *)

let _ = print_endline "";;

for i = 0 to 9 do
  Printf.printf "%d " i
done
;;

(* for loop *)

let _ = print_endline ""
