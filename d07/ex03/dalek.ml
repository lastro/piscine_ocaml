(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   dalek.ml                                                                 *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 17:01:56 by tlepetit                                 *)
(*   Updated: 2015/06/25 18:29:34 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class dalek =
object (self)
  val _name =
	let f n c =
	  if n < 5 then
		c
	  else
		  let n = 33 + (Random.int (126 - 33)) in
		  char_of_int n
	in
	String.mapi f "DalekXXX"

  val mutable _hp = 100
  val mutable _shield = true
  method to_string = "Instance of class dalek. Name: " ^ _name ^ " hp: " ^ string_of_int _hp ^ " shield: " ^ string_of_bool _shield
  method talk =
	match Random.int 4 with
	|0 -> print_endline "Explain! Explain!"
	|1 -> print_endline "Exterminate! Exterminate!"
	|2 -> print_endline "I obey!"
	|_ -> print_endline "You are the Doctor! You are the enemy of the Daleks!"
  method exterminate (human:People.people) =
	human#die;
	_shield <- not _shield
  method die =
	_hp <- 0;
	print_endline "Emergency Temporal Shift!"
end
