/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(projectile_stats, "projectile_burst") {
	if projectile_stats.expire_burst_activation {
		var _angle_offset = 0;
		scr_create_tower_projectiles(projectile_stats.projectile_burst, x, y, noone, _angle_offset)
	}
}

instance_destroy()