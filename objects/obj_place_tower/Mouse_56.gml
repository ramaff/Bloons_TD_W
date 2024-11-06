/// @description Insert description here
// You can write your code in this editor
if wait {
	wait = false;
	exit;	
}

x = floor(mouse_x / 16) * 16;
y = (floor((mouse_y - 60) / 16) * 16) + 60;

if collision_rectangle(x - 31, y - 31, x + 17, y + 17, obj_non_placeable_tile, false, false) {
	exit;
}
repeat(25) {
	var _tile = collision_rectangle(x - 31, y - 31, x + 17, y + 17, obj_placeable_tile, false, false) 
	if _tile {
		with(_tile) {
			instance_create_depth(x, y, depth, obj_non_placeable_tile);
			instance_destroy()
		}
	}
}

var _tower_id = scr_create_tower(base_tower_id, tower_stats)


global.money -= tower_stats.total_cost

if hero {
	button_id.hero_placed = true;
	button_id.hero_id = _tower_id;
}

with(obj_non_placeable_tile) {
	image_alpha = 0;	
}

with(obj_cancel_tower) {
	instance_destroy()	
}

instance_destroy()



