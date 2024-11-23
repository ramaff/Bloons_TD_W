// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawn_ghost_monkey(_tower_stats = tower_stats){
	var _ghost_id = noone;
	with instance_create_depth(x, y, depth, obj_ghost_monkey) {
		tower_stats = variable_clone(_tower_stats)
		_ghost_id = id;
		parent_id = tower_stats.id;
	}
	variable_struct_set(ghosts, _ghost_id, _ghost_id)
}

function scr_upgrade_ghost_monkeys(_tower_stats = tower_stats) {
	with (obj_ghost_monkey) {
		if parent_id = other.id {
			tower_stats = variable_clone(_tower_stats)
		}
	}
}