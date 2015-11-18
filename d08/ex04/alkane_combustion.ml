(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   alkane_combustion.ml                                                     *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/13 19:07:16 by tlepetit                                 *)
(*   Updated: 2015/11/13 23:32:15 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let rec gcd n m =
  if m = 0 then
	n
  else if n > m then
	gcd (n-m) m
  else
	gcd n (m-n)

let rec gcd_lst l n = match l with
  | [] -> n
  | hd::tl -> gcd_lst tl (gcd hd n)
		
class alkane_combustion (lst:(Alkane.alkane list)) =
  let l = (List.map (fun a -> (a, 1)) lst) @ [(new Dioxygene.dioxygene, 1)]
  and l2 = [(new Water.water, 1); (new Carbon_dioxyde.carbon_dioxyde, 1)] in
object (self)
  inherit Reaction.reaction l l2
  method balance =
	let rec count_alkane el l l_parcouru = match l with
	  | [] -> el::l_parcouru
	  | hd::tl when (fst hd)#equals (fst el) -> l_parcouru @ [(fst hd, snd hd + snd el)] @ tl
	  | hd::tl -> count_alkane el tl (l_parcouru @ [hd])
	in
	let rec count_rec l = match l with
	  | [] -> []
	  | hd::tl when List.length (count_alkane hd tl []) = (List.length l) -> hd::(count_rec l)
	  | hd::tl -> count_rec (count_alkane hd tl [])
	in
	let rec count_atom l eq n = match l with
	  | [] -> n
	  | hd::tl when (eq hd) -> count_atom tl eq (n + 1)
	  | hd::tl -> count_atom tl eq n
	in
	let lst_atom_start = List.concat (List.map (fun x -> x#symbol) lst)
	in
	let n_carbon = count_atom lst_atom_start (new Carbon.carbon)#equals 0
	in
	let n_hydrogen = count_atom lst_atom_start (new Hydrogen.hydrogen)#equals 0
	in
	object (self)
	  inherit Reaction.reaction (count_rec l) l2
	  method balance = self
	  method to_string = "placeholder"
	end
  method to_string = self#balance#to_string
end
