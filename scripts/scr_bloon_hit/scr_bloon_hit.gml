// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bloon_hit(_bloon = other, _class = "normal"){

	_bloon.bloon_stats.health -= projectile_stats.damage;
	projectile_stats.pierce -= _bloon.bloon_stats.density;
	
	while(_bloon.bloon_stats.health <= 0) {
		
		global.money += 1;
		_bloon.bloon_stats.health += 1;
		_bloon.bloon_stats.layers -= 1;
		
		if _bloon.bloon_stats.layers < 1 {
		
			instance_destroy(_bloon);
			exit;
		}
	
		var _layers = _bloon.bloon_stats.layers
	
		scr_bloon_stat_setup(_bloon, _class, _layers)
	
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