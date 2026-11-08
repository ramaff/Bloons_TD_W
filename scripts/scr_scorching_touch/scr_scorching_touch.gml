function scr_scorching_touch(){
	with (other) {
		if !variable_struct_exists(projectile_stats, "fire") {
			projectile_stats.fire = 2
			projectile_stats.fire_time = 120
			scr_particle_burst(1, 10, spr_projectile_singe, 15)	
		}
	}
}
