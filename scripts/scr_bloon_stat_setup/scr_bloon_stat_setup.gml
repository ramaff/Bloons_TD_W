// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_stat_setup(_bloon = self, _class = "normal", _layer = "red", _properties = [], _round = 0){

	var _class_stats = struct_get(global.bloon_stats, _class)
	
	_bloon.bloon_stats = variable_clone(struct_get(_class_stats, _layer))
	_bloon.bloon_stats.round = _round;
	
	for(var _i = 0; _i < array_length(_properties); _i++) {
		variable_struct_set(_bloon.bloon_stats, _properties[_i], true)
	}

	if variable_struct_exists(_bloon.bloon_stats, "index") {
		_bloon.image_index = _bloon.bloon_stats.index
	}
	if variable_struct_exists(_class_stats, "sprite") {
		_bloon.sprite_index = asset_get_index(_class_stats.sprite);
	}
	show_debug_message(_bloon.bloon_stats)
	if variable_struct_exists(_bloon.bloon_stats, "sprite") {
		_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
	}
	path = pth_training_tent;
	if _class = "deflation" {
		_bloon.sprite_index = spr_big_deflation_bloon;
		target = instance_create_depth(x, y, depth, obj_bloon_target);
		with(target) {
			path_position = 0;
			path_start(other.path, _bloon.bloon_stats.speed, path_action_stop, true);
		}
	} else {
		path_start(path, bloon_stats.speed, path_action_stop, true);
	}
	
	if variable_struct_exists(_bloon.bloon_stats, "tattered") {
		_bloon.bloon_stats.speed = _bloon.bloon_stats.speed * 2
		variable_struct_set(_bloon.bloon_stats, "tattered_sprite", spr_bloon_tattered)
	}
	
	_bloon.speed = _bloon.bloon_stats.speed
	_bloon.path_speed = _bloon.speed
	_bloon.depth = -_bloon.bloon_stats.layers
	_bloon.bloon_stats.max_health = _bloon.bloon_stats.health;

}