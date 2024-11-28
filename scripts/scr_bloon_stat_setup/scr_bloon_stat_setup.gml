// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_stat_setup(_bloon = self, _class = "normal", _layer = "red", _path = pth_bloon_academia, _properties = [], _round = 0) {

	var _class_stats = struct_get(global.bloon_stats, _class)
	
	_bloon.bloon_stats = variable_clone(struct_get(_class_stats, _layer))
	_bloon.bloon_stats.round = _round;
	
	_bloon.bloon_stats = scr_merge_struct(_bloon.bloon_stats, _class_stats)
	
	_bloon.bloon_stats.class = _class
	_bloon.bloon_stats.layer = _layer
	
	_bloon.bloon_stats.projectile_hits = {}
	
	target = noone;
	
	var _xx = x;
	var _yy = y;
	
	if variable_struct_exists(_class_stats, "properties") {
		_bloon.bloon_stats.properties = array_concat(_properties, _class_stats.properties)
	} else {
		_bloon.bloon_stats.properties = _properties
	}
	
	for(var _i = 0; _i < array_length(_bloon.bloon_stats.properties); _i++) {
		variable_struct_set(_bloon.bloon_stats, _bloon.bloon_stats.properties[_i], true)
	}
	
	_bloon.bloon_stats.remaining_value = _bloon.bloon_stats.rbe;
	
	if !variable_struct_exists(_bloon.bloon_stats, "big_bloon_tier") {
		_bloon.bloon_stats.big_bloon_tier = 0;	
	}

	if variable_struct_exists(_class_stats, "sprite") and !variable_struct_exists(_bloon.bloon_stats, "sprite") {
		_bloon.bloon_stats.sprite = _class_stats.sprite
		_bloon.sprite_index = asset_get_index(_class_stats.sprite);
	}
	if variable_struct_exists(_bloon.bloon_stats, "regrow")  {
		_bloon.bloon_stats.sprite = "spr_regrow_bloon"
		if _class = "splitter" {
			_bloon.bloon_stats.sprite = "spr_regrow_splitter_bloon"
		}
	}
	if variable_struct_exists(_bloon.bloon_stats, "sprite") {
		_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
	}
	if variable_struct_exists(_bloon.bloon_stats, "index") {
		_bloon.image_index = _bloon.bloon_stats.index
	}
	
	_bloon.bloon_stats.path = _path
	if _class = "deflation" {
		//_bloon.sprite_index = spr_big_deflation_bloon;
		var _target = instance_create_depth(x, y, depth, obj_bloon_target);
		with(_target) {
			path_position = 0;
			path_start(_path, _bloon.bloon_stats.speed, path_action_stop, true);
			x = path_get_x(_path, 0)
			y = path_get_y(_path, 0)
		}
		_bloon.target = _target
	} else {
		path_start(_path, bloon_stats.speed, path_action_stop, true);
	}
	
	if variable_struct_exists(_bloon.bloon_stats, "tattered") {
		_bloon.bloon_stats.speed = _bloon.bloon_stats.speed * 2
		//variable_struct_set(_bloon.bloon_stats, "tattered_sprite", _class_stats.tattered_sprite)
	}
	if variable_struct_exists(_bloon.bloon_stats, "shielded") {
		//variable_struct_set(_bloon.bloon_stats, "shielded_sprite", _class_stats.shielded_sprite)
		_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.shielded_sprite);
		_bloon.bloon_stats.shield_health = floor(_bloon.bloon_stats.layers + sqrt(_bloon.bloon_stats.rbe - _bloon.bloon_stats.layers))
	}
	
	_bloon.speed = _bloon.bloon_stats.speed
	_bloon.path_speed = _bloon.speed
	_bloon.depth = -_bloon.bloon_stats.layers
	if !variable_struct_exists(_bloon.bloon_stats, "max_health") {
		_bloon.bloon_stats.max_health = _bloon.bloon_stats.health;
	}
	//_bloon.bloon_stats.max_health = _bloon.bloon_stats.health;
	
	if variable_struct_exists(_bloon.bloon_stats, "float to track") {
		var _target = instance_create_depth(_bloon.x, _bloon.y, depth, obj_bloon_target);
		with(_target) {
			path_start(_path, 0, path_action_stop, true);
			path_position = _bloon.path_position * 0.8
			//speed = _bloon.speed / 5;
			path_speed = _bloon.path_speed / 10;
			x = path_get_x(_path, 0)
			y = path_get_y(_path, 0)
		}
		with(_bloon) {
			target = _target
			speed = 0;
			path_position = _bloon.path_position * 0.8
			bloon_stats.float_height = 10;
			bloon_stats.vertical_speed = (1 + random(3));
			bloon_stats.float_gravity = 0.1;
			bloon_stats.vertical_direction = 60 + random(120);
			path_end()
			x = _xx;
			y = _yy;
		}
	}
	
	if _class == "zombie" {
		
		if !variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
			_bloon.bloon_stats.zombie_stats = variable_clone(_bloon.bloon_stats)	
		} 
	}

}