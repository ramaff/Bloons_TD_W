/// @description Insert description here
// You can write your code in this editor

if abs(mouse_x - x) < 32 and abs(mouse_y - y) < 32 {
	var _scale = tower_stats.range / 100
	draw_sprite_ext(spr_range_circle, 0, x, y, _scale, _scale, 0, c_white, 1)
}

draw_self()


