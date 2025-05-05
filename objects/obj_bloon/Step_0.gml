/// @description Insert description here
// You can write your code in this editor

leak_frame = false;

if variable_struct_exists(bloon_stats, "float to track") {
	
	bloon_stats.float_height = abs(y - target.y)
	
	bloon_stats.vertical_speed -= max(bloon_stats.float_gravity, 0.01);
	
	//show_debug_message($"x: {x}, y: {y}, float_height: {bloon_stats.float_height}, bloon_stats.vertical_speed: {bloon_stats.vertical_speed}")
	
	if bloon_stats.vertical_speed <= 0 {
		var _tar_angle = point_direction(x, y, target.x, target.y)
		var _tar_dist = point_distance(x, y, target.x, target.y)
		bloon_stats.vertical_direction = _tar_angle
		direction = _tar_angle
		speed = min(_tar_dist, abs(bloon_stats.vertical_speed))
	} else {
		y -= abs(lengthdir_y(bloon_stats.vertical_speed, bloon_stats.vertical_direction))
		x += lengthdir_x(bloon_stats.vertical_speed, bloon_stats.vertical_direction)
	}
	
	
	if bloon_stats.float_height < 1 and bloon_stats.vertical_speed <= 0 {
		variable_struct_remove(bloon_stats, "float to track")
		var _index = array_get_index(bloon_stats.properties, "float to track") 
		if _index != -1{
			array_delete(bloon_stats.properties, _index, 1)
		}
		
		if bloon_stats.path != -1 {
			path_start(bloon_stats.path, bloon_stats.speed, path_action_stop, true)
			path_position = target.path_position
			x = path_get_x(bloon_stats.path, path_position);
			y = path_get_y(bloon_stats.path, path_position);
			path_speed = bloon_stats.speed
		}
		
		if instance_exists(target) {
			instance_destroy(target)	
		}
	}
}

if variable_struct_exists(bloon_stats, "freeze") {
	
	var _move_percent = 1 - (bloon_stats.freeze / power(2, other.bloon_stats.big_bloon_tier))
	_move_percent = max(0, _move_percent);
	bloon_stats.freeze_time--;
	
	if bloon_stats.freeze_time <= 0 {
		variable_struct_remove(bloon_stats, "freeze")
		variable_struct_remove(bloon_stats, "freeze_time")
		_move_percent = 1;
	}
	
	speed = bloon_stats.speed * _move_percent;
	path_speed = bloon_stats.speed * _move_percent;
}

if variable_struct_exists(bloon_stats, "goop") {
	
	var _move_percent = 1 - ((bloon_stats.goop * 0.5) / power(2, other.bloon_stats.big_bloon_tier))
	_move_percent = max(0, _move_percent);
	bloon_stats.goop_time--;
	
	if bloon_stats.goop_time <= 0 {
		variable_struct_remove(bloon_stats, "goop")
		variable_struct_remove(bloon_stats, "goop_time")
		_move_percent = 1;
	}
	
	speed = bloon_stats.speed * _move_percent;
	path_speed = bloon_stats.speed * _move_percent;
}

if variable_struct_exists(bloon_stats, "magic_marking") {
	bloon_stats.magic_marking_time--;
	
	if bloon_stats.magic_marking_time <= 0 {
		variable_struct_remove(bloon_stats, "magic_marking")
		variable_struct_remove(bloon_stats, "magic_marking_time")
	}
}

if variable_struct_exists(bloon_stats, "fire") {
	bloon_stats.fire_time--;
	
	if bloon_stats.fire_time mod 30 = 0 {
		var _projectile_stats = {
			damage: 1,
			pierce: 10,
			tower_id: bloon_stats.fire_og_tower_id,
			camo_detection: true,
			lead_hit: true
		}
	
		scr_bloon_hit(id, bloon_stats.class, _projectile_stats);
	}
	
	if bloon_stats.fire_time <= 0 {
		variable_struct_remove(bloon_stats, "fire")
		variable_struct_remove(bloon_stats, "fire_time")
		variable_struct_remove(bloon_stats, "fire_og_tower_id")
	}
}

leak_frame = scr_track_end_bloon_check()


