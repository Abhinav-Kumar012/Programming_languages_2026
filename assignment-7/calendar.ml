module Calendar = struct
  type month =
    | JAN
    | FEB
    | MAR
    | APR
    | MAY
    | JUN
    | JUL
    | AUG
    | SEP
    | OCT
    | NOV
    | DEC

  type date = { day : int; month : month; year : int }

  let is_leap_year year_num =
    if year_num mod 400 = 0 then true
    else if year_num mod 100 = 0 then false
    else if year_num mod 4 = 0 then true
    else false

  let get_month_day year_num month =
    match month with
    | JAN | MAR | MAY | JUL | AUG | OCT | DEC -> 31
    | FEB -> if is_leap_year year_num then 29 else 28
    | _ -> 30

  let next_month m =
    match m with
    | JAN -> FEB
    | FEB -> MAR
    | MAR -> APR
    | APR -> MAY
    | MAY -> JUN
    | JUN -> JUL
    | JUL -> AUG
    | AUG -> SEP
    | SEP -> OCT
    | OCT -> NOV
    | NOV -> DEC
    | DEC -> JAN

  let next_date d =
    let last_day = get_month_day d.year d.month in
    if d.day < last_day then { d with day = d.day + 1 }
    else if d.day = last_day && d.month != DEC then
      { d with day = 1; month = next_month d.month }
    else { day = 1; month = JAN; year = d.year + 1 }

  let new_date d m y = { day = d; month = m; year = y }

  let month_str m =
    match m with
    | JAN -> "JAN"
    | FEB -> "FEB"
    | MAR -> "MAR"
    | APR -> "APR"
    | MAY -> "MAY"
    | JUN -> "JUN"
    | JUL -> "JUL"
    | AUG -> "AUG"
    | SEP -> "SEP"
    | OCT -> "OCT"
    | NOV -> "NOV"
    | DEC -> "DEC"

  let string_of_date d =
    string_of_int d.day ^ "-" ^ month_str d.month ^ "-" ^ string_of_int d.year
end

let main () =
  let day = Calendar.new_date 29 FEB 2004 in
  let next_day = Calendar.next_date day in
  print_endline (Calendar.string_of_date next_day)

let _ = main ()
