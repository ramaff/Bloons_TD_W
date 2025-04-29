/// @description Insert description here
// You can write your code in this editor

alarm[2] = projectile_stats.extra_shots[0].shot_frequency;

var _angle_offset = direction;
var _tar = noone;

if variable_struct_exists(projectile_stats.extra_shots[0], "aim_at_target") {
	_tar = scr_get_bloon_target({"camo_detection": variable_struct_exists(projectile_stats, "camo_detection"), "range": 150, "damage_keys": projectile_stats.damage_keys}, x, y, projectile_stats.targeting, 0, id)
	
	if instance_exists(_tar) {
		_angle_offset = point_direction(x, y, _tar.x, _tar.y)
	}
}

scr_create_tower_projectiles(projectile_stats.extra_shots, x, y, noone, _angle_offset, {}, projectile_stats.tower_id, projectile_stats.targeting, projectile_stats.damage_keys)


