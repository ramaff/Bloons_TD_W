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
		} else {
			_projectile_stats[_i].object = "obj_projectile"	
		}
		
		with instance_create_depth(x,y,depth, _projectile) {
			projectile_stats = variable_clone(_projectile_stats[_i])
			
			if instance_exists(_target) {
				if !struct_exists(projectile_stats, "direction") {
					projectile_stats.direction = point_direction(x, y, _target.x, _target.y) + _dir;
				} else {
					projectile_stats.direction += point_direction(x, y, _target.x, _target.y);
				}
			} else {
				if !struct_exists(projectile_stats, "direction") {
					projectile_stats.direction = 0
				}
			}
			direction = projectile_stats.direction
			speed = projectile_stats.speed
			sprite_index = asset_get_index(projectile_stats.sprite)
			alarm[0] = projectile_stats.lifespan
			
			projectile_stats.bloons_hit = {}
			
			if !variable_struct_exists(projectile_stats, "image_angle") {
				image_angle = direction
			}
			if variable_struct_exists(projectile_stats, "size") {
				image_xscale = projectile_stats.size
				image_yscale = projectile_stats.size
			}
			
			if projectile_stats.object = "obj_explosion_projectile" {
				var _area = (image_xscale * 100) - 50;
				repeat(projectile_stats.particles) {
					var _xxx = random(_area) - (_area / 2);
					var _yyy = random(_area) - (_area / 2);
					with instance_create_depth(x + _xxx, y + _yyy, depth, obj_particle) {
						alarm[0] = 20;
						sprite_index = spr_explosion_part
					}
				}
			}
			
		}
		_dir += 15;
	}

}