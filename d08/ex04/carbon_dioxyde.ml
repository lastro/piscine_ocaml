(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   carbon_dioxyde.ml                                                        *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 14:15:35 by tlepetit                                 *)
(*   Updated: 2015/11/13 14:24:13 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class carbon_dioxyde =
object
  inherit Molecule.molecule "carbon dioxyde" [new Oxygen.oxygen; new Oxygen.oxygen; new Carbon.carbon]
end
  
