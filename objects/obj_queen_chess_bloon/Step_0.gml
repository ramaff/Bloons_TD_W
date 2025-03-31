
event_inherited();

if leak_frame {

	bloon_stats.speed = bloon_stats.speed * 1.15;
	speed = bloon_stats.speed;
	path_speed = speed;

}

if activated {

	var _tar_dir = point_direction(x, y, path_get_x(bloon_stats.path, 1), path_get_y(bloon_stats.path, 1))

	direction = scr_angle_converge(_tar_dir, direction, 1)

}