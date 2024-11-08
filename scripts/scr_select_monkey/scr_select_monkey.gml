// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_select_monkey(){
	
	if !variable_struct_exists(global.upgrade_stats, base_tower_id) {
		exit;
	}
	
	instance_destroy(obj_tower_butt)
	instance_destroy(obj_upgrade_butt)
	
	var _all_normal_upgrades = true
	var _ords = ["Z", "X", "C", "V"]
	
	//var _upgrade_stats = 
	for(var _j = 0; _j < array_length(tower_stats.upgrades); _j++) {
		if tower_stats.upgrade_count[_j] >= array_length(tower_stats.upgrades[_j]) {
			continue;
		}
		_all_normal_upgrades = false;
		
		var _tower_upgrades = variable_struct_get(global.upgrade_stats, base_tower_id)
		
		var _upgrade_info = tower_stats.upgrades[_j][tower_stats.upgrade_count[_j]]
		
		if !variable_struct_exists(_tower_upgrades, _upgrade_info.keyword) {
			continue
		}
		var _upgrade_stats = variable_struct_get(_tower_upgrades, _upgrade_info.keyword);
		var _y_offset = 144 * _j
		with instance_create_depth(800, 104 + _y_offset, depth, obj_upgrade_butt) {
		
			selected_monkey = other.id;
			
			ord_key = _ords[_j];
		
			upgrade_stats = variable_clone(_upgrade_stats);
			
			if other.all_bases {
				image_index = _j + 1;
			}
		
			upgrade_stats.upgrade_cost = _upgrade_info.upgrade_cost;
			upgrade_stats.upgrade_cost = round(upgrade_stats.upgrade_cost / 5) * 5
			upgrade_stats.keyword = _upgrade_info.keyword
			path = _j;
		
		}
	}
	
	if _all_normal_upgrades and !all_bases {
		if variable_struct_exists(tower_stats, "split_upgrades") {
			tower_stats.upgrades = tower_stats.split_upgrades
			tower_stats.upgrade_count = [0, 0, 0]
			all_bases = true;
			
			scr_select_monkey()
		}
	}
	
	if instance_number(obj_upgrade_butt) <= 0 {
		scr_create_tower_buttons()
	}
	
}