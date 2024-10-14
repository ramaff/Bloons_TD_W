// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_select_monkey(){
	
	if !variable_struct_exists(global.upgrade_stats, base_tower_id) {
		exit;
	}
	
	instance_destroy(obj_tower_butt)
	
	//var _upgrade_stats = 
	for(var _j = 0; _j < array_length(tower_stats.upgrades); _j++) {
		if tower_stats.upgrade_count[_j] >= array_length(tower_stats.upgrades[_j]) {
			continue;	
		}
		
		var _tower_upgrades = variable_struct_get(global.upgrade_stats, base_tower_id)
		
		var _upgrade_info = tower_stats.upgrades[_j][tower_stats.upgrade_count[_j]]
		
		if !variable_struct_exists(_tower_upgrades, _upgrade_info.keyword) {
			continue
		}
		var _upgrade_stats = variable_struct_get(_tower_upgrades, _upgrade_info.keyword);
		//show_debug_message(_upgrade_info)
		//show_debug_message(_upgrade_stats)
		var _y_offset = 144 * max(0, _j - 1)
		with instance_create_depth(800, 104 + _y_offset, depth, obj_upgrade_butt) {
		
			selected_monkey = other.id;
		
			upgrade_stats = variable_clone(_upgrade_stats);
		
			upgrade_stats.upgrade_cost = _upgrade_info.upgrade_cost;
			upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 5) * 5
			path = _j;
		
		}
		if _j = 0 {
			break;	
		}
	}
	
}