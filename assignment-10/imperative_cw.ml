(* let copy_arr arr copy_arr = if Array.length arr  = Array.length copy_arr then failwith "length mismatch" else let len = Array.length arr in let rec iter arr i = if i < 0 then copy_arr else copy_arr.(i) <- arr.(i); 
iter arr (i-1) *)

let copy_array arr1 arr2 =
  if Array.length arr1 != Array.length arr2 then failwith "length mismatch"
  else
    let len = Array.length arr1 in
    for i = 0 to len - 1 do
      arr2.(i) <- arr1.(i)
    done;
    arr2

let main () =
  let a1 = [| 1; 2; 3 |] and a2 = [| 2; 3; 4 |] in
  let a3 = copy_array a1 a2 in
  print_endline
    (String.concat " " (List.map (fun x -> string_of_int x) (Array.to_list a3)))

let _ = main ()
