(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 19:45:17 by tlepetit                                 *)
(*   Updated: 2015/06/25 21:49:20 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let h = new Hydrogen.hydrogen in
  print_endline h#to_string;
  let o = new Oxygen.oxygen in
  print_endline o#to_string;
  let c = new Carbon.carbon in
  print_endline c#to_string

