// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_apply_damage_to_bloon(_bloon_stats, _damage, _bloon = noone) {
	var _resulting_bloons = []
	_bloon_stats.health -= _damage
	
	if _bloon_stats.health <= 0 {
		global.money += 1;
		
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
			
			_resulting_bloons = array_concat(_resulting_bloons, scr_apply_damage_to_bloon(_child_stats, _remaining_damage))
		}
		if instance_exists(_bloon) {
			instance_destroy(_bloon)	
		}
	} else if _bloon = noone {
		return [_bloon_stats]	
	}
	
	return _resulting_bloons
}

function scr_bloon_hit(_bloon = other, _class = "normal"){
	
	if variable_struct_exists(_bloon.bloon_stats, "shielded") {
		if _bloon.bloon_stats.shielded {
			_bloon.bloon_stats.shield_health -= projectile_stats.damage
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
			if variable_struct_exists(projectile_stats, "lead_hit") {
				if projectile_stats.lead_hit {
					_stopped_by_lead = false;
				}
			}
		}
	}
	if _stopped_by_lead {
		instance_destroy()
		exit;
	}

	//_bloon.bloon_stats.health -= projectile_stats.damage;
	projectile_stats.pierce -= _bloon.bloon_stats.density;
	
	var _damage = projectile_stats.damage;
	
	//var _og_rbe = _bloon.bloon_stats.rbe;
	//var _pops = 0
	//var _cash_earned = 0
	
	var _pos = _bloon.path_position
	var _parent_id = _bloon.parent_id
	
	var _xx = _bloon.x
	var _yy = _bloon.y
	
	var _resulting_bloons = scr_apply_damage_to_bloon(_bloon.bloon_stats, _damage, _bloon)

	for(var _i = 0; _i < array_length(_resulting_bloons); _i++) {
		var _layer = variable_struct_get(_resulting_bloons[_i], "layer")
		var _child_class = variable_struct_get(_resulting_bloons[_i], "class")
		var _child_properties = variable_struct_get(_resulting_bloons[_i], "properties")
		
		show_debug_message(_resulting_bloons[_i])

		with instance_create_depth(_xx, _yy, depth, obj_bloon) {
			scr_bloon_stat_setup(id, _child_class, _layer, _bloon.bloon_stats.path, _child_properties, _bloon.bloon_stats.round)
				
			path_position = _pos
			x = path_get_x(path_index, path_position);
			y = path_get_y(path_index, path_position);
			parent_id = _parent_id
			_pos -= 0.01
			
			image_index = bloon_stats.index
		}
	}
	
	if _class = "moab" {
		_bloon.path_position -= 0.003;
		if random(3) > 2 {
			with instance_create_depth(_bloon.x, _bloon.y, depth, obj_bloon) {
				scr_bloon_stat_setup(id, "normal", 1 + irandom(4), _bloon.bloon_stats.path)
				
				path_position = _bloon.path_position - random(0.1)
				x = path_get_x(path_index, path_position);
				y = path_get_y(path_index, path_position);
			}	
		}
		
		if _bloon.bloon_stats.health < 130 {
			_bloon.image_index = 1;	
		}
		if _bloon.bloon_stats.health < 70 {
			_bloon.image_index = 2;	
		}
	}
	
	if _class = "bully" {
		
		if _bloon.bloon_stats.health < 4000 {
			_bloon.image_index = 1;	
		}
		if _bloon.bloon_stats.health < 3000 {
			_bloon.image_index = 2;	
		}
		if _bloon.bloon_stats.health < 2000 {
			_bloon.image_index = 3;	
		}
		if _bloon.bloon_stats.health < 1000 {
			_bloon.image_index = 4;	
		}
	}


}