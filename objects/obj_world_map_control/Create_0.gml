/// @description Insert description here
// You can write your code in this editor

var _heroes_selected_amt = array_length(global.heroes_progress.selected)

var _selected_towers = {}

for(var _i = 0; _i < _heroes_selected_amt; _i++) {
	variable_struct_set(_selected_towers, global.heroes_progress.selected[_i], global.heroes_progress.selected[_i])
}

if global.heroes_progress.angry_squirrel.unlocked and !variable_struct_exists(_selected_towers, "angry_squirrel") {
	with instance_create_depth(480, 600, -500, obj_world_map_note) {
		text = "The angry squirrel has joined your party"	
	}
	global.heroes_progress.selected[_heroes_selected_amt] = "angry_squirrel"
}




scr_save_game()
