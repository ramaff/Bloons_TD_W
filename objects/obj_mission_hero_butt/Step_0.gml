/// @description Insert description here
// You can write your code in this editor

var _selected_heroes = global.heroes_progress.selected

if array_length(_selected_heroes) > global.pickable_hero_slots {
	array_delete(_selected_heroes, 0, 1)
}



