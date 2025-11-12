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
global.added_cash = 0;

var _current_mission_stats = variable_struct_get(global.mission_unlocks, _track);
var _mission_prog = variable_struct_get(global.missions_complete, string_delete(_track, 0, 3))
var _complete = _mission_prog.complete

scr_add_towers_upgrades(_current_mission_stats, _complete, true)
if variable_struct_exists(_current_mission_stats, "added_cash") {
	global.added_cash = variable_struct_get(_current_mission_stats, "added_cash")
}

/*
if _track = "rm_the_stronghold" {
	var _req_mission_prog = variable_struct_get(global.missions_complete, "the_stronghold")
	if !_req_mission_prog.complete {
		if variable_struct_exists(global.upgrades_progress.jim, "unlocked_paths") {
			variable_struct_set(global.upgrades_progress.jim.unlocked_paths, "Splodey Darts", {"unlocked_upgrades": 2})
		}
	}
	global.added_cash = 400;
}
*/


global.pickable_tower_slots = 6 - array_length(global.added_towers)
global.pickable_hero_slots = 3 - array_length(global.added_heroes)

//var _selected_towers = global.towers_progress.selected
//var _selected_heroes = global.heroes_progress.selected

global.towers_progress.selected = [];
global.heroes_progress.selected = [];

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




