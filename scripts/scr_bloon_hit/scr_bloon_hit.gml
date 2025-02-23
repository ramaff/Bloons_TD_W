// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_apply_damage_to_bloon(_bloon_stats, _damage, _round, _bloon = noone, _tower = noone) {
	var _resulting_bloons = []
	_bloon_stats.health -= _damage
	
	//show_debug_message("bloon stats:" + string(_bloon_stats))
	
	if _bloon_stats.health > 0 {
		if instance_exists(_tower) {
			_tower.pop_count += _damage
		}	
	}
	
	if _bloon_stats.health <= 0 {
		var _cash_flow = 1;
		if _round > 20 {
			_cash_flow = _cash_flow * 0.6;
		}
		if _round > 30 {
			_cash_flow = _cash_flow * 0.4;
		}
		if _bloon_stats.remaining_value > 0 {
			global.money += _cash_flow;
		}
		_bloon_stats.remaining_value--;
		if instance_exists(_tower) {
			_tower.pop_count++;
		}
		
		var _children = []
		if variable_struct_exists(_bloon_stats, "children") {
			_children = _bloon_stats.children
		}
		
		var _remaining_damage = 0 - _bloon_stats.health
		
		for(var _i = 0; _i < array_length(_children); _i++) {
			var _layer = variable_struct_get(_children[_i], "layer")
			var _child_class = variable_struct_get(_children[_i], "class")
			
			var _class_stats = struct_get(global.bloon_stats, _child_class)
			var _child_stats = variable_clone(struct_get(_class_stats, _layer))
			
			_child_stats.layer = _layer
			_child_stats.class = _child_class
			_child_stats.properties = []
			if variable_struct_exists(_children[_i], "properties") {
				_child_stats.properties = variable_struct_get(_children[_i], "properties")
			}
			_child_stats.properties = array_concat(_child_stats.properties, _bloon_stats.properties)
			_child_stats.remaining_value = _bloon_stats.remaining_value / array_length(_children)
			
			var _promotable = {
				"normal": true,
				"splitter": true,
				"ceramic": true,
				"lead": true,
				"peek-a-bloon": true
			}
			
			if variable_struct_exists(_promotable, _bloon_stats.class) {
				if !variable_struct_exists(_bloon_stats, "parents") {
					_child_stats.parents = [
						{
							"class": _bloon_stats.class,
							"layer": _bloon_stats.layer,
						}
					]
				} else {
					_bloon_stats.parents[array_length(_bloon_stats.parents)] = {
						"class": _bloon_stats.class,
						"layer": _bloon_stats.layer
					}
					_child_stats.parents = variable_clone(_bloon_stats.parents)
				}
			}
			
			//show_debug_message("child stats:" + string(_child_stats))
			if variable_struct_exists(_bloon_stats, "tattered") {
				var _index = array_get_index(_child_stats.properties, "tattered")
				if _index != -1 {
					array_delete(_child_stats.properties, _index, 1)
				}
			}
			if variable_struct_exists(_bloon_stats, "metallic") {
				var _index = array_get_index(_child_stats.properties, "metallic")
				if _index != -1 {
					array_delete(_child_stats.properties, _index, 1)
				}
			}
			
			if variable_struct_exists(_bloon_stats, "shielded") {
				var _index = array_get_index(_child_stats.properties, "shielded")
				if _index != -1 {
					array_delete(_child_stats.properties, _index, 1)
				}
			}
			
			_resulting_bloons = array_concat(_resulting_bloons, 
											 scr_apply_damage_to_bloon(_child_stats, _remaining_damage, _round, noone, _tower))
		}
	} else if _bloon = noone {
		return [_bloon_stats]	
	}
	
	return _resulting_bloons
}

