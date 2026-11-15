
depth = -y

if global.round > 0 {

	scr_generic_tower_pre_fire_step();

	if tower_stats.attack_cooldown <= 0 {	
		script_execute(tower_stats.tower_attack_script)
		tower_stats.attack_cooldown += tower_stats.delay
		attacked = true
	}
	scr_generic_tower_post_fire_step();
}
