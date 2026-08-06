var _classes = struct_get_names(global.bloon_stats)

var _m = 4
var _n = 5
var _ind;

for (var _i = 0; _i < _m; _i++) {
	for (var _j = 0; _j < _n; _j++) {
		_ind = (_j * _m) + _i
		if _ind < array_length(_classes) {
			var _class_name = _classes[(_j * _m) + _i]
			var _class = struct_get(global.bloon_stats, _class_name)
			show_debug_message(_class_name)
			show_debug_message(_class)
			with instance_create_depth(16 + (80 * _i), 80 + (80 * _j), depth, obj_menu_info_butt) {
				sprite_index = spr_menu_item_icon
				var _entry_text = "something"
				if variable_struct_exists(_class, "flavor_text") {
					_entry_text = _class.flavor_text
				}
				entry_sprite = asset_get_index(_class.sprite)
				icon_sprite = entry_sprite
				if variable_struct_exists(_class, "icon_sprite") {
					icon_sprite = asset_get_index(_class.icon_sprite)
				}
				
				entry_text = _entry_text
			}
		}
	}
}