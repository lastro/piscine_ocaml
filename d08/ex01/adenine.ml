(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   adenine.ml                                                               *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 14:29:23 by tlepetit                                 *)
(*   Updated: 2015/11/13 14:32:58 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class adenine =
object
  inherit Molecule.molecule "adenine" [new Hydrogen.hydrogen; new Hydrogen.hydrogen; new Hydrogen.hydrogen;
									   new Hydrogen.hydrogen; new Hydrogen.hydrogen; new Nitrogen.nitrogen;
									   new Nitrogen.nitrogen; new Nitrogen.nitrogen; new Nitrogen.nitrogen;
									   new Nitrogen.nitrogen; new Carbon.carbon; new Carbon.carbon;
									   new Carbon.carbon; new Carbon.carbon; new Carbon.carbon]
end
  
