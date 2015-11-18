(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   ex00.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/24 19:53:15 by tlepetit                                 *)
(*   Updated: 2015/11/10 16:04:23 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

module StringSet = Set.Make(struct let compare = Pervasives.compare type t = string end)

let () =
  let set = List.fold_right StringSet.add [ "foo"; "bar"; "baz"; "qux" ] StringSet.empty in
  StringSet.iter print_endline set;
  print_endline (StringSet.fold ( ^ ) set "")
