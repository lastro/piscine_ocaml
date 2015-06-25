(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   atom.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 19:45:05 by tlepetit                                 *)
(*   Updated: 2015/06/25 22:22:34 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom name symbol atomic_number =
object (self)
  method name = name
  method symbol = symbol
  method atomic_number =
	atomic_number
  method to_string = "Atom: " ^ name ^ " Symbol: " ^ symbol ^ " Atomic number: " ^ (string_of_int atomic_number)
  method equals (a:atom) = (name = a#name) && (symbol = a#symbol) && (atomic_number = a#atomic_number)
end
