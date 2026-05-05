let div = (/.)

let idiv = (/)

let save f zero = (fun x y -> if y = zero then zero else f x y)

let div = save div 0.

let idiv = save idiv 0
