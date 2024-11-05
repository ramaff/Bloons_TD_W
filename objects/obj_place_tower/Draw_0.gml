/// @description Insert description here
// You can write your code in this editor


var _total_range = tower_stats.range
if variable_struct_exists(tower_stats, "stat_boosts") {
	var _boosts = variable_struct_get_names(tower_stats.stat_boosts);
	for(var _i = 0; _i < array_length(_boosts); _i++) {
		var _current_boost = variable_struct_get(tower_stats.stat_boosts, _boosts[_i])
		if variable_struct_exists(_current_boost, "range_boost") {
			_total_range += _current_boost.range_boost;
		}
	}
}
	
var _scale = _total_range / 100
var _range_sprite = spr_range_circle;
if variable_struct_exists(tower_stats, "minimum_range") {
	_range_sprite = spr_range_donut;
}
draw_sprite_ext(_range_sprite, 0, x, y, _scale, _scale, 0, c_white, 1)

draw_self()

