/// @description Insert description here
// You can write your code in this editor

global.previous_room = rm_world_1_map
global.menu = MENU.world_map
global.monkey_money = 0

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

if string_pos("world_map", room_get_name(room)) != -1 {
	scr_save_game()
}
