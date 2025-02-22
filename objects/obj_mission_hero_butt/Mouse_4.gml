/// @description Insert description here
// You can write your code in this editor

var _selected_heroes = global.heroes_progress.selected

if array_contains(global.added_heroes, base_tower_id) {
	exit;	
}

if array_contains(_selected_heroes, base_tower_id) {
	var _index = array_get_index(_selected_heroes, base_tower_id)
	array_delete(_selected_heroes, _index, 1)
} else {
	_selected_heroes[array_length(_selected_heroes)] = base_tower_id
	if array_length(_selected_heroes) > global.pickable_hero_slots {
		array_delete(_selected_heroes, 0, 1)
	}
}


