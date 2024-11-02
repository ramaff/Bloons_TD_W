/// @description Insert description here
// You can write your code in this editor


if alarm[2] > 0 {
	alarm[1] = 5;	
}

image_index = 1;

var _projectile_stats = {
	damage: 1,
	pierce: 999999999
}

show_debug_message(bloon_stats.health)

with instance_create_depth(x, y, -100, obj_text) {
	text = "+" + string(other.bloon_stats.max_health / 6) + "hp";
}

bloon_stats.health += bloon_stats.max_health / 6;

var _frank_id = id;

with (obj_bloon) {
	var _class = bloon_stats.class
	var _index = image_index
	
	scr_bloon_hit(id, bloon_stats.class, _projectile_stats);
	
	other.bloon_stats.health++;
	with instance_create_depth(x, y, depth, obj_bloon_tear) {
		target = _frank_id
		sprite_index = spr_bloon_tear
		image_index = _index
		speed = 3 + random(3);
		if _class = "splitter" {
			sprite_index = spr_splitter_bloon_tear;	
		}
	}
	
	instance_create_depth(x, y, depth - 100, obj_bloon_zap_from_above)
}

show_debug_message(bloon_stats.health)