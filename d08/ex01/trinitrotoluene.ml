(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   trinitrotoluene.ml                                                       *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 13:53:37 by tlepetit                                 *)
(*   Updated: 2015/11/13 14:11:58 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class trinitrotoluene =
object
  inherit Molecule.molecule "trinitotolune" [new Nitrogen.nitrogen; new Nitrogen.nitrogen; new Nitrogen.nitrogen;
	 new Hydrogen.hydrogen; new Hydrogen.hydrogen; new Hydrogen.hydrogen; new Hydrogen.hydrogen;
	 new Hydrogen.hydrogen; new Oxygen.oxygen; new Oxygen.oxygen; new Oxygen.oxygen; new Oxygen.oxygen;
	 new Oxygen.oxygen; new Oxygen.oxygen; new Carbon.carbon; new Carbon.carbon; new Carbon.carbon;
	 new Carbon.carbon; new Carbon.carbon; new Carbon.carbon; new Carbon.carbon]
end

