function scr_off_path_leak(){
	if leak_frame {
	
		with (target) {
			path_position = 0;
			path_start(other.bloon_stats.path, other.bloon_stats.speed, path_action_stop, true);
		}
	
		x = target.x;
		y = target.y;
	
	}
}