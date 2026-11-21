var _proj = other.id

if !instance_exists(_proj) {
	exit	
}

if !variable_struct_exists(captured_ids, _proj) and _proj.speed != 0 {
	var _capped_proj = {
		id: _proj.id,
		xx: _proj.x - x,
		yy: _proj.y - y
	}
	variable_struct_set(captured_ids, _proj, _capped_proj)
	_proj.speed = 0
}

