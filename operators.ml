(* "Pair pipin'" *)
let ( *** ) f g = fun (a, b) -> f a, g b
let ( &&& ) f g = fun x -> f x, g x

let ( =<& ) f g1 = 
  fun g2 ->
    fun x1 x2 -> f (g1 x1) (g2 x2)

(* Composition *)
let ( =< ) f g = fun x -> f (g x)
let ( =<@ ) f g = fun x y -> f (g x y)

(* For haskellers :) *)
let ( $ ) f x = f x

(* Apply partially while skipping one parameter *)
let ( *- ) f y = fun x -> f x y
