/// @description Insert description here
// You can write your code in this editor

if variable_struct_exists(bloon_stats, "float to track") {
	
	speed = bloon_stats.vertical_speed;
	direction = bloon_stats.vertical_direction;
	
	y -= bloon_stats.vertical_speed
	bloon_stats.height += bloon_stats.vertical_speed
	
	bloon_stats.vertical_speed -= bloon_stats.gravity
	
	if bloon_stats.vertical_speed <= 0 {
		var _tar_angle = point_direction(x, y, target.x, target.y - bloon_stats.height)
		var _tar_dist = point_distance(x, y, target.x, target.y - bloon_stats.height)
		direction = _tar_angle
		speed = max(speed, _tar_dist)
	}
	
	if bloon_stats.height <= 0 {
		bloon_stats.vertical_speed = bloon_stats.vertical_speed * (-1)
		variable_struct_remove(bloon_stats, "float to track")
		if instance_exists(target) {
			instance_destroy()	
		}
	}
}

if path_position >= 1 {
	
	var _hero_number = irandom(instance_number(obj_hero) - 1)
	
	if !instance_exists(obj_hero) {
		if !instance_exists(obj_lose_indication) {
			instance_create_depth(10, 600, -500, obj_lose_indication)
		}
	}
	var _damage = bloon_stats.rbe
	
	with (obj_hero) {
		if _hero_number = 0 {
			tower_stats.health -= _damage
			with instance_create_depth(x, y, -100, obj_text) {
				text = "-" + string(_damage);	
			}
			if variable_struct_exists(tower_stats, "damage_scripts") {
				for(var _i = 0; _i < array_length(tower_stats.damage_scripts); _i++) {
					script_execute(tower_stats.damage_scripts[_i])
				}
			}
		}
		_hero_number--;
		if tower_stats.health <= 0 {
			instance_destroy();	
		}
		//global.lives -= bloon_stats.rbe
	}
	
	path_position = 0;
	path_start(path, bloon_stats.speed, path_action_stop, true);
	
}
