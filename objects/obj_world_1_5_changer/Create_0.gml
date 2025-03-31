/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

var _req_mission_prog = variable_struct_get(global.missions_complete, "parade")
	
if !_req_mission_prog.complete {
	instance_destroy()
}