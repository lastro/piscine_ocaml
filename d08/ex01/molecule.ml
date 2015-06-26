(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   molecule.ml                                                              *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 21:58:17 by tlepetit                                 *)
(*   Updated: 2015/06/26 13:22:00 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual molecule (name:string) (lst:(Atom.atom list)) =
object
  method name = name
  method symbol:(Atom.atom list) =
	let rec count a (list:(Atom.atom list)) =
	  match list with
	  |[] -> 0
	  |hd::tl when hd#equals a -> 1 + (count a tl)
	  |hd::tl -> count a tl
	in
	count (new Hydrogen.hydrogen) lst;
	lst
end
		  
