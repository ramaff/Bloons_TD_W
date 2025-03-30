// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_converge(_converger, _target, _amount){
	
	if abs(_converger - _target) < _amount {
		return _target	
	}
	if _converger < _target {
		return _converger + _amount	
	} else {
		return _converger - _amount	
	}

}