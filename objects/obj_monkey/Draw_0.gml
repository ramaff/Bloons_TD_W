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


