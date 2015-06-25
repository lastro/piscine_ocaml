(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 19:45:17 by tlepetit                                 *)
(*   Updated: 2015/06/25 22:26:05 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let h = new Hydrogen.hydrogen in
  print_endline h#to_string;
  let o = new Oxygen.oxygen in
  print_endline o#to_string;
  let c = new Carbon.carbon in
  print_endline c#to_string;
  if not (c#equals o) then
	print_endline "Carbon is not oxygen!"
  else
	print_endline "What?";
  let h2 = new Hydrogen.hydrogen in
  if h#equals h2 then
	print_endline "Both hydrogens are equal."
  else
	print_endline "uh?"
				  

