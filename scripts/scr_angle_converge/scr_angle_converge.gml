// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_angle_converge(_target_angle, _current_angle, _converge_speed){

	var _a_diff = angle_difference(_current_angle, _target_angle);
	if abs(_a_diff) < _converge_speed {
		_current_angle = _target_angle
	} else if _a_diff < 0 {
	    _current_angle += _converge_speed;
	} else if _a_diff > 0 {
	    _current_angle -= _converge_speed;
	}	
	return _current_angle

}