// Inherit the parent event
event_inherited();

var _ox = x;
var _oy = y;

var _captured_projectiles = variable_struct_get_names(captured_ids)

var _total_projs = array_length(_captured_projectiles)
var _i
for(_i = 0; _i < _total_projs; _i++) {
	var _cur_proj = _captured_projectiles[_i]
	var _proj_struct = variable_struct_get(captured_ids, _cur_proj)
	if !instance_exists(_proj_struct.id) {
		variable_struct_remove(captured_ids, _cur_proj)
		continue
	}
	with _proj_struct.id {
		x = _proj_struct.xx + _ox	
		y = _proj_struct.yy + _oy
	}
}
