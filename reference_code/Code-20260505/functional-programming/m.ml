(*
Augment the Calendar module with a next_date function which takes care to give valid
dates only. For example next_date (28, FEB, 2026) --> 1, MAR, 2026 etc.
*)

module type CALENDAR = sig
  type month = JAN | FEB | MAR | APR | MAY | JUN | JUL | AUG | SEP | OCT | NOV | DEC
  type date  (* = { day : int; mon : month; year : int } *)

  val make_date : int -> month -> int -> date
  val string_of_date : date -> string
  val next_date : date -> date
end

module Calendar : CALENDAR = struct
  type month = JAN | FEB | MAR | APR | MAY | JUN | JUL | AUG | SEP | OCT | NOV | DEC
  type date = { day : int; mon : month; year : int }

  let make_date d m y = { day = d; mon = m; year = y}

  let string_of_month m =
          match m with
            JAN ->  "JAN"
          | FEB ->  "FEB"
          | MAR ->  "MAR"
          | APR ->  "APR"
          | MAY ->  "MAY"
          | JUN ->  "June"
          | JUL ->  "July"
          | AUG ->  "August"
          | SEP ->  "September"
          | OCT ->  "October"
          | NOV ->  "November"
          | DEC ->  "December"

  let string_of_date d = "(" ^ (string_of_int d.day) ^ "," ^ (string_of_month d.mon) ^ "," ^ (string_of_int d.year) ^ ")"

  let is_leap_year y =
          if (y mod 100 = 0) then (y mod 400) = 0
          else (y mod 4 = 0)

  let last_day m y =
          match m with
            JAN | MAR | MAY | JUL | AUG | OCT | DEC  -> 31
          | APR | JUN | SEP | NOV -> 30
          | FEB -> if (is_leap_year y) then 29 else 28

  let next_month m =
          match m with
            JAN -> FEB
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
          if d.day = (last_day d.mon d.year) then
                  if d.mon = DEC then { day = 1; mon = JAN; year = d.year + 1}
                  else {day = 1; mon = next_month d.mon; year = d.year }
          else { d with day = d.day + 1 }
end
