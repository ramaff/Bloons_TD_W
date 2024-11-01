/// @description Insert description here
// You can write your code in this editor

alarm[0] = 20;

image_xscale = 2;
image_yscale = 2;

with(obj_bloon) {
	if distance_to_point(other.x, other.y) < 110 {
		//show_debug_message("healing")
		scr_bloon_regen(self, bloon_stats)	
	}
}


