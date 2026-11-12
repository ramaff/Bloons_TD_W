 /// @description Insert description here
// You can write your code in this editor

alarm[1] = 60 + (480 / bloon_stats.speed);

var _dir = direction

with (obj_normal_bloon) {
	with instance_create_depth(other.x, other.y, depth - 10, obj_slash) {
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


/*
if instance_number(obj_bloon) <= instance_number(obj_tack_the_ripper) {
	exit;	
}

with instance_create_depth(x, y, depth, obj_bloon_slicing_ripper) {
	path_start(other.bloon_stats.path, 30, path_action_stop, true)
	other.slicer = id;
}


