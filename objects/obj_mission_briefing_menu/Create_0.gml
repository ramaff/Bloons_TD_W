/// @description Insert description here
// You can write your code in this editor

track_room = rm_training_room
track_name = ""
track_info = {}

var _unlocked_towers = struct_get_names(global.towers_progress)
var _xx = 320;
var _yy = 60;
var _count = 0;

for(var _i = 0; _i < array_length(global.added_towers); _i++) {
	var _tower = global.added_towers[_i]
	
	if !array_contains(_unlocked_towers, _tower) {
		_unlocked_towers[array_length(_unlocked_towers)] = _tower	
	}
}

for(var _i = 0; _i < array_length(_unlocked_towers); _i++) {
	var _tower = _unlocked_towers[_i]
	if !array_contains(global.added_towers, _tower) {
		if _tower = "selected" {
			continue;
		}
		if variable_struct_get(variable_struct_get(global.towers_progress, _tower), "unlocked") = false {
			continue;
		}
	}
	if _count mod 2 = 0 {
		_xx += 64;	
	}
	with instance_create_depth(_xx, _yy + (64 * (_count mod 2)), depth - 2, obj_mission_tower_butt) {
		base_tower_id = _tower
		tower_stats = scr_get_tower_stats(base_tower_id)
		if variable_struct_exists(tower_stats, "butt_sprite") {
			sprite_index = asset_get_index(tower_stats.butt_sprite)
		}
	}
	_count++;
}

_xx = -64;
_yy = 60;
_count = 0;
var _unlocked_heroes = struct_get_names(global.heroes_progress)

for(var _i = 0; _i < array_length(global.added_heroes); _i++) {
	var _hero = global.added_heroes[_i]
	
	if !array_contains(_unlocked_heroes, _hero) {
		_unlocked_heroes[array_length(_unlocked_heroes)] = _hero;
	}
}

for(var _i = 0; _i < array_length(_unlocked_heroes); _i++) {
	var _hero = _unlocked_heroes[_i]
	if !array_contains(global.added_heroes, _hero) {
		if _hero = "selected" {
			continue;
		}
		if variable_struct_get(variable_struct_get(global.heroes_progress, _hero), "unlocked") = false {
			continue;
		}
	}
	if _count mod 2 = 0 {
		_xx += 128;
	}
	with instance_create_depth(_xx, _yy + (64 * (_count mod 2)), depth - 2, obj_mission_hero_butt) {
		base_tower_id = _hero
		tower_stats = scr_get_tower_stats(base_tower_id)
		if variable_struct_exists(tower_stats, "butt_sprite") {
			sprite_index = asset_get_index(tower_stats.butt_sprite)
		}
	}
	_count++;
}

