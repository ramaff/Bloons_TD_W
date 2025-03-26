// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_tower_projectiles(_projectile_stats, _xx = x, _yy = y, _target = noone, _angle_offset = 0, _current_boosts = {}, _tower_id = id, _targeting = "first", _damage_keys = []) {
	

	var _proj_count = array_length(_projectile_stats)
	
	for(var _i = 0; _i < _proj_count; _i++) {
		var _shot_count = 1;
		if variable_struct_exists(_projectile_stats[_i], "projectile_count") {
			_shot_count = _projectile_stats[_i].projectile_count
		}
		if variable_struct_exists(_current_boosts, "shot_count") {
			_shot_count += _current_boosts.shot_count
		}

		var _spread = 15;
		if variable_struct_exists(_projectile_stats[_i], "projectile_spread") {
			_spread = _projectile_stats[_i].projectile_spread
		}
		if variable_struct_exists(_current_boosts, "shot_spread") {
			_spread += _current_boosts.shot_spread
		}
		
		var _dir = -_spread * ((_shot_count - 1) / 2)
		_dir += _angle_offset
		
		var _projectile = obj_projectile
		if variable_struct_exists(_projectile_stats[_i], "object") {
			_projectile = asset_get_index(_projectile_stats[_i].object)
		} else {
			_projectile_stats[_i].object = "obj_projectile"	
		}
		
		repeat(_shot_count) {
		
			with instance_create_depth(_xx,_yy,0, _projectile) {
				projectile_stats = variable_clone(_projectile_stats[_i])
				projectile_stats.tower_id = _tower_id
				
				projectile_stats.id_offset = 0;
				projectile_stats.targeting = _targeting
				
				if variable_struct_exists(_current_boosts, "damage_boost") {
					projectile_stats.damage += _current_boosts.damage_boost
				}
				if variable_struct_exists(_current_boosts, "pierce_boost") {
					projectile_stats.pierce += _current_boosts.pierce_boost
				}
				if variable_struct_exists(_current_boosts, "speed_boost") {
					projectile_stats.speed += _current_boosts.speed_boost
				}
				if variable_struct_exists(_current_boosts, "angular_velocity") {
					projectile_stats.angular_velocity = _current_boosts.angular_velocity
				}
				if variable_struct_exists(_current_boosts, "puncture") {
					if variable_struct_exists(projectile_stats, "puncture") {
						projectile_stats.puncture += _current_boosts.puncture
					} else {
						projectile_stats.puncture = _current_boosts.puncture
					}
				}
			
				if instance_exists(_target) {
					if !struct_exists(projectile_stats, "direction") {
						projectile_stats.direction = point_direction(x, y, _target.x, _target.y);
					} else {
						projectile_stats.direction += point_direction(x, y, _target.x, _target.y);
					}
				} else {
					if !struct_exists(projectile_stats, "direction") {
						projectile_stats.direction = 0
					}
				}
				direction = projectile_stats.direction + _dir
				speed = projectile_stats.speed
				sprite_index = asset_get_index(projectile_stats.sprite)
				alarm[0] = projectile_stats.lifespan
				if variable_struct_exists(projectile_stats, "tick_frequency") {
					alarm[1] = projectile_stats.tick_frequency;
				}
				if variable_struct_exists(projectile_stats, "extra_shots") {
					alarm[2] = projectile_stats.extra_shots[0].shot_frequency;
				}
				if variable_struct_exists(projectile_stats, "damage_keys") {
					projectile_stats.damage_keys = array_concat(projectile_stats.damage_keys, _damage_keys)	
				} else {
					projectile_stats.damage_keys = _damage_keys;
				}
			
				projectile_stats.bloons_hit = {}
			
				if !variable_struct_exists(projectile_stats, "image_angle") {
					image_angle = direction
				}
				if variable_struct_exists(projectile_stats, "relative_depth") {
					depth += projectile_stats.relative_depth
				}
				if variable_struct_exists(projectile_stats, "size") {
					image_xscale = projectile_stats.size
					image_yscale = projectile_stats.size
				} else {
					projectile_stats.size = 1;	
				}
				
				if projectile_stats.object = "obj_explosion_projectile" {
					image_xscale = 0.5;
					image_yscale = 0.5;
				}
			
				if projectile_stats.object = "obj_explosion_projectile_w_particles" {
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
			_dir += _spread;
		}
		
	}

}