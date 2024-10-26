// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_wave(_from, _to, _duration, _offset){
	var _a4 = (_to - _from) * 0.5;
	return _from + _a4 + sin((((current_time * 0.001) + _duration + _offset) / _duration) * (pi * 2)) * _a4;
}