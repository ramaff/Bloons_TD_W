/// @description Insert description here
// You can write your code in this editor

var _tower_id = scr_create_tower(base_tower_id, tower_stats)

global.money -= tower_stats.total_cost

show_debug_message(_tower_id)

if hero {
	button_id.hero_placed = true;
	button_id.hero_id = _tower_id;
}

instance_destroy()



