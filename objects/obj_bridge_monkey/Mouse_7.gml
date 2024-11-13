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

if instance_number(obj_world_map_note) < 1 {
	with instance_create_depth(480, 600, -500, obj_world_map_note) {
		text = "Hey, the bridge is closed for repairs. Check back next year and it might be open."	
	}
}




