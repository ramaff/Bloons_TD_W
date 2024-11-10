/// @description Insert description here
// You can write your code in this editor

if global.money < tower_stats.total_cost {
	exit;	
}

instance_destroy(obj_place_tower)

if !variable_struct_exists(global.tower_stats, base_tower_id) {
	exit;	
}

if !hero_placed {
	with instance_create_depth(800, 192, depth, obj_place_tower) {
		base_tower_id = other.base_tower_id
		tower_stats = other.tower_stats
		hero = true;
		button_id = other.id
		if variable_struct_exists(tower_stats, "tower_sprite") {
			sprite_index = asset_get_index(tower_stats.tower_sprite)
		}
	}
	
	with instance_create_depth(800, 0, depth - 100, obj_cancel_tower) {
		image_yscale = 4.25;
		image_xscale = 1.25
	}


}



