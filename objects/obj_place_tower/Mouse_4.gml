/// @description Insert description here
// You can write your code in this editor

instance_create_depth(x, y, depth, obj_monkey) {
	base_tower_id = other.base_tower_id
	tower_stats = variable_clone(other.tower_stats)
}

global.money -= tower_stats.total_cost

instance_destroy()



