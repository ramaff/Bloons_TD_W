/// @description Insert description here
// You can write your code in this editor

var _selected_towers = global.towers_progress.selected

draw_self()

if array_contains(_selected_towers, base_tower_id) {
	draw_sprite(spr_tower_butt_selected, 0, x, y)
}




