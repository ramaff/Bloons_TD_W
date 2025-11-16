/// @description Insert description here
// You can write your code in this editor

if !instance_exists(tower_base) {
	instance_destroy()
	exit;
}

tower_base.depth = depth + 1;

if stun > 0 || global.round <= 0 {
	x = tower_base.x
	y = tower_base.y
	exit;
}


// NOTE There is a better way to write this in the future:
if variable_struct_exists(tower_stats, "stat_boosts") {
	var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
	for(var _i = 0; _i < array_length(_boosts); _i++) {
		var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
		if variable_struct_exists(_current_boost, "boost_duration") {
			if variable_struct_exists(_current_boost, "fire_rate_boost_multiplier") {
				tick_down = tick_down * current_boost.fire_rate_boost_multiplier;
			}
			if variable_struct_exists(_current_boost, "range_boost") {
				range_boost += _current_boost.range_boost;
			}
			if variable_struct_exists(_current_boost, "damage_boost") {
				current_boosts.damage_boost += _current_boost.damage_boost;
			}
			if variable_struct_exists(_current_boost, "pierce_boost") {
				current_boosts.pierce_boost += _current_boost.pierce_boost;
			}
			if variable_struct_exists(_current_boost, "speed_boost") {
				current_boosts.speed_boost += _current_boost.speed_boost;
			}
			if variable_struct_exists(_current_boost, "puncture") {
				current_boosts.puncture += _current_boost.puncture;
			}
			
			_current_boost.boost_duration--;
			
			if _current_boost.boost_duration <= 0 {
				struct_remove(tower_stats.stat_boosts, _boosts[_i])
			}
		}
	}
}

if tower_stats.barrage_count > 0 {
	tower_stats.barrage_count--;
	var _cx = x;
	var _cy = y;
	if tower_stats.barrage_count >= 1 {
		target = scr_get_bloon_target(tower_stats, x, y, targeting, range_boost)

		if instance_exists(target) and tower_stats.barrage_count < tower_stats.attack_barrages {
			event_user(0)
		}	
	}
	alarm[1] = tower_stats.barrage_delay
	if tower_stats.barrage_count = 0 {
		x = tower_base.x
		y = tower_base.y
		repeat(3) {
			_cx = lerp(_cx, x, 0.4)
			_cy = lerp(_cy, y, 0.4)
			with instance_create_depth(_cx, _cy, depth, obj_after_image) {
				sprite_index = other.sprite_index;
				image_index = other.image_index;
			}
		}
	} else {
		scr_tower_attack(tower_stats, tower_stats.projectile_stats, current_boosts, range_boost)
	}
}




