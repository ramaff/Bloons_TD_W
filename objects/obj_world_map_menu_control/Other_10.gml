//var _towers = struct_get_names(global.tower_stats)
//var _heroes = ["jim", "angry_squirrel", "clown_monkey", "trickster"]
//var _towers = [""]
var _towers = struct_get_names(global.towers_progress)
var _heroes = struct_get_names(global.heroes_progress)
var _ind = array_get_index(_towers, "selected")
array_delete(_towers, _ind, 1)
_ind = array_get_index(_heroes, "selected")
array_delete(_heroes, _ind, 1)
var _tower_count = array_length(_towers)

// create 16 buttons
// if an entry is bigger than 1x1, then only the leftmost button has a sprite and is selectable for those coords
// when scrolling update the entry of the buttons by sliding the window
// don't delete or move the buttons

var _m = 2
var _n = 2

for (var _i = 0; _i < _m; _i++) {
	for (var _j = 0; _j < _n; _j++) {
		var _hero_name = _heroes[(_i * 2) + _j]
		var _hero = struct_get(global.tower_stats, _hero_name)
		with instance_create_depth(16 + (160 * _i), 96 + (80 * _j), depth, obj_menu_info_butt) {
			sprite_index = asset_get_index(_hero.butt_sprite)
			icon_sprite = sprite_index
			var _entry_text = "something"
			if variable_struct_exists(_hero, "flavor_text") {
				_entry_text = _hero.flavor_text
			}
			entry_sprite = asset_get_index(_hero.tower_sprite)
			entry_text = _entry_text
			tower_stats = _hero
			upgrade_stats = variable_struct_get(global.upgrade_stats, _hero_name)
		}
	}
}

_m = 4
_n = 4

for (var _i = 0; _i < _m; _i++) {
	for (var _j = 0; _j < _n; _j++) {
		_ind = (_j * _m) + _i
		if _ind < array_length(_towers) {
			var _tower_name = _towers[(_j * _m) + _i]
			var _tower = struct_get(global.tower_stats, _tower_name)
			with instance_create_depth(16 + (80 * _i), 256 + (80 * _j), depth, obj_menu_info_butt) {
				sprite_index = asset_get_index(_tower.butt_sprite)
				icon_sprite = sprite_index
				var _entry_text = "something"
				if variable_struct_exists(_tower, "flavor_text") {
					_entry_text = _tower.flavor_text
				}
				entry_sprite = asset_get_index(_tower.tower_sprite)
				entry_text = _entry_text
				tower_stats = _tower
				upgrade_stats = variable_struct_get(global.upgrade_stats, _tower_name)
			}
		}
	}
}
