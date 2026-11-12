 /// @description Insert description here
// You can write your code in this editor

alarm[1] = 60 + (480 / bloon_stats.speed);


var _xx = x;
var _yy = y;

with(obj_projectile) {
	var _dist = distance_to_point(_xx, _yy)
	var _ang = point_direction(x, y, _xx, _yy);
	with instance_create_depth(x, y, depth - 10, obj_slash) {
		image_angle = _ang
	}
	scr_split_projectile_bad()
}

with (obj_normal_bloon) {
	var _dir = point_direction(x, y, _xx, _yy);
	with instance_create_depth(_xx, _yy, depth - 10, obj_slash) {
		image_angle = _dir
	}

	bloon_stats.tattered = true
	bloon_stats.tattered_sprite = "spr_bloon_tattered"
	scr_bloon_set_tattered(id)

	if bloon_stats.class = "ceramic" {
		bloon_stats.tattered_sprite = "spr_ceramic_tattered"
	}
	if bloon_stats.class = "lead" {
		bloon_stats.tattered_sprite = "spr_lead_tattered"
	}
	
}

scr_stun_closest_individual(1300)

/*
if instance_number(obj_bloon) <= instance_number(obj_tack_the_ripper) {
	exit;	
}

with instance_create_depth(x, y, depth, obj_bloon_slicing_ripper) {
	path_start(other.bloon_stats.path, 30, path_action_stop, true)
	other.slicer = id;
}


