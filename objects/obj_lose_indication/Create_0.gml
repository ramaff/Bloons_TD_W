/// @description Insert description here
// You can write your code in this editor

alarm[0] = 180;

speed = 11;
direction = 90;

var _current_stage_prog = variable_struct_get(global.missions_complete, global.mission)

if global.mission = "the_stronghold" {
	if !_current_stage_prog.complete {
		if variable_struct_exists(global.upgrades_progress.jim, "unlocked_paths") {
			variable_struct_remove(global.upgrades_progress.jim.unlocked_paths, "Splodey Darts")
		}
	}
}

if global.mission = "wall_street" {
	if !_current_stage_prog.complete {
		if variable_struct_exists(global.upgrades_progress.angry_squirrel, "unlocked_paths") {
			variable_struct_remove(global.upgrades_progress.angry_squirrel.unlocked_paths, "Tree Tosser")
		}
	}
}


