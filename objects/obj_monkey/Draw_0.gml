/// @description Insert description here
// You can write your code in this editor

if abs(mouse_x - x) < 32 and abs(mouse_y - y) < 32 {
	var _scale = tower_stats.range / 100
	var _range_sprite = spr_range_circle;
	if variable_struct_exists(tower_stats, "minimum_range") {
		_range_sprite = spr_range_donut;
	}
	draw_sprite_ext(_range_sprite, 0, x, y, _scale, _scale, 0, c_white, 1)
}

draw_self()

if variable_struct_exists(tower_stats, "abilities") {
	var _abilities = variable_struct_get_names(tower_stats.abilities);
	for (var _i = 0; _i < array_length(_abilities); _i++) {
		var _ability = variable_struct_get(tower_stats.abilities, _abilities[_i])
	
		var _xx_offset = (64 * (_ability.charge / _ability.charge_time))
	
		var _yy = 32 + 32 * _i

		draw_sprite_part(spr_ability_ui, 0, 0, 0, _xx_offset, 64, x - 64, y + _yy)
		draw_sprite(spr_ability_ui, 1, x - 64, y + _yy)
	}
}


