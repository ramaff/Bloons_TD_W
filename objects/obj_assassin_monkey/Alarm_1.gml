/// @description Insert description here
// You can write your code in this editor

var _tick_down = 1;
var _range_boost = 0;
var _current_boosts = {
	"damage_boost": 0,
	"pierce_boost": 0,
	"speed_boost": 0,
	"puncture": 0
}

// NOTE There is a better way to write this in the future:
if variable_struct_exists(tower_stats, "stat_boosts") {
	var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
	for(var _i = 0; _i < array_length(_boosts); _i++) {
		var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
		if variable_struct_exists(_current_boost, "boost_duration") {
			if variable_struct_exists(_current_boost, "fire_rate_boost_multiplier") {
				_tick_down = _tick_down * _current_boost.fire_rate_boost_multiplier;
			}
			if variable_struct_exists(_current_boost, "range_boost") {
				_range_boost += _current_boost.range_boost;
			}
			if variable_struct_exists(_current_boost, "damage_boost") {
				_current_boosts.damage_boost += _current_boost.damage_boost;
			}
			if variable_struct_exists(_current_boost, "pierce_boost") {
				_current_boosts.pierce_boost += _current_boost.pierce_boost;
			}
			if variable_struct_exists(_current_boost, "speed_boost") {
				_current_boosts.speed_boost += _current_boost.speed_boost;
			}
			if variable_struct_exists(_current_boost, "puncture") {
				_current_boosts.puncture += _current_boost.puncture;
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
		var _target = scr_get_bloon_target(tower_stats, x, y, targeting, range_boost)

		if instance_exists(_target) and tower_stats.barrage_count < tower_stats.attack_barrages {
			var _ang = _target.direction
			var _xx = lengthdir_x(50, _ang)
			var _yy = lengthdir_y(50, _ang)

			x = _target.x + _xx;
			y = _target.y + _yy;
	
			repeat(3) {
				_cx = lerp(_cx, x, 0.4)
				_cy = lerp(_cy, y, 0.4)
				with instance_create_depth(_cx, _cy, depth, obj_after_image) {
					sprite_index = other.sprite_index;
					image_index = other.image_index;
				}
			}
		}	
	}
	alarm[1] = tower_stats.barrage_delay
	if tower_stats.barrage_count = 0 {
		x = og_x
		y = og_y
		repeat(3) {
			_cx = lerp(_cx, x, 0.4)
			_cy = lerp(_cy, y, 0.4)
			with instance_create_depth(_cx, _cy, depth, obj_after_image) {
				sprite_index = other.sprite_index;
				image_index = other.image_index;
			}
		}
	} else {
		scr_tower_attack(tower_stats, _current_boosts, _range_boost)
	}
}




