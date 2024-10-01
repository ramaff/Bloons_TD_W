// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower_projectiles(_projectile_stats, _xx = x, _yy = y, _target = noone){
	

	var _proj_count = array_length(_projectile_stats)
	if _proj_count = 1 {
		var _dir = 0	
	} else {
		var _dir = -15 * ((_proj_count - 1) / 2)
	}
	
	for(var _i = 0; _i < _proj_count; _i++) {
		
		var _projectile = obj_projectile
		if variable_struct_exists(_projectile_stats[_i], "object") {
			_projectile = asset_get_index(_projectile_stats[_i].object)
		}

		with instance_create_depth(x,y,depth, _projectile) {
			projectile_stats = variable_clone(_projectile_stats[_i])
			
			if !struct_exists(projectile_stats, "direction") {
				projectile_stats.direction = point_direction(x, y, _target.x, _target.y) + _dir;
			}
			direction = projectile_stats.direction
			speed = projectile_stats.speed
			sprite_index = asset_get_index(projectile_stats.sprite)
			alarm[0] = projectile_stats.lifespan
			
			projectile_stats.bloons_hit = {}
			
			if !struct_exists(projectile_stats, "image_angle") {
				image_angle = direction
			}
		}
		_dir += 15;
	}

}