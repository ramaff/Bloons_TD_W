/// @description Insert description here
// You can write your code in this editor

var _selected_towers = global.towers_progress.selected

if array_contains(_selected_towers, base_tower_id) {
	var _index = array_get_index(_selected_towers, base_tower_id)
	array_delete(_selected_towers, _index, 1)
} else {
	_selected_towers[array_length(_selected_towers)] = base_tower_id
	if array_length(_selected_towers) > global.pickable_tower_slots {
		array_delete(_selected_towers, 0, 1)
	}
}


