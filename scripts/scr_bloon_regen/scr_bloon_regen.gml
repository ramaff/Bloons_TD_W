// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_regen(_bloon = self, _bloon_stats = bloon_stats, _heal_amount = 1){
	
	_bloon_stats.health += _heal_amount;

	if _bloon_stats.health > _bloon_stats.max_health {
		if variable_struct_exists(_bloon_stats, "parents") and array_length(_bloon_stats.parents) > 0 {
			//show_debug_message("current parents: " + string(bloon_stats.parents))
			var _parent = _bloon_stats.parents[array_length(_bloon_stats.parents) - 1]
			var _class = _parent.class
			var _layer = _parent.layer
		
			array_delete(_bloon_stats.parents, array_length(_bloon_stats.parents) - 1, 1)
		
			var _parents = _bloon_stats.parents
		
			var _xx = x;
			var _yy = y;
			var _pos = path_position
			if instance_exists(_bloon.target) {
				instance_destroy(_bloon.target)	
			}
			scr_bloon_stat_setup(_bloon, _class, _layer, _bloon_stats.path, _bloon_stats.properties, _bloon_stats.round)
			
			
			bloon_stats.projectile_hits = variable_clone(_bloon_stats.projectile_hits)
			bloon_stats.remaining_value = _bloon_stats.remaining_value;
			bloon_stats.health = _bloon_stats.health - _bloon_stats.max_health;
			x = _xx;
			y = _yy;
			path_position = _pos;
		
			bloon_stats.parents = _parents
			
			alarm[0] = _bloon.alarm[0];
			if alarm[0] > 90 {
				alarm[0] = 90;	
			}
			
			if array_length(_bloon_stats.parents) = 0 {
				_bloon_stats.parent_id = id;	
			}
		
		} else {
			_bloon_stats.health = _bloon_stats.max_health;
		}
	}

}