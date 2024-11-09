// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_apply_damage_to_bloon(_bloon_stats, _damage, _round, _bloon = noone) {
	var _resulting_bloons = []
	_bloon_stats.health -= _damage
	
	//show_debug_message("bloon stats:" + string(_bloon_stats))
	
	if _bloon_stats.health <= 0 {
		var _cash_flow = 1;
		if _round > 20 {
			_cash_flow = _cash_flow * 0.5;
		}
		global.money += _cash_flow;
		
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
			_child_stats.properties = variable_struct_get(_children[_i], "properties")
			
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
			
			//show_debug_message("child stats:" + string(_child_stats))
			
			if variable_struct_exists(_bloon_stats, "float to track") {
				_child_stats.properties[array_length(_child_stats.properties)] = "float to track"
			}
			if variable_struct_exists(_bloon_stats, "regrow") {
				_child_stats.properties[array_length(_child_stats.properties)] = "regrow"
			}
			
			_resulting_bloons = array_concat(_resulting_bloons, scr_apply_damage_to_bloon(_child_stats, _remaining_damage, _round))
		}
		/*if instance_exists(_bloon) {
			instance_destroy(_bloon)	
		} */
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
			instance_destroy()
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
	if _stopped_by_lead {
		instance_destroy()
		exit;
	}

	//_bloon.bloon_stats.health -= _projectile_stats.damage;
	_projectile_stats.pierce -= _bloon.bloon_stats.density;
	
	var _damage = _projectile_stats.damage;
	
	//var _og_rbe = _bloon.bloon_stats.rbe;
	//var _pops = 0
	//var _cash_earned = 0
	
	var _pos = _bloon.path_position
	var _parent_id = _bloon.parent_id
	
	var _xx = _bloon.x
	var _yy = _bloon.y
	
	instance_create_depth(_xx, _yy, depth - 10, obj_pop)
	
	var _resulting_bloons = scr_apply_damage_to_bloon(_bloon.bloon_stats, _damage, _bloon.bloon_stats.round, _bloon)
	
	//show_debug_message(array_length(_resulting_bloons))
	
	if array_length(_resulting_bloons) == 0 {
		if variable_struct_exists(_bloon.bloon_stats, "zombie_stats") {
			with instance_create_depth(_xx, _yy, depth, obj_bloon_tombstone) {
				bloon_stats = _bloon.bloon_stats.zombie_stats
				path_position = _pos
			}
		}	
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
			
			bloon_stats.projectile_hits = variable_clone(_bloon.bloon_stats.projectile_hits)
			
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
			}
		}
	}


}