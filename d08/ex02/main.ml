(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 19:45:17 by tlepetit                                 *)
(*   Updated: 2015/11/13 17:26:08 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let methane = new Methane.methane in
  print_endline methane#to_string;
  let ethane = new Ethane.ethane in
  print_endline ethane#to_string;
  let octane = new Octane.octane in
  print_endline octane#to_string;
