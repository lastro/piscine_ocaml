(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/25 16:26:34 by tlepetit                                 *)
(*   Updated: 2015/06/25 19:01:13 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  Random.self_init ();
  let army = new Army.army in
  army#add (new Doctor.doctor "Who" 42 "Arthur");
  army#add (new Doctor.doctor "Whose" 22 "John");
  print_endline ("Size of doctor army: " ^ (string_of_int (List.length army#get_lst)));
  army#delete;
  army#delete;
  print_endline ("After 2 deletes, Size of doctor army: " ^ (string_of_int (List.length army#get_lst)));
  let army = new Army.army in
  army#add (new Dalek.dalek);
  army#add (new Dalek.dalek);
  army#add (new Dalek.dalek);
  print_endline ("Size of dalek army: " ^ (string_of_int (List.length army#get_lst)));
  army#delete;
  army#delete;
  army#delete;
  print_endline ("After 3 deletes, Size of dalek army: " ^ (string_of_int (List.length army#get_lst)));
  let army = new Army.army in
  army#add (new People.people "Jennifer");
  print_endline ("Size of the army of the people: " ^ (string_of_int (List.length army#get_lst)));
  army#delete;
  print_endline ("Size of the army of the people: " ^ (string_of_int (List.length army#get_lst)));
  print_endline "You have deleted Jennifer, you monster!"
