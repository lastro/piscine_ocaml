(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   doctor.ml                                                                *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 16:26:41 by tlepetit                                 *)
(*   Updated: 2015/06/25 16:54:42 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor name age sidekick =
object (self)
  val _name:string = name
  val mutable _age = age
  val _sidekick = new People.people sidekick
  val mutable _hp = 100
  method to_string = "Instance of class doctor. Name: " ^ _name ^ " Age: " ^ (string_of_int _age) ^ " Sidekick: (" ^ _sidekick#to_string ^ ") hp: " ^ (string_of_int _hp)
  initializer print_endline "The doctor is here at last."; print_endline self#to_string
  method talk = print_endline "Hi! I'm the Doctor!"
  method travel_in_time start arrival = _age <- _age + arrival - start; print_endline
"
          _
         /-\\
    _____|#|_____
   |_____________|
  |_______________|
|||_POLICE_##_BOX_|||
 | |¯|¯|¯|||¯|¯|¯| |
 | |-|-|-|||-|-|-| |
 | |_|_|_|||_|_|_| |
 | ||~~~| | |¯¯¯|| |
 | ||~~~|!|!| O || |
 | ||~~~| |.|___|| |
 | ||¯¯¯| | |¯¯¯|| |
 | ||   | | |   || |
 | ||___| | |___|| |
 | ||¯¯¯| | |¯¯¯|| |
 | ||   | | |   || |
 | ||___| | |___|| |
|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
"
  method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
  method private regenerate = _hp <- 100
  method simulate_attack =
	print_endline "The dalecks attack!";
	_sidekick#die;
	print_endline "The Doctor is wounded!";
	_hp <- 42;
	print_endline self#to_string;
	print_endline "The Doctor regenerates";
	self#regenerate;
	print_endline self#to_string
end
  
