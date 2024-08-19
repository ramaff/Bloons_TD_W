/// @description Insert description here
// You can write your code in this editor

if tower_stats.attack_cooldown > 0 {
	tower_stats.attack_cooldown -= 1;
}

if tower_stats.attack_cooldown <= 0 {
	
	var _target = noone
	var _furthest_position = 0;
	with (obj_bloon) {
		if point_distance(x, y, other.x, other.y) <= other.tower_stats.range and path_position > _furthest_position {
			_target = id;
		}
	}
	
	if !instance_exists(_target) {
		exit;
	}
	
	tower_stats.attack_cooldown += tower_stats.delay	
	var _proj_count = array_length(tower_stats.projectile_stats)
	if _proj_count = 1 {
		_dir = 0	
	} else {
		var _dir = -15 * ((_proj_count - 1) / 2)
	}
	
	for(var _i = 0; _i < _proj_count; _i++) {

		with instance_create_depth(x,y,depth, obj_projectile) {
			projectile_stats = json_parse(json_stringify(other.tower_stats.projectile_stats[_i]))
			
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