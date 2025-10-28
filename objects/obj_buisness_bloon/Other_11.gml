/// @description Insert description here
// You can write your code in this editor

var _i = 0;

var _total_investments = array_length(tower_investments)

var _mult = 0.9 + random(0.225);

for(_i = 0; _i < _total_investments; _i++) {
	var _tower = tower_investments[_i].id;
	
	with(_tower) {
		
		scr_multiply_tower_prices(_mult, tower_stats)
		
		var _tower_stats = variable_struct_get(global.tower_stats, base_tower_id)
		scr_multiply_tower_prices(_mult, _tower_stats)
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



