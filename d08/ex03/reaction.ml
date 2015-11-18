(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   reaction.ml                                                              *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 18:42:27 by tlepetit                                 *)
(*   Updated: 2015/11/13 19:03:24 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual reaction (lst1:((Molecule.molecule * int) list)) (lst2:((Molecule.molecule * int) list)) =
object
  method virtual get_start: (Molecule.molecule * int) list
  method virtual get_result: (Molecule.molecule * int) list
  method virtual balance: reaction
  method virtual is_balanced: bool
  method virtual  to_string: string
end
