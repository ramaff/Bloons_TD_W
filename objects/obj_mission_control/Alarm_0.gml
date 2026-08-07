/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(global.tutorials, global.mission) {
	var _mission_tutorials = variable_struct_get(global.tutorials, global.mission)
	with instance_create_depth(400, 240, depth - 100, obj_tutorial_note) {
		text = variable_struct_get(_mission_tutorials, "0")
		page = 0;	
	}
}



