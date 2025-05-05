/// @description Insert description here
// You can write your code in this editor
if wait {
	wait = false;
	exit;	
}

if mouse_x > 800 {
	exit;	
}
if mouse_y < 60 || mouse_y > 540 {
	exit;	
}

x = floor(mouse_x / 16) * 16;
y = (floor((mouse_y - 60) / 16) * 16) + 60;

if collision_rectangle(x - 31, y - 31, x + 17, y + 17, obj_non_placeable_tile, false, false) {
	exit;
}

if hero and !instance_exists(button_id) {
	//instance_destroy()
	exit;
}


var _tower_id = scr_create_tower(base_tower_id, tower_stats)

with instance_create_depth(x, y, depth, obj_tower_tile) {
	tower_id = _tower_id
	x_offset = x - _tower_id.x;
	y_offet = y - _tower_id.y;
}

global.money -= tower_stats.total_cost

scr_play_sound(tower_place)

if hero {
	if instance_exists(button_id) {
		button_id.hero_placed = true;
		button_id.hero_id = _tower_id;
	}
	variable_struct_set(global.placed_towers, base_tower_id, true)
}


with(obj_non_placeable_tile) {
	image_alpha = 0;	
}

with(obj_cancel_tower) {
	instance_destroy()	
}

instance_destroy()



