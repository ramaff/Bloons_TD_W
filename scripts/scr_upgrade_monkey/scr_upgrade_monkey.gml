// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_upgrade_monkey(_monkey, _new_stats) {

	var _original_value = _monkey.tower_stats.total_cost

	_monkey.tower_stats = _new_stats
	
	_monkey.tower_stats.total_cost += _new_stats.upgrade_cost

}