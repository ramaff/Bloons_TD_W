/// @description Insert description here
// You can write your code in this editor

var _boost_sprite = tower_stats.tower_sprite;
var _boost_sprite_priority = 0;
var _total_range = tower_stats.range
if variable_struct_exists(tower_stats, "stat_boosts") {
	var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
	for(var _i = 0; _i < array_length(_boosts); _i++) {
		var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
		if variable_struct_exists(_current_boost, "range_boost") {
			_total_range += _current_boost.range_boost;
		}
		if variable_struct_exists(_current_boost, "sprite") {
			if variable_struct_exists(_current_boost, "sprite_priority") {
				if _boost_sprite_priority < _current_boost.sprite_priority {
					_boost_sprite_priority = _current_boost.sprite_priority
					_boost_sprite = _current_boost.sprite;
				}
			} else {
				_boost_sprite = _current_boost.sprite;
			}
		}
	}
}

if abs(mouse_x - x) < 32 and abs(mouse_y - y) < 32 {
	
	
	var _scale = _total_range / 100
	var _range_sprite = spr_range_circle;
	if variable_struct_exists(tower_stats, "minimum_range") {
		_range_sprite = spr_range_donut;
	}
	draw_sprite_ext(_range_sprite, 0, x, y, _scale, _scale, 0, c_white, 1)
}

if _boost_sprite != tower_stats.tower_sprite {
	sprite_index =  asset_get_index(_boost_sprite)
} else {
	sprite_index = asset_get_index(tower_stats.tower_sprite)
}
draw_self()

if stun > 0 {
	draw_sprite(spr_tower_stun, floor(scr_wave(0, 3, 1, 0)), x, y)	
}

if variable_struct_exists(tower_stats, "abilities") {
	var _abilities = variable_struct_get_names(tower_stats.abilities);
	for (var _i = 0; _i < array_length(_abilities); _i++) {
		var _ability = variable_struct_get(tower_stats.abilities, _abilities[_i])
	
		var _xx_offset = (64 * (_ability.charge / _ability.charge_time))
	
		var _yy = 8 + 32 * _i

		//draw_sprite_part(spr_ability_ui, 0, 0, 0, _xx_offset, 64, x - 64, y + _yy)
		for(var _j = 0; _j < _ability.charges + 1; _j++) {
			if _j = _ability.charges {
				draw_sprite_part(spr_ability_ui, _j + 1, 0, 0, _xx_offset, 64, x - 32, y + _yy)
			} else {
				draw_sprite(spr_ability_ui, _j + 1, x - 32, y + _yy)
			}
		}
		draw_sprite(spr_ability_ui, 0, x - 32, y + _yy)
		if _ability.charges > 0 {
			scr_draw_outline_text(x + 32, y + _yy + 4, "x" + string(_ability.charges))	
		}
	}
}


