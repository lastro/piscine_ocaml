(* ************************************************************************** *)
(*                                                                            *)
(*                                                                            *)
(*   main.ml                                                                  *)
(*                                                                            *)
(*   By: tlepetit <thomas.lepetit1990@gmai...>                                *)
(*                                                                            *)
(*   Created: 2015/11/18 15:54:47 by tlepetit                                 *)
(*   Updated: 2015/11/18 16:27:09 by tlepetit                                 *)
(*                                                                            *)
(* ************************************************************************** *)

let minisleep (sec: float) =
  ignore (Unix.select [] [] [] sec)

let () =
  Graphics.open_graph " 800x600";
  let time_begin = Sys.time () in
  let rec frame_state () =
	let time_begin_loop = Sys.time () in
	let status = Graphics.wait_next_event [Graphics.Poll] in
	if status.Graphics.keypressed then
	  begin
		ignore (Graphics.wait_next_event [Graphics.Key_pressed]);
		print_string "test";
	  end;
	minisleep (max 0. (0.1 +. time_begin_loop -. (Sys.time ())));
  in
  frame_state ();
		
	
