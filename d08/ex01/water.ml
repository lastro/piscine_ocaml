(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   water.ml                                                                 *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 14:11:24 by tlepetit                                 *)
(*   Updated: 2015/11/13 14:14:31 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class water =
object
  inherit Molecule.molecule "water" [new Hydrogen.hydrogen; new Oxygen.oxygen; new Hydrogen.hydrogen]
end
