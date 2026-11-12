function scr_stun_closest_individual(_stun_amt){

	var _target = noone
	var _min_dist = 9999

	with(obj_monkey) {
		var _dist = distance_to_object(other)
		if _dist < _min_dist and stun <= 0 {
			_target = id;
			_min_dist = _dist
		}
	}

	with(_target) {
		stun += _stun_amt;
	}



}