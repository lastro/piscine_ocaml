(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   ex01.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/06/24 20:14:18 by tlepetit                                 *)
(*   Updated: 2015/06/24 21:26:23 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

module Test : Hashtbl.HashedType =
  struct
	type t = string
	let equal s t =
	  s = t
	let hash s =
	  let aux = ref 5381 in
		  String.iter (fun c -> aux := !aux + (Char.code c)) s;
		  !aux
  end

module StringHashtbl = Hashtbl.Make(Test)

let () =
  let ht = StringHashtbl.create 5 in
  let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
  let pairs = List.map (fun s -> (s, String.length s)) values in
  List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
  StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
