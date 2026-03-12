let copy_array_imp arr1 arr2 =
  if Array.length arr1 != Array.length arr2 then failwith "length mismatch"
  else
    let len = Array.length arr1 in
    for i = 0 to len - 1 do
      arr2.(i) <- arr1.(i)
    done;
    arr2

let copy_array_rec arr1 arr2 =
  if Array.length arr1 != Array.length arr2 then failwith "length mismatch"
  else
    let rec iter i =
      if i < 0 then arr2
      else
        let () = arr2.(i) <- arr1.(i) in
        iter (i - 1)
    in
    iter (Array.length arr1 - 1)

let main () =
  let a1 = [| 1; 2; 3 |] and a2 = [| 2; 3; 4 |] in
  let a3 = copy_array_imp a1 a2 in
  print_endline
    (String.concat " " (List.map (fun x -> string_of_int x) (Array.to_list a3)))

let _ = main ()
