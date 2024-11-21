/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
all_bases = false
stun = 0;
targeting = "first";
pop_count = 0;

alarm[0] = 60;

ghosts = {}
ghost_stats = variable_clone(tower_stats)

with instance_create_depth(x, y, depth, obj_ghost_monkey) {
	tower_stats = other.ghost_stats
}

//variable_struct_remove(tower_stats, "projectile_stats")
