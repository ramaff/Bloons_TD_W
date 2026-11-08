function scr_scorching_touch(){
	with (other) {
		if projectile_stats.pierce > 1 {
			projectile_stats.pierce--;	
		}
		/*if !variable_struct_exists(projectile_stats, "fire") {
			projectile_stats.fire = 1
			projectile_stats.fire_time = 120
		} */
		if alarm[0] > 5 {
			alarm[0] -= 5
		}
		if alarm[0] < 100 {
			image_xscale -= image_xscale * 0.1;	
			image_yscale -= image_yscale * 0.1;	
			projectile_stats.size -= projectile_stats.size * 0.5;
		}
	}
}