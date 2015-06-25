(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   army.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 18:40:27 by tlepetit                                 *)
(*   Updated: 2015/06/25 18:55:07 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class ['a] army =
object
  val mutable _lst:'a list = []
  method add (elem:'a) = _lst <- elem::_lst
  method delete = _lst <- List.tl _lst
  method get_lst = _lst
end
  
