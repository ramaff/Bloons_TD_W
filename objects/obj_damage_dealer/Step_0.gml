/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(projectile_stats, "lobbing") {
	
	y -= projectile_stats.lobbing.speed
	projectile_stats.height += projectile_stats.lobbing.speed
	
	projectile_stats.lobbing.speed -= projectile_stats.lobbing.gravity
	if projectile_stats.height <= 0 {
		projectile_stats.lobbing.speed = projectile_stats.lobbing.speed * (-1)
	}
}
if variable_struct_exists(projectile_stats, "friction") {
	
	var _min_speed = 0;
	if variable_struct_exists(projectile_stats, "min_speed") {
		_min_speed = projectile_stats.min_speed	
	}
	
	projectile_stats.speed -= projectile_stats.friction;
	projectile_stats.speed = max(projectile_stats.speed, _min_speed);
	speed = projectile_stats.speed;
	
}
if variable_struct_exists(projectile_stats, "stay_pointed") {	
	image_angle = direction
}
if variable_struct_exists(projectile_stats, "angular_velocity") {
	
	direction += projectile_stats.angular_velocity
}

if variable_struct_exists(projectile_stats, "air_burst_range") {
	if distance_to_object(obj_bloon) < projectile_stats.air_burst_range {
		var _angle_offset = direction;
		scr_create_tower_projectiles(projectile_stats.projectile_burst, x, y, noone, _angle_offset, {}, projectile_stats.tower_id, projectile_stats.targeting, projectile_stats.damage_keys)
		instance_destroy();
	}
}

if variable_struct_exists(projectile_stats, "spiral_homing_offset") {
	if !instance_exists(target) {
		target = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": 200}, x, y, projectile_stats.targeting, 0, id)
	}
	if instance_exists(target) {
		direction = scr_angle_converge(point_direction(x, y, target.x, target.y) + projectile_stats.spiral_homing_offset, direction, 20);
	}
}


