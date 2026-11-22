// Inherit the parent event

event_inherited();

var _bloon_count = array_length(consumed_bloons)
var _i;

for (_i = 0; _i < _bloon_count; _i++) {

	var _curr_bloon_stats = consumed_bloons[_i]
	
	var _class = _curr_bloon_stats.class
	var _layer = _curr_bloon_stats.layer
	var _xx = x;
	var _yy = y;
	var _bloon_object = _curr_bloon_stats.object
	var _path = bloon_stats.path
	var _properties = ["float to track"]
	var _round = bloon_stats.round
	
	var _pos = path_position;

	with instance_create_depth(_xx, _yy, depth, asset_get_index(_bloon_object)) {
		scr_bloon_stat_setup(id, _class, _layer, _path, _properties, _round)
		path_position = _pos
		bloon_stats.vertical_speed += 2 + random(4);
		bloon_stats.float_height = 50;
		bloon_stats.health = _curr_bloon_stats.health
		
		if instance_exists(target) {
			target.path_position = mean(0.8, _pos);
			target.x = path_get_x(bloon_stats.path, target.path_position);
			target.y = path_get_y(bloon_stats.path, target.path_position);
				
			x = _xx;
			y = _yy
		
			bloon_stats.vertical_direction = point_direction(x, y, target.x, target.y - 150)
		}
	}
	
}


