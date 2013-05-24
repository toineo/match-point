open Operators

let itf = float_of_int
let fti = int_of_float

let shake_c = 10.


let ref_pts = List.map (itf *** itf) 
  [0, 0; 14, 4; 3, 8; -12, -12; -2, 5; 10, 20; 30, -10] 

let pts =
  Utils.shake shake_c 
    (Utils.rotate 2. (0., 0.) 
       (List.map 
	  (((+.) 5.) *** ((+.) 9.))
	  ref_pts) 
    )

