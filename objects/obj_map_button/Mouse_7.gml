/// @description Insert description here
// You can write your code in this editor

var _track = room_get_name(track);

var _track_info = variable_struct_get(tracks_info, _track);

if variable_struct_exists(_track_info, "requirement") {
	var _req = _track_info.requirement
	var _req_mission_prog = variable_struct_get(global.missions_complete, _req)
	
	if !_req_mission_prog.complete {
		exit;	
	}
}

var _track_room = track
var _menu = noone;

global.added_heroes = []
global.added_towers = []

if _track = "rm_bloon_academia" {
	global.added_heroes = ["angry_squirrel"]	
}
if _track = "rm_autumn_acres" {
	global.added_towers = ["assassin_monkey"]	
}
if _track = "rm_graveyard" {
	global.added_towers = ["haunted_monkey"]	
}
if _track = "rm_parade" {
	global.added_heroes = ["clown_monkey"]	
}
if _track = "rm_the_bridge" {
	global.added_towers = ["goonkey"]	
}
if _track = "rm_the_forest" {
	global.added_towers = ["marbles_monkey"]	
}

global.pickable_tower_slots = 6 - array_length(global.added_towers)
global.pickable_hero_slots = 3 - array_length(global.added_heroes)

//var _selected_towers = global.towers_progress.selected
//var _selected_heroes = global.heroes_progress.selected

global.towers_progress.selected = [];
global.heroes_progress.selected = [];

/*for(var _i = 0; _i < array_length(global.added_towers); _i++) {
	var _ind = array_get_index(global.towers_progress.selected, global.added_towers[_i])
	if _ind != 1 {
		array_delete(global.towers_progress.selected, _ind, 1)
	}
}

for(var _i = 0; _i < array_length(global.added_heroes); _i++) {
	var _ind = array_get_index(global.heroes_progress.selected, global.added_heroes[_i])
	if _ind != 1 {
		array_delete(global.heroes_progress.selected, _ind, 1)
	}
} */

with instance_create_depth(0, 0, depth - 1, obj_mission_briefing_menu) {
	track_room = _track_room
	track_name = _track
	track_info = _track_info
	_menu = id;
}

with instance_create_depth(690, 390, depth - 2, obj_mission_start_button) {
	menu = _menu	
}

instance_deactivate_object(obj_map_button)

//global.paths = _track_info.paths
//global.round_data = _track_info.round_data
//global.mission = string_replace(_track_info.name, " ", "_")

//room_goto(track)




