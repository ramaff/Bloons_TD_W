/// @description Insert description here
// You can write your code in this editor

alarm[1] = 600;

with(obj_juror_bloon) {
	if sprite_index = spr_angry_juror {
		other.guilt += 1;
		with instance_create_depth(x - 10 + random(20), y - 10 + random(20), depth - 100, obj_text) {
			text = "Guilty!";
		}
	} else {
		other.guilt -= 1;
		with instance_create_depth(x - 10 + random(20), y - 10 + random(20), depth - 100, obj_text) {
			text = "Innocent!";
		}
	}
}

