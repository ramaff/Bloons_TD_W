// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_hit(_bloon = other, _class = "normal"){

	_bloon.bloon_stats.health -= projectile_stats.damage;
	projectile_stats.pierce -= _bloon.bloon_stats.density;
	
	while(_bloon.bloon_stats.health <= 0) {
		
		global.money += 1;
		_bloon.bloon_stats.health += 1;
		_bloon.bloon_stats.layers -= 1;
		
		if _bloon.bloon_stats.layers < 1 || !variable_struct_exists(_bloon.bloon_stats, "children") {
		
			instance_destroy(_bloon);
			exit;
		}
	
		//var _layers = _bloon.bloon_stats.layers
		var _children = _bloon.bloon_stats.children
		var _pos = _bloon.path_position
		
		show_debug_message(_children)
		
		for(var _i = 0; _i < array_length(_children); _i++) {
			var _layer = variable_struct_get(_children[_i], "layer")
			var _child_class = variable_struct_get(_children[_i], "class")
			
			show_debug_message(_child_class)
			show_debug_message(_layer)
	
			with instance_create_depth(_bloon.x, _bloon.y, depth, obj_bloon) {
				scr_bloon_stat_setup(id, _child_class, _layer)
				
				path_position = _pos
				_pos -= 0.02
			}
		//scr_bloon_stat_setup(_bloon, _class, _layer)
		}
		
		instance_destroy(_bloon)
	
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