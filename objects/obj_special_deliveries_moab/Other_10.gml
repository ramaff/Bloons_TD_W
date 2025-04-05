/// @description Insert description here
// You can write your code in this editor







if stored_health > bloon_stats.max_health {
	stored_health = bloon_stats.max_health	
}

if bloon_stats.health < stored_health {
	
	var _lost_hp = ceil(stored_health - bloon_stats.health)
	
	while(_lost_hp > 0) {
		
		global.money += 1;

		with instance_create_depth(x, y, -100, obj_text) {
			text = "+$1";	
		}
		
		_lost_hp--;
	}
	
	stored_health = bloon_stats.health	
}


