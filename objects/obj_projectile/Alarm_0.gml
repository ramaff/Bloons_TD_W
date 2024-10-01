/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(projectile_stats, "projectile_burst") {
	scr_create_tower_projectiles(projectile_stats.projectile_burst, x, y)
}

instance_destroy()