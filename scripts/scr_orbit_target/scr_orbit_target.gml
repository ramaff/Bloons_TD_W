function scr_orbit_target(_ang_vel = speed){
	var _tar_x = target.x + lengthdir_x(orbit_distance, orbit_angle)
	var _tar_y = target.y + lengthdir_y(orbit_distance, orbit_angle)

	x = lerp(x, _tar_x, 0.1);
	y = lerp(y, _tar_y, 0.1);

	orbit_angle += _ang_vel;

}