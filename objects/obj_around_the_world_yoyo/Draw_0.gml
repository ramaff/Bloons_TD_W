/// @description Insert description here
// You can write your code in this editor




if instance_exists(projectile_stats.tower_id) {
	depth = projectile_stats.tower_id.depth - 3;
	var _xx = projectile_stats.tower_id.x + 15
	var _yy = projectile_stats.tower_id.y - 35
	
	draw_line(x, y, _xx, _yy);
}


// Inherit the parent event
event_inherited();

