// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_select_monkey(){
	
	instance_destroy(obj_tower_butt)
	
	//var _upgrade_stats = 
	for(var _j = 0; _j < array_length(tower_stats.upgrades); _j++) {
		var _upgrade_info = tower_stats.upgrades[_j][tower_stats.upgrade_count[_j]]
		var _upgrade_stats = variable_struct_get(variable_struct_get(global.upgrade_stats, base_tower_id), _upgrade_info.keyword);
		with instance_create_depth(800, 104 + (144 * _j), depth, obj_upgrade_butt) {
		
			selected_monkey = other.id;
		
			upgrade_stats = variable_clone(_upgrade_stats);
		
			upgrade_stats.upgrade_cost = _upgrade_info.upgrade_cost;
			upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 5) * 5
			path = _j;
		
		}
	}
	
	/*
	with instance_create_depth(800, 264, depth, obj_upgrade_butt) {
		
		selected_monkey = other.id;
		
		upgrade_stats = json_parse(json_stringify(other.tower_stats));
		
		upgrade_stats.upgrade_cost = upgrade_stats.total_cost * 0.6;
		upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 10) * 10
		upgrade_stats.delay = upgrade_stats.delay / 1.66;
		
		upgrade_string = "Makes the monkey shoot 66% faster"
		
	}
	
	with instance_create_depth(800, 424, depth, obj_upgrade_butt) {
		
		selected_monkey = other.id;
		
		upgrade_stats = json_parse(json_stringify(other.tower_stats));
		
		upgrade_stats.upgrade_cost = upgrade_stats.total_cost * 0.75;
		upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 10) * 10
		
		var _proj_count = array_length(upgrade_stats.projectile_stats)
		
		for(var _i = _proj_count; _i < _proj_count * 2; _i++) {
		
			upgrade_stats.projectile_stats[_i] = upgrade_stats.projectile_stats[0]
		
		}
		
		upgrade_string = "Makes the monkey throw twice as many darts"
		
	}
	*/
	
}