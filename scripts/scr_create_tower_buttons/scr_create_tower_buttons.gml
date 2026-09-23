// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower_buttons(){
	var _tower_prog = global.towers_progress
	
	var _heroes = variable_clone(global.heroes_progress.selected)

	for (var _i = 0; _i < array_length(global.added_heroes); _i++) {
		_heroes[array_length(_heroes)] = global.added_heroes[_i];	
	}
	
	for(var _i = 0; _i < array_length(_heroes); _i++) {
		with instance_create_depth(816, 64 + (_i * 64), depth, obj_hero_butt) {
			base_tower_id = _heroes[_i];
			tower_stats = scr_get_tower_stats(base_tower_id)
			var _hero_id = noone
			with(obj_hero) {
				if base_tower_id == _heroes[_i] {
					_hero_id = id;
					break;
				}
			}
			if instance_exists(_hero_id) {
				hero_placed = true;
				hero_id = _hero_id;
			} else {
				if variable_struct_exists(global.placed_towers, _heroes[_i]) {
					var _max_count = 999999
					if variable_struct_exists(tower_stats, "max_count") {
						_max_count = tower_stats.max_count	
					}
					if variable_struct_get(global.placed_towers, _heroes[_i]) >= _max_count {
						instance_destroy()
					}
				}
				hero_placed = false;
				hero_id = noone;
			}
			if variable_struct_exists(tower_stats, "butt_sprite") {
				sprite_index = asset_get_index(tower_stats.butt_sprite)
			}
		}
	}
	
	var _towers = variable_clone(global.towers_progress.selected)
	
	for (var _i = 0; _i < array_length(global.added_towers); _i++) {
		_towers[array_length(_towers)] = global.added_towers[_i];	
	}
	
	for(var _j = 0; _j < 3; _j++) {
		for(var _k = 0; _k < 2; _k++) {
			if (_j * 2) + _k >= array_length(_towers) {
				break;	
			}
			with instance_create_depth(812 + (72 * _k), 256 + (64 * _j), depth, obj_tower_butt) {
				base_tower_id = _towers[(_j * 2) + _k]
				tower_stats = scr_get_tower_stats(base_tower_id)
				if variable_struct_exists(tower_stats, "butt_sprite") {
					sprite_index = asset_get_index(tower_stats.butt_sprite)
				}
				var _max_count = 999999
				var _remain_count = _max_count
				if variable_struct_exists(tower_stats, "max_count") {
					_max_count = tower_stats.max_count	
					_remain_count = _max_count
				}
				if variable_struct_exists(global.placed_towers, base_tower_id) {
					_remain_count -= variable_struct_get(global.placed_towers, base_tower_id)
					if _remain_count <= 0 {
						instance_destroy()
					}
				}
				remaining_count = _remain_count
			}
		}
	}
		
}