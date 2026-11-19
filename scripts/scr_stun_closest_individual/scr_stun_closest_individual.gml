function scr_stun_closest_individual(_stun_amt, _no_minions = true){

	var _target = noone
	var _min_dist = 9999

	with(obj_monkey) {
		if _no_minions {
			if object_get_parent(object_index) == obj_turret {
				continue	
			}
		}
		var _dist = distance_to_object(other)
		if _dist < _min_dist and stun <= 0 {
			_target = id;
			_min_dist = _dist
		}
	}

	with(_target) {
		stun += _stun_amt;
	}
	
	return _target



}