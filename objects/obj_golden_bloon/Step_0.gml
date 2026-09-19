// Inherit the parent event

path_position = target.path_position;
var _ang = path_position * 3600
var _xx = lengthdir_x(190, _ang)
var _yy = lengthdir_y(190, _ang)

var _tar_angle = point_direction(x, y, target.x + _xx, target.y + _yy)
var _tar_dist = point_distance(x, y, target.x + _xx, target.y + _yy)
speed = _tar_dist / 10
//x = lerp(x, target.x + _xx, 0.1)
//y = lerp(y, target.y + _yy, 0.1)
direction = _tar_angle
//var _dist = point_distance(x, y, target.x, target.y)

if direction > 90 and direction < 270 {
	image_xscale = -1;	
} else {
	image_xscale = 1;	
}

//scr_bloon_set_speed(bloon_stats.speed + 0.01);
//target.speed = bloon_stats.speed
//target.path_speed = bloon_stats.path_speed

//image_angle = direction

event_inherited();

if bloon_stats.health < bloon_stats.max_health {
	var _amt = bloon_stats.max_health - bloon_stats.health
	global.money += _amt * 2;
	bloon_stats.health += _amt;

	with instance_create_depth(x - 10 + random(20), y - 10 + random(20), -100, obj_text) {
		text = $"+${_amt * 2}";
	}
}

if leak_frame {

	instance_destroy()
	
}