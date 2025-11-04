
event_inherited();

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);

}

if activated {

	var _tar_dir = point_direction(x, y, path_get_x(bloon_stats.path, 1), path_get_y(bloon_stats.path, 1))

	// This mf can spiral offscreen if too fast, and the angle isn't instantly the target direction
	direction = _tar_dir

}