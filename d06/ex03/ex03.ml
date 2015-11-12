(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   ex03.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/10 18:02:35 by tlepetit                                 *)
(*   Updated: 2015/11/10 19:40:14 by tlepetit                                 *)
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
	let mul = fun x -> fun y -> x * y
	let div = fun x -> fun y -> x / y
	let rec foreach = fun x -> fun y -> fun f -> f x; if (x != y && x < y)then foreach (x + 1) y f
  end
	


module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)
							 
let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f))
