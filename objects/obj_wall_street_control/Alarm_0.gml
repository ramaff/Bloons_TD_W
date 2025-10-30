/// @description Insert description here
// You can write your code in this editor

alarm[0] = 120;


var _mult = 1;
var _total_investments = array_length(tower_investments)

var _i = 0;
for(_i = 0; _i < _total_investments; _i++) {
	var _tower = tower_investments[_i];
	
	var _tower_stats = variable_struct_get(global.tower_stats, _tower.base_tower_id)

	if variable_struct_exists(_tower_stats, "price_multiplier") {
		scr_multiply_tower_prices(1 / (1 + ((_tower_stats.price_multiplier - 1) / 50)), _tower_stats)
	} else {
		variable_struct_set(_tower_stats, "price_multiplier", 1);	
	}
	
	if instance_exists(_tower.id) {

		if variable_struct_exists(_tower_stats, "price_multiplier") {
			scr_multiply_tower_prices(1 / (1 + ((_tower_stats.price_multiplier - 1) / 50)), _tower.id.tower_stats)
		} else {
			variable_struct_set(_tower.id.tower_stats, "price_multiplier", 1);	
		}
		
	}
}

if instance_exists(obj_upgrade_butt) {
	with (obj_upgrade_butt) {
		if instance_exists(selected_monkey) {
			with (selected_monkey) {
				scr_select_monkey()
			}	
		}
	}
}
