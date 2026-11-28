function scr_spiral_on_target(_dist = 190){
	path_position = target.path_position;
	var _ang = path_position * 3600
	var _xx = lengthdir_x(_dist, _ang)
	var _yy = lengthdir_y(_dist, _ang)

	var _tar_angle = point_direction(x, y, target.x + _xx, target.y + _yy)
	var _tar_dist = point_distance(x, y, target.x + _xx, target.y + _yy)
	speed = _tar_dist / 10
	direction = _tar_angle

	if direction > 90 and direction < 270 {
		image_xscale = -1;	
	} else {
		image_xscale = 1;	
	}
}