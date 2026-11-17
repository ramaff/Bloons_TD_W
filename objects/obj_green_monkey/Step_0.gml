
depth = -y

if global.round > 0 {

	scr_generic_tower_pre_fire_step();

	if tower_stats.attack_cooldown <= 0 {	
		script_execute(tower_stats.tower_attack_script)
		tower_stats.attack_cooldown += tower_stats.delay
		attacked = true
		var _damage_keys = {}
		if variable_struct_exists(tower_stats, "damage_keys") {
			_damage_keys = tower_stats.damage_keys	
		}
		if !instance_exists(venus) and variable_struct_exists(tower_stats.active_upgrades, "Venus Bloon Trap") {	
			venus = scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)[0]
		}
		if variable_struct_exists(tower_stats.active_upgrades, "Garden Warfare") {
			if !instance_exists(venus2) {	
				venus2 = scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)[0]
			}
			if !instance_exists(venus3) {	
				venus3 = scr_create_tower_projectiles(tower_stats.projectile_stats, x, y, noone, 0, {}, id, targeting, _damage_keys)[0]
			}
		}
	}
	scr_generic_tower_post_fire_step();
}
