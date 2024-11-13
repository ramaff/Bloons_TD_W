/// @description Insert description here
// You can write your code in this editor


var _req = "parade"
//show_debug_message(global.missions_complete)
//show_debug_message(_req)
var _req_mission_prog = variable_struct_get(global.missions_complete, _req)
//show_debug_message(_req_mission_prog)
	
if !_req_mission_prog.complete {
	exit;	
}

draw_self()

