/// @description Insert description here
// You can write your code in this editor


image_angle = direction

if instance_exists(projectile_stats.tower_id) {
	depth = projectile_stats.tower_id.depth - 3;
	var _xx = projectile_stats.tower_id.x
	var _yy = projectile_stats.tower_id.y
	
	draw_line_width_colour(x, y, _xx, _yy, 3, c_green, c_green);
}


// Inherit the parent event
event_inherited();

