/// @description Insert description here
// You can write your code in this editor

var _bloon_par_id = other.parent_id

if !variable_struct_exists(projectile_stats.bloons_hit, _bloon_par_id) {
	variable_struct_set(projectile_stats.bloons_hit, _bloon_par_id, _bloon_par_id)
	scr_bloon_hit(other, "bully");
	
	if projectile_stats.pierce <= 0 {
		instance_destroy()	
	}
}
