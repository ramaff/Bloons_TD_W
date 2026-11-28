// Inherit the parent event

scr_spiral_on_target(110)

event_inherited();

if saved_smackaroons == - 1 {
	saved_smackaroons = bloon_stats.max_health;	
}

if bloon_stats.health < saved_smackaroons {
	var _amt = saved_smackaroons - bloon_stats.health
	global.money += _amt;
	saved_smackaroons = bloon_stats.health

	with instance_create_depth(x - 10 + random(20), y - 10 + random(20), -100, obj_text) {
		text = $"+${_amt * 2}";
		alarm[0] = 15;
		speed = 0.5;
		direction = 90;
	}
}

scr_off_path_leak();

if leak_frame {

	scr_bloon_set_speed(bloon_stats.speed * 1.1);
}


