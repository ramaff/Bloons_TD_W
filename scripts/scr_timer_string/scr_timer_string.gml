// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_timer_string(_time_in_frames = 0){
	
	var _minutes = 0;
	var _seconds = _time_in_frames / 60
	var _part_of_second = 0;
	
	while (_seconds > 60) {
		_minutes += 1;
		_seconds -= 60;
	}
	
	var _minutes_str = string(floor(_minutes));
	var _seconds_str = string(floor(_seconds))
	if _seconds < 10 {
		_seconds_str = "0" + _seconds_str
	}
	var _part_of_second_str = "00"
	if frac(_seconds) > 0 {
		//show_debug_message(string(_time_in_frames * (100 / 60)))
		_part_of_second_str = string_delete(string((_time_in_frames mod 60) / 60), 1, 2)
	}
	return _minutes_str + ":" + _seconds_str + ":" + _part_of_second_str

}