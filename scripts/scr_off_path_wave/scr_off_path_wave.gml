function scr_off_path_wave(_base_speed_fac = 0.5){
	path_position = target.path_position;

	var _tar_angle = point_direction(x, y, target.x, target.y)
	direction = _tar_angle + scr_wave(-90, 90, 2, 0)
	var _dist = point_distance(x, y, target.x, target.y)
	speed = bloon_stats.speed * max(_base_speed_fac, (_base_speed_fac + (_dist / 80)));
	
	return _tar_angle
}