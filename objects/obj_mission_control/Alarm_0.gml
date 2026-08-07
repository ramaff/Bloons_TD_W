/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(global.tutorials, global.mission) {
	var _mission_tutorials = variable_struct_get(global.tutorials, global.mission)
	var _mission_tutorial_prog = variable_struct_get(global.tutorials_progress, global.mission)
	scr_create_note(_mission_tutorials, _mission_tutorial_prog, "0")
	
}



