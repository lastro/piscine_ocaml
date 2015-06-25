(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 16:26:34 by tlepetit                                 *)
(*   Updated: 2015/06/25 18:28:39 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  Random.self_init ();
  let doctor = new Doctor.doctor "Who" 42 "Arthur" and dalek = new Dalek.dalek in
  doctor#talk;
  print_endline "A dalek appears!";
  print_endline dalek#to_string;
  print_endline "Horror! The dalek attacks my henchman!";
  dalek#exterminate doctor#get_sidekick;
  print_endline doctor#to_string;
  print_endline dalek#to_string;
  print_endline "The Doctor riposts!";
  dalek#die;
  print_endline dalek#to_string
