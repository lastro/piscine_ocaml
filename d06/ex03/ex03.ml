(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   ex03.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/10 18:02:35 by tlepetit                                 *)
(*   Updated: 2015/11/11 14:06:02 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)


module type FIXED = sig
	type t
	val of_float : float -> t
	val of_int : int -> t
	val to_float : t -> float
	val to_int : t -> int
	val to_string : t -> string
	val zero : t
	val one : t
	val succ : t -> t
	val pred : t -> t
	val min : t -> t -> t
	val max : t -> t -> t
	val gth : t -> t -> bool
	val lth : t -> t -> bool
	val gte : t -> t -> bool
	val lte : t -> t -> bool
	val eqp : t -> t -> bool (** physical equality *)
	val eqs : t -> t -> bool (** structural equality *)
	val add : t -> t -> t
	val sub : t -> t -> t
	val mul : t -> t -> t
	val div : t -> t -> t
	val foreach : t -> t -> (t -> unit) -> unit
  end

module type FRACTIONNAL_BITS =
  sig
	val bits : int
  end

module type MAKEFIXED =
  functor (FractionnalBits : FRACTIONNAL_BITS) -> FIXED

module Make : MAKEFIXED =
  functor (FractionnalBits : FRACTIONNAL_BITS) ->
  struct
	type t = int
	let of_float = fun x -> int_of_float (ceil ((2. ** float_of_int FractionnalBits.bits) *. x))
	let of_int = fun x -> x * int_of_float (2. ** float_of_int FractionnalBits.bits)
	let to_float  = fun x -> (float_of_int x) /. (2. ** float_of_int FractionnalBits.bits)
	let to_int  = fun x -> x / (int_of_float (2. ** float_of_int FractionnalBits.bits))
	let to_string = fun x -> string_of_float (to_float x)
	let zero = 0
	let one = int_of_float (2. ** float_of_int FractionnalBits.bits)
	let succ = fun x -> x + 1
	let pred = fun x -> x - 1
	let min = fun x -> fun y -> min x y
	let max = fun x -> fun y -> max x y
	let gth = fun x -> fun y -> x > y
	let lth = fun x -> fun y -> x < y
	let gte = fun x -> fun y -> x >= y
	let lte = fun x -> fun y -> x <= y
	let eqp = fun x -> fun y -> x == y
	let eqs = fun x -> fun y -> x = y
	let add = fun x -> fun y -> x + y
	let sub = fun x -> fun y -> x - y
	let mul = fun x -> fun y -> (x * y) asr FractionnalBits.bits
	let div = fun x -> fun y -> (x lsl FractionnalBits.bits) / y
	let rec foreach = fun x -> fun y -> fun f -> f x; if (x != y && x < y)then foreach (x + 1) y f
  end
	


module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)
							 
let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f));
  let z8 = Fixed8.of_float (-5.86) in
  print_endline ("test negatif (z8): ");
  print_endline (Fixed8.to_string z8);
  print_endline ("test sub z8 - x8: ");
  print_endline (Fixed8.to_string (Fixed8.sub z8 x8));
  print_endline ("test sub x8 - r8: ");
  print_endline (Fixed8.to_string (Fixed8.sub x8 r8));
  print_endline ("test of_int: ");
  print_endline (Fixed8.to_string (Fixed8.of_int 4));
  print_endline ("test to_int: ");
  print_int (Fixed8.to_int (Fixed8.of_int 4));
  print_char '\n';
  print_endline ("successor and predecessor of x8: ");
  print_endline (Fixed8.to_string (Fixed8.succ x8));
  print_endline (Fixed8.to_string (Fixed8.pred x8));
  print_endline ("min sur deux positifs: ");
  print_endline (Fixed8.to_string (Fixed8.min x8 y8));
  print_endline ("max sur deux positifs: ");
  print_endline (Fixed8.to_string (Fixed8.max x8 y8));
  print_endline ("min sur un negatif et un positif: ");
  print_endline (Fixed8.to_string (Fixed8.min x8 z8));
  print_endline ("max sur un negatif et un positif: ");
  print_endline (Fixed8.to_string (Fixed8.max x8 z8));
  print_endline ("min sur deux negatifs: ");
  print_endline (Fixed8.to_string (Fixed8.min z8 (Fixed8.of_int (-3))));
  print_endline ("max sur deux negatifs: ");
  print_endline (Fixed8.to_string (Fixed8.max z8 (Fixed8.of_int (-3))));
  if (Fixed8.gth y8 x8 && Fixed8.lth x8 y8 && Fixed8.gte x8 x8 && Fixed8.lte z8 y8) then
	print_endline " y8 is lesser than x8 and x8 is greater than y8 and x8 is greater or equal to x8 and z8 is lesser than y8" else print_endline "problem!";
  let a8 = Fixed8.of_float 21.10 in
  if (Fixed8.eqs x8 a8) then print_endline "x8 equals structurally another fixed at 21.10";
  if (Fixed8.eqp x8 a8) then print_endline "x8 equals physically another fixed at 21.10 (implementation dependant)";
  print_endline "x8 * y8: ";
  print_endline (Fixed8.to_string (Fixed8.mul x8 y8));
  print_endline "x8 * z8: ";
  print_endline (Fixed8.to_string (Fixed8.mul x8 z8));
  print_endline "z8 * z8: ";
  print_endline (Fixed8.to_string (Fixed8.mul z8 z8));
  print_endline "r8 / y8: ";
  print_endline (Fixed8.to_string (Fixed8.div r8 y8));
  print_endline "x8 / z8: ";
  print_endline (Fixed8.to_string (Fixed8.div x8 z8));
  print_endline "z8 / z8: ";
  print_endline (Fixed8.to_string (Fixed8.div z8 z8));
				
