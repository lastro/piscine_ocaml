(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 19:45:17 by tlepetit                                 *)
(*   Updated: 2015/11/13 14:38:22 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let diox = new Carbon_dioxyde.carbon_dioxyde
  in print_endline diox#to_string;
	 let water = new Water.water in
	 print_endline water#to_string;
	 let trini = new Trinitrotoluene.trinitrotoluene in
	 print_endline trini#to_string;
	 let nitrate = new Nitrate.nitrate in
	 print_endline nitrate#to_string;
	 let adenine = new Adenine.adenine in
	 print_endline adenine#to_string;
	 if (water#equals (new Water.water)) then
		  print_endline "two molecules of water are equal"
		 else
		   print_endline "problem!"
