type name = { firstname : string; lastname : string }

let full_name n = n.firstname ^ " " ^ n.lastname
let offspring c p = { p with firstname = c }

let main () =
  let raj = { firstname = "Raj"; lastname = "Kapoor" } in
  let rishi = offspring "Rishi" raj in
  print_endline (full_name rishi)

let _ = main ()
