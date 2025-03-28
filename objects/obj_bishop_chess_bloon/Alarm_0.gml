/// @description Insert description here
// You can write your code in this editor


alarm[0] = 300;

with instance_create_depth(x, y, depth, obj_heal_bloon_aura) {
	alarm[0] = 20;

	image_xscale = 1.3;
	image_yscale = 1.3;

	heal_amount = 50;
	heal_range = 70;

	with(obj_bloon) {
		if distance_to_point(other.x, other.y) < other.heal_range {
			scr_bloon_regen(self, bloon_stats, other.heal_amount)	
		}
	}	
}



