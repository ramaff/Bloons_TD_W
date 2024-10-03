/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(projectile_stats, "projectile_burst") {
	if projectile_stats.expire_burst_activation {
		scr_create_tower_projectiles(projectile_stats.projectile_burst, x, y)
	}
}

instance_destroy()