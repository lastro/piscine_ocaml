(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   reaction.ml                                                              *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 18:42:27 by tlepetit                                 *)
(*   Updated: 2015/11/13 20:41:53 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual reaction (lst1:((Molecule.molecule * int) list)) (lst2:((Molecule.molecule * int) list)) =
object (self)
  method get_start = if self#is_balanced then lst1 else failwith "This reaction is not balanced."
  method get_result = if self#is_balanced then lst2 else failwith "This reaction is not balanced."
  method virtual balance: reaction
  method is_balanced =
	let lst_atom_start = List.concat (List.map (fun x -> (fst x)#symbol) lst1) and
		lst_atom_result = List.concat (List.map (fun x -> (fst x)#symbol) lst2) in
		let rec count l eq n = match l with
		  | [] -> n
		  | hd::tl when (eq hd) -> count tl eq (n + 1)
		  | hd::tl -> count tl eq n in
		let rec check l1 l2 = match l1 with
		  | [] -> true
		  | hd::tl when ((count l1 hd#equals 0) != (count l2 hd#equals 0)) -> false
		  | hd::tl -> check tl (List.tl l2) in
	check lst_atom_start lst_atom_result
  method virtual  to_string: string
end
