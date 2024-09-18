/// @description Insert description here
// You can write your code in this editor

path_position = target.path_position;

if point_distance(x, y, target.x, target.y) > 20 {
	var _angle = point_direction(x, y, target.x, target.y)
	direction = scr_angle_converge(_angle, direction, 3)
	speed = bloon_stats.speed * 1.5;
	//speed = lerp(speed, 0, 0.05);
} else {
	//speed = lerp(speed, bloon_stats.speed, 0.05);	
}

if path_position >= 1 {

	global.lives -= bloon_stats.rbe
	
	with (target) {
		path_position = 0;
		path_start(other.path, other.bloon_stats.speed, path_action_stop, true);
	}
	
	x = target.x;
	y = target.y;
	
}

image_angle = direction - 90;
