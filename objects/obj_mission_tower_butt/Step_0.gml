/// @description Insert description here
// You can write your code in this editor

var _selected_towers = global.towers_progress.selected

if array_length(_selected_towers) > global.pickable_tower_slots {
	array_delete(_selected_towers, 0, 1)
}





