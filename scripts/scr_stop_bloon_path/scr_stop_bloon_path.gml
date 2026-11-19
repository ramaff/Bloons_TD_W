function scr_stop_bloon_path(){

	speed = 0;
	path_speed = 0;
	var _saved_position = path_position
	path_end()

	return _saved_position

}

function scr_start_bloon_path(_pos) {
	path_start(bloon_stats.path, bloon_stats.speed, path_action_stop, true);
	speed = bloon_stats.speed;
	path_speed = speed;
	path_position = _pos
}