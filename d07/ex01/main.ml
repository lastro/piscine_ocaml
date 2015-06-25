(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 16:26:34 by tlepetit                                 *)
(*   Updated: 2015/06/25 16:52:17 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let doctor = new Doctor.doctor "Who" 42 "Arthur" in
  doctor#talk;
  print_endline "Let's travel in time to 1984!";
  doctor#travel_in_time 2015 1984;
  print_endline (doctor#to_string);
  print_endline "Quick! To the screwdriver!";
  doctor#use_sonic_screwdriver;
  print_endline "proxy method to test the private regenarate:";
  doctor#simulate_attack
