// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_timer_string(_time_in_frames = 0, _show_hours = false){
	
	var _hours = 0;
	var _minutes = 0;
	var _seconds = _time_in_frames / 60
	var _part_of_second = 0;
	
	if (_seconds > 60) {
		_minutes = floor(_seconds / 60);
		_seconds = _seconds mod 60;
	}
	if (_minutes > 60) and _show_hours = true {
		_hours = floor(_minutes / 60);
		_minutes = _minutes mod 60;
	}
	
	var _hours_str = string(floor(_hours));
	var _minutes_str = string(floor(_minutes));
	var _seconds_str = string(floor(_seconds))
	if _seconds < 10 {
		_seconds_str = "0" + _seconds_str
	}
	if _minutes_str < 10 and _show_hours = true {
		_minutes_str = "0" + _minutes_str
	}
	
	var _part_of_second_str = "00"
	if frac(_seconds) > 0 {
		_part_of_second_str = string_delete(string((_time_in_frames mod 60) / 60), 1, 2)
	}
	if _show_hours = true {
		return _hours_str + ":" + _minutes_str + ":" + _seconds_str + ":" + _part_of_second_str
	}
	return _minutes_str + ":" + _seconds_str + ":" + _part_of_second_str

}