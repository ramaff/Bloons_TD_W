/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(other.bloon_stats, "damage_keys") {
	show_debug_message("other.bloon_stats.damage_keys")
	show_debug_message(other.bloon_stats.damage_keys)
	show_debug_message("projectile_stats.damage_keys")
	show_debug_message(projectile_stats.damage_keys)

	var _bloon_keys = struct_get_names(other.bloon_stats.damage_keys)
	show_debug_message("_bloon_keys")
	show_debug_message(_bloon_keys)
	var _key_count = array_length(_bloon_keys)
	var _i;
	
	for(_i = 0; _i < _key_count; _i++) {
		if !variable_struct_exists(projectile_stats.damage_keys, _bloon_keys[_i]) {
			exit
		}
	}

	/* if !array_contains_ext(projectile_stats.damage_keys, other.bloon_stats.damage_keys, true) {
		exit;	
	} */
}
/*
if variable_struct_exists(other.bloon_stats, "camo") {
	if !variable_struct_exists(projectile_stats, "camo_detection") {
		exit;
	}
} */

if variable_struct_exists(projectile_stats, "projectile_burst") {
	var _angle_offset = direction;
	scr_create_tower_projectiles(projectile_stats.projectile_burst, x, y, noone, _angle_offset, {}, projectile_stats.tower_id, projectile_stats.targeting, projectile_stats.damage_keys)
	instance_destroy()
	//event_perform(ev_alarm, 0)
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

//show_debug_message("damage dealer, other projectile hits: " + string(other.bloon_stats.projectile_hits))
// the bloon needs to keep track of the projectile id b/c all of the bloon's children need to inherit the previous projectile hits.
// However the check needs to happen/be processed by the projectile b/c there are less projectiles than bloons (usually)
var _hitable = false
if !variable_struct_exists(other.bloon_stats.projectile_hits, id) {
	_hitable = true;
}
if variable_struct_get(other.bloon_stats.projectile_hits, id) != (real(id) + projectile_stats.id_offset) {
	_hitable = true	
}
if _hitable {
	variable_struct_set(other.bloon_stats.projectile_hits, id, real(id) + projectile_stats.id_offset)
	//show_debug_message("damage dealer, other projectile hits: " + string(other.bloon_stats.projectile_hits))
	scr_bloon_hit(other, other.bloon_stats.class, projectile_stats, id);
	
	if variable_struct_exists(projectile_stats, "bloon_pushback") and other.path_position < 1 {
		var _backoff = projectile_stats.bloon_pushback / power(2, other.bloon_stats.big_bloon_tier);
		_backoff = clamp(_backoff, 0, 1)
		other.path_position -= _backoff;
		if other.path_position < 0.01 {
			other.path_position = 0.01	
		}
		if instance_exists(other.target) {
			if other.target.object_index = obj_bloon {
				if other.bloon_stats.big_bloon_tier >= other.target.bloon_stats.big_bloon_tier {
					other.target.path_position = other.path_position
				}
			}
		}
	}
	
	if projectile_stats.pierce <= 0 {
		instance_destroy();
	}
}
	
