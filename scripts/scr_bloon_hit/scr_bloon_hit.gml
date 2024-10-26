// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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

	_bloon.bloon_stats.health -= projectile_stats.damage;
	projectile_stats.pierce -= _bloon.bloon_stats.density;
	
	var _og_rbe = _bloon.bloon_stats.rbe;
	var _pops = 0
	var _cash_earned = 0
	
	var _children = []
	if variable_struct_exists(_bloon.bloon_stats, "children") {
		_children = _bloon.bloon_stats.children
	}
	var _pos = _bloon.path_position
	var _parent_id = _bloon.parent_id
	
	var _xx = _bloon.x
	var _yy = _bloon.y
	
	while(_bloon.bloon_stats.health <= 0) {
		
		// In the future when calculating multi-layer damage, we can give each bloon an 'rbe' value.
		// Then we subtract the original rbe by the rbe of all the remaining bloon children
		instance_destroy(_bloon);
		
		global.money += 1;
		_bloon.bloon_stats.health += 1;
		_bloon.bloon_stats.layers -= 1;
		
		//if _bloon.bloon_stats.layers < 1 || !variable_struct_exists(_bloon.bloon_stats, "children") {
		if _bloon.bloon_stats.layers < 1 {
			break;
		}
		
		for(var _i = 0; _i < array_length(_children); _i++) {
			var _layer = variable_struct_get(_children[_i], "layer")
			var _child_class = variable_struct_get(_children[_i], "class")
			
			var _class_stats = struct_get(global.bloon_stats, _child_class)
			if variable_struct_exists(_class_stats, "children") {
				_children = array_concat(_children, _class_stats.children)
			}
		}
	}
	
	for(var _i = 0; _i < array_length(_children); _i++) {
		var _layer = variable_struct_get(_children[_i], "layer")
		var _child_class = variable_struct_get(_children[_i], "class")

		with instance_create_depth(_bloon.x, _bloon.y, depth, obj_bloon) {
			scr_bloon_stat_setup(id, _child_class, _layer, [], _bloon.bloon_stats.round)
				
			path_position = _pos
			parent_id = _parent_id
			_pos -= 0.01
		}
	}
	
	if _class = "moab" {
		_bloon.path_position -= 0.003;
		if random(3) > 2 {
			with instance_create_depth(_bloon.x, _bloon.y, depth, obj_bloon) {
				scr_bloon_stat_setup(id, "normal", 1 + irandom(4))
				
				path_position = _bloon.path_position - random(0.1)
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