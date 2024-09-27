/// @description Insert description here
// You can write your code in this editor

if tower_stats.attack_cooldown > 0 {
	tower_stats.attack_cooldown -= 1;
}

if tower_stats.attack_cooldown <= 0 {
	
	var _target = scr_get_bloon_target(tower_stats, x, y)
	
	if !instance_exists(_target) {
		exit;
	}
	
	tower_stats.attack_cooldown += tower_stats.delay	
	scr_create_tower_projectiles(tower_stats, x, y)
	
}