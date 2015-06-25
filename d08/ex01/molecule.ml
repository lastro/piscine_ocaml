(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   molecule.ml                                                              *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 21:58:17 by tlepetit                                 *)
(*   Updated: 2015/06/25 22:29:39 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual molecule (name:string) (lst:(Atom.atom list)) =
object
  method name = name
  method symbol:(Atom.atom list) = lst
end
		  
