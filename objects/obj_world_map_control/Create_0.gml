/// @description Insert description here
// You can write your code in this editor

var _heroes_selected_amt = array_length(global.heroes_progress.selected)
var _towers_selected_amt = array_length(global.towers_progress.selected)

global.pickable_tower_slots = 6;
global.pickable_hero_slots = 3;
global.added_towers = []
global.added_heroes = []

var _selected_heroes = {}
var _selected_towers = {}

for(var _i = 0; _i < _heroes_selected_amt; _i++) {
	variable_struct_set(_selected_heroes, global.heroes_progress.selected[_i], global.heroes_progress.selected[_i])
}
for(var _i = 0; _i < _towers_selected_amt; _i++) {
	variable_struct_set(_selected_towers, global.towers_progress.selected[_i], global.towers_progress.selected[_i])
}



/*
if global.heroes_progress.angry_squirrel.unlocked and !variable_struct_exists(_selected_heroes, "angry_squirrel") {
	with instance_create_depth(480, 600, -500, obj_world_map_note) {
		text = "The angry squirrel has joined your party"	
	}
	global.heroes_progress.selected[_heroes_selected_amt] = "angry_squirrel"
}
if global.towers_progress.assassin_monkey.unlocked and !variable_struct_exists(_selected_towers, "assassin_monkey") {
	with instance_create_depth(480, 600, -500, obj_world_map_note) {
		text = "The assassin monkey has joined your party"	
	}
	global.towers_progress.selected[_towers_selected_amt] = "assassin_monkey"
}
if global.towers_progress.haunted_monkey.unlocked and !variable_struct_exists(_selected_towers, "haunted_monkey") {
	with instance_create_depth(480, 600, -500, obj_world_map_note) {
		text = "The haunted monkey has joined your party"	
	}
	global.towers_progress.selected[_towers_selected_amt] = "haunted_monkey"
}
if global.heroes_progress.clown_monkey.unlocked and !variable_struct_exists(_selected_heroes, "clown_monkey") {
	with instance_create_depth(480, 600, -500, obj_world_map_note) {
		text = "The clown monkey has joined your party"	
	}
	global.heroes_progress.selected[_heroes_selected_amt] = "clown_monkey"
}
*/


if string_pos("world_map", room_get_name(room)) != -1 {
	scr_save_game()
}
