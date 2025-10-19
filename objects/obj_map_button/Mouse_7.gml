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
	global.added_cash = 100;
}
if _track = "rm_the_bridge" {
	global.added_towers = ["goonkey"]
	global.added_cash = 200;
}
if _track = "rm_the_forest" {
	global.added_towers = ["marbles_monkey"]
	global.added_cash = 200;
}
if _track = "rm_tower_defense" {
	global.added_towers = ["caster_monkey"]
	global.added_cash = 300;
}
if _track = "rm_the_stronghold" {
	var _req_mission_prog = variable_struct_get(global.missions_complete, "the_stronghold")
	if !_req_mission_prog.complete {
		if variable_struct_exists(global.upgrades_progress.jim, "unlocked_paths") {
			variable_struct_set(global.upgrades_progress.jim.unlocked_paths, "Splodey Darts", {"unlocked_upgrades": 2})
		}
	}
	global.added_cash = 400;
}
if _track = "rm_desert_road" {
	global.added_towers = ["skateboard_monkey"]
	global.added_cash = 500;
}
if _track = "rm_traffic_jam" {
	global.added_heroes = ["trickster"]
	global.added_cash = 500;
}
if _track = "rm_wall_street" {
	global.added_heroes = ["trickster"]
	global.added_cash = 600;
}

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




