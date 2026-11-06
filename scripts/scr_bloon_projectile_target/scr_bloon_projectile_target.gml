function scr_bloon_projectile_target( _range = 100, _xx = x, _yy = y){

	var _target = noone;

	with(obj_monkey) {
		if distance_to_point(_xx, _yy) < _range {
			_target = id;	
		}
	}

	return _target

}