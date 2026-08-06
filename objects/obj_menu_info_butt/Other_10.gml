
// loop through the arrays in upgrades and split upgrades
// create upgrade buttons for each update/path
// clicking each updates the page
// assign each button the page, so they update the page

var _page = noone
with instance_create_depth(320, 70, depth, obj_menu_info_page){
	entry_sprite = other.entry_sprite
	entry_text = other.entry_text
	_page = id
}

var _i;
var _j;
var _xx = 540;
var _yy = 70;
var _m = array_length(tower_stats.upgrades)
for (_i = 0; _i < _m; _i++) {
	var _path_line_upgrades = tower_stats.upgrades[_i]
	var _n = array_length(_path_line_upgrades)
	_yy += 50;
	for (_j = 0; _j < _n; _j++) {
		var _upgrade_key = _path_line_upgrades[_j].keyword
		show_debug_message(upgrade_stats)
		var _upgrade_info = variable_struct_get(upgrade_stats, _upgrade_key)
		with instance_create_depth(_xx + (45 * _j), _yy, depth - 10, obj_menu_info_upgrade_butt) {
			page = _page
			entry_text = _upgrade_info.upgrade_string
		}
	}
}

_xx = 690;
_yy = 70;
_m = array_length(tower_stats.split_upgrades)
for (_i = 0; _i < _m; _i++) {
	var _path_line_upgrades = tower_stats.split_upgrades[_i]
	var _n = array_length(_path_line_upgrades)
	_yy += 50;
	
	var _blend = c_red
	if _i = 1 {
		_blend = c_green	
	}
	if _i = 2 {
		_blend = c_aqua	
	}
	
	for (_j = 0; _j < _n; _j++) {
		var _upgrade_key = _path_line_upgrades[_j].keyword
		//show_debug_message(upgrade_stats)
		//show_debug_message(_upgrade_key)
		if variable_struct_exists(upgrade_stats, _upgrade_key) {
			var _upgrade_info = variable_struct_get(upgrade_stats, _upgrade_key)
		
			with instance_create_depth(_xx + (45 * _j), _yy, depth - 10, obj_menu_info_upgrade_butt) {
				page = _page
				entry_text = _upgrade_info.upgrade_string
				image_blend = _blend
			}
		}
	}
}
