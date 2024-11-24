/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(projectile_stats, "projectile_burst") {
	event_perform(ev_alarm, 0)
	exit;
}

if variable_struct_exists(projectile_stats, "height") {
	var _bloon_height = 0;
	if variable_struct_exists(other.bloon_stats, "height") {
		_bloon_height = other.bloon_stats.height
	}
	if abs(projectile_stats.height - _bloon_height) > 40 {
		exit;	
	}
}

var _bloon_par_id = other.parent_id

if variable_struct_exists(projectile_stats, "bloon_pushback") {
	var _backoff = projectile_stats.bloon_pushback / power(2, other.bloon_stats.big_bloon_tier);
	other.path_position -= _backoff;	
}

//show_debug_message("damage dealer, other projectile hits: " + string(other.bloon_stats.projectile_hits))
if !variable_struct_exists(other.bloon_stats.projectile_hits, id) {
	variable_struct_set(other.bloon_stats.projectile_hits, id, id)
	//show_debug_message("damage dealer, other projectile hits: " + string(other.bloon_stats.projectile_hits))
	scr_bloon_hit(other, other.bloon_stats.class, projectile_stats);
	
	if projectile_stats.pierce <= 0 {
		instance_destroy();
	}
}
