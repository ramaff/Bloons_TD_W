// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_stat_setup(_bloon = self, _class = "normal", _layer = "red", _path = pth_bloon_academia, _properties = [], _round = 0, _xx = x, _yy = y) {

	var _class_stats = struct_get(global.bloon_stats, _class)
	

	_bloon.bloon_stats = variable_clone(struct_get(_class_stats, _layer))
	_bloon.bloon_stats.round = _round;
	
	_bloon.bloon_stats = scr_merge_struct(_bloon.bloon_stats, _class_stats)
	
	_bloon.bloon_stats.class = _class
	_bloon.bloon_stats.layer = _layer
	
	_bloon.bloon_stats.projectile_hits = {}
	
	target = noone;
	
	if variable_struct_exists(_class_stats, "properties") {
		_bloon.bloon_stats.properties = array_concat(_properties, _class_stats.properties)
	} else {
		_bloon.bloon_stats.properties = _properties
	}
	
	var _number_of_props = array_length(_bloon.bloon_stats.properties)
	for(var _i = 0; _i < _number_of_props; _i++) {
		variable_struct_set(_bloon.bloon_stats, _bloon.bloon_stats.properties[_i], true)
	}
	
	if !variable_struct_exists(_bloon.bloon_stats, "remaining_value") {
		_bloon.bloon_stats.remaining_value = _bloon.bloon_stats.rbe;
	}
	
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
		if _class = "ceramic" and _layer = "ceramic" {
			_bloon.bloon_stats.sprite = "spr_regrow_ceramic_bloon"
		}
		if _class = "lead" and _layer = "lead" {
			_bloon.bloon_stats.sprite = "spr_regrow_lead_bloon"
		}
		if _class = "lead" and _layer = "block" {
			_bloon.bloon_stats.sprite = "spr_regrow_block_bloon"
		}
	}
	if variable_struct_exists(_bloon.bloon_stats, "camo")  {
		_bloon.bloon_stats.sprite = "spr_camo_bloon"
		if _class = "splitter" {
			_bloon.bloon_stats.sprite = "spr_camo_splitter_bloon"
		}
		if _class = "ceramic" and _layer = "ceramic" {
			_bloon.bloon_stats.sprite = "spr_camo_ceramic_bloon"
		}
	}
	if variable_struct_exists(_bloon.bloon_stats, "sprite") {
		_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
	}
	if variable_struct_exists(_bloon.bloon_stats, "index") {
		_bloon.image_index = _bloon.bloon_stats.index
	}
	
	_bloon.bloon_stats.path = _path
	if _class = "deflation" || _class = "bee" {
		//_bloon.sprite_index = spr_big_deflation_bloon;
		var _target = instance_create_depth(x, y, depth, obj_bloon_target);
		with(_target) {
			path_position = 0;
			path_start(_path, _bloon.bloon_stats.speed, path_action_stop, true);
			x = path_get_x(_path, 0)
			y = path_get_y(_path, 0)
		}
		_bloon.target = _target
	} else if variable_struct_exists(_bloon.bloon_stats, "float to track") {
		var _target = instance_create_depth(_bloon.x, _bloon.y, depth, obj_bloon_target);
		with(_target) {
			if _path != -1 {
				path_start(_path, _bloon.path_speed / 10, path_action_stop, true);
				path_position = _bloon.path_position * 0.8
				//speed = _bloon.speed / 5;
				path_speed = _bloon.bloon_stats.speed / 10;
				speed = path_speed
				x = path_get_x(_path, 0)
				y = path_get_y(_path, 0)
			} else {
				x = _xx;
				y = _yy;
			}
		}
		with(_bloon) {
			target = _target
			speed = 0;
			path_position = _bloon.path_position * 0.8
			bloon_stats.float_height = 10;
			bloon_stats.vertical_speed = (1 + random(3));
			bloon_stats.float_gravity = 0.1;
			bloon_stats.vertical_direction = 60 + random(120);
			//path_end()
			//x = _xx;
			//y = _yy;
		}
	} else if _path != -1 {
		path_start(_path, bloon_stats.speed, path_action_stop, true);
		_xx = path_get_x(_path, 0)
		_yy = path_get_y(_path, 0)
		
		_bloon.speed = _bloon.bloon_stats.speed
		_bloon.path_speed = _bloon.speed
	}
	
	
	if variable_struct_exists(_bloon.bloon_stats, "tattered") {
		_bloon.bloon_stats.speed = _bloon.bloon_stats.speed * 2
		_bloon.speed = _bloon.bloon_stats.speed
		_bloon.path_speed = _bloon.speed
		//variable_struct_set(_bloon.bloon_stats, "tattered_sprite", _class_stats.tattered_sprite)
	}
	if variable_struct_exists(_bloon.bloon_stats, "shielded") {
		//variable_struct_set(_bloon.bloon_stats, "shielded_sprite", _class_stats.shielded_sprite)
		if variable_struct_exists(_bloon.bloon_stats, "shielded_sprite") {
			_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.shielded_sprite);
		}
		_bloon.bloon_stats.shield_health = floor(_bloon.bloon_stats.layers + sqrt(_bloon.bloon_stats.rbe - _bloon.bloon_stats.layers))
		if _class == "static" {
			_bloon.bloon_stats.shield_health += _bloon.bloon_stats.shield_health
		}
	}
	
	_bloon.depth = -sqrt(_bloon.bloon_stats.layers)
	if variable_struct_exists(_bloon.bloon_stats, "big_bloon_tier") {
		_bloon.depth = -(10 * _bloon.bloon_stats.big_bloon_tier)
	}
	if variable_struct_exists(_bloon.bloon_stats, "depth") {
		_bloon.depth = _bloon.bloon_stats.depth
	}
	if !variable_struct_exists(_bloon.bloon_stats, "max_health") {
		_bloon.bloon_stats.max_health = _bloon.bloon_stats.health;
	}
	//_bloon.bloon_stats.max_health = _bloon.bloon_stats.health;
	
	if variable_struct_exists(_bloon.bloon_stats, "stay_floating") {
		speed = 0;
		bloon_stats.speed = 0;
		path_speed = 0;	
	}
	if _path = -1 {
		//path_end()
		x = _xx;
		y = _yy;
		speed = 0;
		//bloon_stats.speed = 0;
		path_speed = 0;	
	}
	
	if _class == "zombie" {
		
		if !variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
			_bloon.bloon_stats.zombie_stats = variable_clone(_bloon.bloon_stats)	
		} 
	}
	
	if _class = "rune" and _layer = "rune" {

		with instance_create_depth(_xx, _yy, depth, obj_orbital_bloon) {
			scr_bloon_stat_setup(id, "rune", "barrier", -1, [], -1)
			speed = bloon_stats.speed;
			
			//if instance_exists(target) {
			//	instance_destroy(target)	
			//}
		
			target = _bloon.id
			bloon_stats.remaining_value = 0;
		}	
	}
	
	if variable_struct_exists(_bloon.bloon_stats, "specific_path") {
		_path = _bloon.bloon_stats.specific_path;
		bloon_stats.path = _path
		path_position = 0;
		path_start(_path, bloon_stats.speed, path_action_stop, true);
		speed = bloon_stats.speed;
		path_speed = speed;
	
	}

}