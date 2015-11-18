(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   ex04.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/11 14:10:00 by tlepetit                                 *)
(*   Updated: 2015/11/11 18:21:28 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

module type VAL =
  sig
	type t
	val add : t -> t -> t
	val mul : t -> t -> t
  end

module type EVALEXPR =
  sig
	type t
	type expr = Value of t | Add of (expr * expr) | Mul of (expr * expr)
	val eval : expr -> t
  end
	
module type MAKEEVALEXPR =
  functor (Val : VAL) -> EVALEXPR with type t = Val.t

module MakeEvalExpr : MAKEEVALEXPR =
  functor (Val : VAL) ->
  struct
	type t = Val.t
	type expr = Value of t | Add of (expr * expr) | Mul of (expr * expr)
	let rec eval expr =
	  match expr with
	  | Value expr1 -> expr1
	  | Add (expr1, expr2) -> Val.add (eval expr1) (eval expr2)
	  | Mul (expr1, expr2) -> Val.mul (eval expr1) (eval expr2)
																
  end

module IntVal : (VAL with type t = int) =
  struct
	type t = int
	let add = ( + )
	let mul = ( * )
  end
	
module FloatVal : (VAL with type t = float) =
  struct
	type t = float
	let add = ( +. )
	let mul = ( *. )
  end

module StringVal : (VAL with type t = string) =
  struct
	type t = string
	let add s1 s2 = if (String.length s1) > (String.length s2) then s1 else s2
	let mul = ( ^ )
  end

module IntEvalExpr : (EVALEXPR with type t := IntVal.t) = MakeEvalExpr (IntVal)
module FloatEvalExpr : (EVALEXPR with type t := FloatVal.t) = MakeEvalExpr (FloatVal)
module StringEvalExpr : (EVALEXPR with type t := StringVal.t) = MakeEvalExpr (StringVal)

let (ie : IntEvalExpr.expr) = (IntEvalExpr.Value 40)
let (fe : FloatEvalExpr.expr) = FloatEvalExpr.Add (FloatEvalExpr.Value 41.5, FloatEvalExpr.Value 0.92)
let (se : StringEvalExpr.expr) = StringEvalExpr.Mul (StringEvalExpr.Value "very ",
							 (StringEvalExpr.Add (StringEvalExpr.Value "very long",
												  StringEvalExpr.Value "short")))
												
let () = Printf.printf "Res = %d\n" (IntEvalExpr.eval ie)
let () = Printf.printf "Res = %f\n" (FloatEvalExpr.eval fe)
let () = Printf.printf "Res = %s\n" (StringEvalExpr.eval se)
