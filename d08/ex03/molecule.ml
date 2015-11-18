(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   molecule.ml                                                              *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 21:58:17 by tlepetit                                 *)
(*   Updated: 2015/11/13 16:51:49 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual molecule (name:string) (lst:(Atom.atom list)) =
object (self)
  method name = name
  method symbol:(Atom.atom list) =
	let f = fun (a:Atom.atom) -> a#equals (new Carbon.carbon) in
	if (List.exists f lst) then
	  let sort (a:Atom.atom) (b:Atom.atom) =
		if a#equals (new Carbon.carbon) then -1
		else if b#equals (new Carbon.carbon) then 1
		else if a#equals (new Hydrogen.hydrogen) then -1
		else if b#equals (new Hydrogen.hydrogen) then 1
		else String.compare a#name b#name
	  in
	  List.sort sort lst
	else
	  let sort (a:Atom.atom) (b:Atom.atom) = String.compare a#name b#name
	  in
	  List.sort sort lst
  method formula =
	let rec string_atom a n l =
	  match l with
	  | [] -> if n = 0 then "" else begin if n != 1 then a#symbol ^ (string_of_int n) else a#symbol end
	  | hd::tl when hd#equals a -> string_atom a (n + 1) tl
	  | hd::tl -> if n != 1 then a#symbol ^ (string_of_int n) ^ (string_atom hd 1 tl) else a#symbol ^ (string_atom hd 1 tl)
	in
	match self#symbol with
	|[] -> ""
	|hd::tl -> string_atom hd 1 tl
  method to_string =
	self#name ^ ": " ^ self#formula
  method equals (m:molecule) = (name = m#name) && (self#formula = m#formula)
end
		  