function scr_bloon_hit(_bloon = other, _class = "normal", _projectile_stats = projectile_stats) {
	
	if variable_struct_exists(_bloon.bloon_stats, "shielded") {
		if _bloon.bloon_stats.shielded {
			_bloon.bloon_stats.shield_health -= _projectile_stats.damage
			if _bloon.bloon_stats.shield_health < 1 {
				_bloon.bloon_stats.shielded = false
				_bloon.sprite_index = asset_get_index(_bloon.bloon_stats.sprite);
			}
			_projectile_stats.pierce -= 10;
			if _projectile_stats.pierce <= 0 {
				instance_destroy();	
			}
			exit;
		}
	}
	
	var _stopped_by_lead = false;
	if variable_struct_exists(_bloon.bloon_stats, "metallic") {
		if _bloon.bloon_stats.metallic {
			_stopped_by_lead = true;
			if variable_struct_exists(_projectile_stats, "lead_hit") {
				if _projectile_stats.lead_hit {
					_stopped_by_lead = false;
				}
			}
		}
	}
	if variable_struct_exists(_bloon.bloon_stats, "freeze") {
		if _bloon.bloon_stats.freeze {
			_stopped_by_lead = true;
			if variable_struct_exists(_projectile_stats, "lead_hit") {
				if _projectile_stats.lead_hit {
					_stopped_by_lead = false;
				}
			}
		}
	}
	if _stopped_by_lead {
		instance_destroy()
		exit;
	}
	
	if variable_struct_exists(_projectile_stats, "freeze")  {
		_bloon.bloon_stats.freeze = _projectile_stats.freeze;
		_bloon.bloon_stats.freeze_time = _projectile_stats.freeze_time;
	}
	if variable_struct_exists(_projectile_stats, "goop") {
		_bloon.bloon_stats.goop = _projectile_stats.goop;
		_bloon.bloon_stats.goop_time = _projectile_stats.goop_time;
	}

	_projectile_stats.pierce -= _bloon.bloon_stats.density;
	
	var _damage = _projectile_stats.damage;
	
	var _pos = _bloon.path_position
	var _parent_id = _bloon.parent_id
	
	var _xx = _bloon.x
	var _yy = _bloon.y
	
	instance_create_depth(_xx, _yy, depth - 10, obj_pop)
	scr_play_sound(snd_pop)
	
	var _tower = noone;
	if variable_struct_exists(_projectile_stats, "tower_id") {
		_tower = _projectile_stats.tower_id
	}
	
	var _resulting_bloons = scr_apply_damage_to_bloon(_bloon.bloon_stats, _damage, _bloon.bloon_stats.round, _bloon, _tower)
	
	//show_debug_message(array_length(_resulting_bloons))
	
	if array_length(_resulting_bloons) == 0 {
		if variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
			with instance_create_depth(_xx, _yy, depth, obj_bloon_tombstone) {
				bloon_stats = _bloon.bloon_stats.zombie_stats
				path_position = _pos
			}
		}	
	}
	
	if _class = "stuffed" {
		_pos = _pos * 1.2;
	}

	for(var _i = 0; _i < array_length(_resulting_bloons); _i++) {
		var _layer = variable_struct_get(_resulting_bloons[_i], "layer")
		var _child_class = variable_struct_get(_resulting_bloons[_i], "class")
		var _child_properties = variable_struct_get(_resulting_bloons[_i], "properties")
		
		var _bloon_object = scr_bloon_class_to_object(_child_class);

		with instance_create_depth(_xx, _yy, depth, _bloon_object) {
			scr_bloon_stat_setup(id, _child_class, _layer, _bloon.bloon_stats.path, _child_properties, _bloon.bloon_stats.round)
				
			path_position = _pos
			x = path_get_x(_bloon.bloon_stats.path, path_position);
			y = path_get_y(_bloon.bloon_stats.path, path_position);
			parent_id = _parent_id
			_pos -= 0.01
			
			//show_debug_message("resulting bloon stats:" + string(_resulting_bloons[_i]))
			
			if variable_struct_exists(_resulting_bloons[_i], "parents") {
				bloon_stats.parents = _resulting_bloons[_i].parents	
			}
			
			if _child_class = "zombie" {
				if _i = 0 and variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
					bloon_stats.zombie_stats = _bloon.bloon_stats.zombie_stats
				} else {
					variable_struct_remove(bloon_stats, "zombie_stats")	
				}
			}
			if variable_struct_exists(_bloon.bloon_stats, "goop") {
				bloon_stats.goop = _bloon.bloon_stats.goop;
				bloon_stats.goop_time = _bloon.bloon_stats.goop_time;
			}
			
			bloon_stats.projectile_hits = variable_clone(_bloon.bloon_stats.projectile_hits)
			bloon_stats.remaining_value = _bloon.bloon_stats.remaining_value;
			
			alarm[0] = _bloon.alarm[0];
			if alarm[0] > 90 {
				alarm[0] = 90;	
			}
			
			if instance_exists(target) {
				target.path_position = _pos	
				target.x = path_get_x(_bloon.bloon_stats.path, path_position);
				target.y = path_get_y(_bloon.bloon_stats.path, path_position);
				
				x = _xx;
				y = _yy
			}
			
			image_index = bloon_stats.index
		}
	}
	
	if _bloon.bloon_stats.health <= 0 {
		instance_destroy(_bloon)
		exit;
	}
	
	if variable_struct_exists(_projectile_stats, "puncture") {
		if _projectile_stats.puncture > 0 {
			with instance_create_depth(x, y, _bloon.depth - 1, obj_puncture) {
				target = _bloon.id;
				puncture = _projectile_stats.puncture
				image_angle = random(360);
				og_proj_tower_id = _tower;
			}
		}
	}

}