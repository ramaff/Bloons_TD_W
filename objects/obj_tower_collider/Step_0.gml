/// @description Insert description here
// You can write your code in this editor

var _xx = x + (hspeed * 2);
var _yy = y + (vspeed * 2);

if _xx < 0 || _xx > 800 {
	hspeed = -hspeed
	
	x += hspeed * 2;
}
if _yy < 60 || _yy > 540 {
	vspeed = -vspeed
	
	y += vspeed * 2
}

if alarm[0] < 30 {
	direction = point_direction(x, y, start_x, start_y);
	speed = point_distance(x, y, start_x, start_y) / alarm[0]
}

x = clamp(x, 0, 800)
y = clamp(y, 60, 540)


if instance_exists(target) {
	target.x = x;
	target.y = y;
	
	target.stun = max(target.stun, 10);
}

