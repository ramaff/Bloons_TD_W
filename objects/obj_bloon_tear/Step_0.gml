/// @description Insert description here
// You can write your code in this editor

if instance_exists(target) {
	direction = point_direction(x, y, target.x, target.y) + 67.5
	
	var _dist = point_distance(x, y, target.x, target.y)
	
	if _dist < 30 {
		target.bloon_stats.health += 2;
		target.bloon_stats.health = min(target.bloon_stats.health, target.bloon_stats.max_health)
		/*with instance_create_depth(target.x, target.y, -100, obj_text) {
			text = "+" + string(2) + "hp";
		} */
		instance_destroy()	
	}
}




