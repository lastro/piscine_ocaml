(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   dioxygene.ml                                                             *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 19:21:09 by tlepetit                                 *)
(*   Updated: 2015/11/13 19:22:37 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class dioxygene =
object
  inherit Molecule.molecule "dioxygene" [new Oxygen.oxygen; new Oxygen.oxygen]
end
