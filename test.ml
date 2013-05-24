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


let ap f g = fun x -> f x; g ()

let prt_list = List.iter (fun x -> Format.printf "%f - %f@." (fst x) (snd x))

let nl () =
  Format.printf "@."

let distance = 
  let sq = (( ** ) *- 2.) in
  fun (x1, y1) (x2, y2) ->
    (sqrt =<@ (+.)) =<& sq $ sq
      $ (x1 -. x2) $ (y1 -. y2)

let internal_dis l = 
  List.map (List.map *- l =< distance) l
    


let print_dis_ar =
  List.iter 
    (fun l -> List.iter (Format.printf "%5.2f  ") l; nl ())

let () = 
  prt_list ref_pts;
  nl ();
  prt_list pts;
  nl ();

  let dis_pts, dis_ref = 
    internal_dis pts, internal_dis ref_pts
  in
  
  print_dis_ar dis_pts;
  nl ();
  print_dis_ar dis_ref
