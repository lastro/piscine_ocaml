let () =
  let arthur = new People.people "Arthur" in
  arthur#talk;
  print_endline "A dalek is here!";
  arthur#die;
  print_endline arthur#to_string
