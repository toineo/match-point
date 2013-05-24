open Operators

let cart_to_polar x y =
    sqrt (x ** 2. +. y ** 2.), atan2 y x


let get_center points =
  let (x, y) = List.fold_left 
    (fun (a, b) (x, y) -> (a +. x, b +. y))
    (0., 0.) points 
  in
  let sz = List.length points in
  x /. float_of_int sz, y /. float_of_int sz



let rotate angle (c_x, c_y) points = 
  let cos_, sin_ = cos angle, sin angle in
  List.map (fun (p_x, p_y) ->
    let dx, dy = p_x -. c_x, p_y -. c_y in
    (dx *. cos_ -. dy *. sin_ +. p_x,
     dy *. cos_ +. dx *. sin_ +. p_y)
    ) points

(* Add the result of a unit -> int and an int *)
let (++.) f n = (f ()) +. n

let add_rand c = 
  (++.) (fun () -> c *. (Random.float 1.)) 
(* Delay the application of random to avoid using the same random number *)
    
let shake c = List.map
  ((add_rand c) *** (add_rand c))


let for_each_float cur max incr f =
  let rec _rec cur max incr f =
    (if (cur < max) then
	begin
	  f cur;
	  _rec (cur +. incr) max incr f;
	end
     else
	()
    )
  in
  _rec cur (max +. 0.001) incr f
