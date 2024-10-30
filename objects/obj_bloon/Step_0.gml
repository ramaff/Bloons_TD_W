/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(bloon_stats, "float to track") {
	
	//speed = bloon_stats.vertical_speed;
	//direction = bloon_stats.vertical_direction;
	
	bloon_stats.float_height = abs(y - target.y)
	
	bloon_stats.vertical_speed -= bloon_stats.float_gravity
	
	if bloon_stats.vertical_speed <= 0 {
		var _tar_angle = point_direction(x, y, target.x, target.y)
		var _tar_dist = point_distance(x, y, target.x, target.y)
		bloon_stats.vertical_direction = _tar_angle
		direction = _tar_angle
		speed = min(_tar_dist, abs(bloon_stats.vertical_speed))
		//y += lengthdir_y(abs(bloon_stats.vertical_speed), _tar_angle)
		//x += lengthdir_x(abs(bloon_stats.vertical_speed), _tar_angle)
		//bloon_stats.vertical_speed = min(bloon_stats.vertical_speed, _tar_dist)
		//bloon_stats.height = _tar_dist
	} else {
		y -= abs(lengthdir_y(bloon_stats.vertical_speed, bloon_stats.vertical_direction))
		x += lengthdir_x(bloon_stats.vertical_speed, bloon_stats.vertical_direction)
	}
	
	//show_debug_message("vert speed: " + string(bloon_stats.vertical_speed))
	//show_debug_message("vert speed: " + string(bloon_stats.vertical_speed))
	
	if bloon_stats.float_height < 1 and bloon_stats.vertical_speed <= 0 {
		//bloon_stats.vertical_speed = bloon_stats.vertical_speed * (-1)
		variable_struct_remove(bloon_stats, "float to track")
		
		path_start(bloon_stats.path, bloon_stats.speed, path_action_stop, true)
		path_position = target.path_position
		x = path_get_x(bloon_stats.path, path_position);
		y = path_get_y(bloon_stats.path, path_position);
		path_speed = bloon_stats.speed
		
		if instance_exists(target) {
			instance_destroy(target)	
		}
	}
}

scr_track_end_bloon_check()


