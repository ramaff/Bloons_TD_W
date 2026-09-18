/// @description Insert description here
// You can write your code in this editor

if !variable_struct_exists(tower_stats, "road_item") {
	x = floor(mouse_x / 16) * 16;
	y = (floor((mouse_y - 60) / 16) * 16) + 60;

	x = clamp(x, 0, 800)
	y = clamp(y, 60, 540)
} else {
	x = mouse_x
	y = mouse_y
}



