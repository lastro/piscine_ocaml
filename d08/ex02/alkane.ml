(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   alkane.ml                                                                *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 16:50:09 by tlepetit                                 *)
(*   Updated: 2015/11/13 17:35:02 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let rec f n = match n with
  | 0 -> [new Hydrogen.hydrogen; new Hydrogen.hydrogen]
  | k -> [new Carbon.carbon; new Hydrogen.hydrogen; new Hydrogen.hydrogen] @ (f (n - 1))

let name_alkane n =
  match n with
  | 1 -> "methane"
  | 2 -> "ethane"
  | 3 -> "propane"
  | 4 -> "butane"
  | 5 -> "pentane"
  | 6 -> "hexane"
  | 7 -> "heptane"
  | 8 -> "octane"
  | 9 -> "nonane"
  | 10 -> "decane"
  | 11 -> "undecane"
  | 12 -> "dodecane"
  | _ -> "placeholder"

class virtual alkane (n:int) =
object (self)
  inherit Molecule.molecule (name_alkane n) (f n)
end
