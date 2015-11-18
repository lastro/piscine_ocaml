(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   nitrate.ml                                                               *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 14:24:27 by tlepetit                                 *)
(*   Updated: 2015/11/13 14:26:05 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class nitrate =
object
  inherit Molecule.molecule "nitrate" [new Oxygen.oxygen; new Nitrogen.nitrogen; new Oxygen.oxygen;
									   new Oxygen.oxygen]
end
