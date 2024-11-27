/// @description Insert description here
// You can write your code in this editor



var _target = scr_get_bloon_target(tower_stats, x, y, targeting, range_boost)
//var _ang = random(360);

var _cx = x;
var _cy = y;

if instance_exists(_target) and tower_stats.barrage_count < tower_stats.attack_barrages {
	var _ang = _target.direction
	var _xx = lengthdir_x(50, _ang)
	var _yy = lengthdir_y(50, _ang)

	x = _target.x + _xx;
	y = _target.y + _yy;
}



// Inherit the parent event
event_inherited();

if !attacked {
	x = _cx	
	y = _cy	
}

if !attacked and tower_stats.barrage_count <= 0 {
	x = og_x;
	y = og_y;
}