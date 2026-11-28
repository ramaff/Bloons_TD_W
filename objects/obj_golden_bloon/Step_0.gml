// Inherit the parent event

scr_spiral_on_target()


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